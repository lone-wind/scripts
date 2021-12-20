#Build by lone_wind
#清理文件
clean_up () {
    rm -rf openwrt*.img* sha256sums* *update.sh*
}
#检查内存
check_tmp () {
    mount -t tmpfs -o remount,size=100% tmpfs /tmp
    real_mem=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}') && mini_mem=1572864
    if [ $real_mem -ge $mini_mem ]; then 
        work_path=/tmp
    else
        echo -e '\e[92m您的内存小于2G，暂不支持在线升级，请手动卡刷\e[0m' && exit;
    fi
}
#工作目录
work_dir () {
    echo -e '\e[92m您的内存小于2G，请挑选大于2G的分区\e[0m' && df -h
    echo -e '\e[91m请避免使用/overlay等系统分区\e[0m'
    echo -e '\e[92m建议扩容闪存介质后使用/mnt下的路径\e[0m'
    echo -e '\e[91m如果空间不够，解压镜像可能会造成系统卡死\e[0m'
    read -p "请输入上方分区中带有“/”的完整路径回车 " work_path
}
#版本选择
version_choose () {
    echo -e '\e[92m根据数字选择固件版本或退出\e[0m'
    echo "0 --- Exit退出"
    echo "1 --- Docker_容器版"
    echo "2 --- Stable_稳定版"
    echo "3 --- Formal_正式版"
    read -p "请输入数字[0-3],回车确认 " version_num
    case $version_num in
        0)
            echo -e '\e[91m退出脚本，升级结束\e[0m'
            exit;
            ;;
        1)
            echo -e '\e[92m已选择Docker_容器版\e[0m'
            ;;
        2)
            echo -e '\e[92m已选择Stable_稳定版\e[0m'
            ;;
        3)
            echo -e '\e[92m已选择Formal_正式版\e[0m'
            ;;
        *)
            echo -e '\e[91m非法输入,请输入数字[0-3]\e[0m'
            version_choose
            ;;
    esac
}
#格式选择
format_choose () {
    echo -e '\e[92m根据数字选择固件格式或退出\e[0m'
    echo "0 --- 退出"
    echo "1 --- Ext4"
    echo "2 --- Squashfs"
    read -p "请输入数字[0-2],回车确认 " format_num
    case $format_num in
        0)
            echo -e '\e[91m退出脚本，升级结束\e[0m'
            exit;
            ;;
        1)
            echo -e '\e[92m已选择EXT4格式\e[0m'
            format=ext4
            ;;
        2)
            echo -e '\e[92m已选择Squashfs格式\e[0m'
            format=squashfs
            ;;
        *)
            echo -e '\e[91m非法输入,请输入数字[0-2]\e[0m'
            format_choose
            ;;
    esac
}
#仓库选择
repo_set () {
    repo_url=https://github.com/DHDAXCW/NanoPi-R2S-2021/releases
    firmware_id=openwrt-rockchip-armv8-friendlyarm_nanopi-R2S-${format}-sysupgrade.img
}
#寻找固件
search_file () {
    cd ${work_path} && clean_up && days=$(($days+1))
    #echo `(date -d "@$(($(busybox date +%s) - 86400*($days-1)))" +%Y.%m.%d)`
    wget -q ${repo_url}/download/$(date -d "@$(($(busybox date +%s) - 86400*($days-1)))" +%Y.%m.%d)-Lean${version_num}/sha256sums
    exist_judge
}
#存在判断
exist_judge () {
    if [ -f sha256sums ]; then
        echo -e '\e[92m已找到当前日期的固件\e[0m'
        echo `(date -d "@$(($(busybox date +%s) - 86400*($days-1)))" +%Y.%m.%d)`-Lean$version_num
        firmware_confirm
    elif [ $days == 21 ]; then
        echo -e '\e[91m未找到合适固件，脚本退出\e[0m'
        exit;
    else
        #echo -e '\e[91m当前固件不存在，寻找前一天的固件\e[0m'
        search_file
    fi
}
#固件确认
firmware_confirm () {
    read -r -p "是否使用此固件? [Y/N]确认 [E]退出 " skip
    case $skip in
        [yY][eE][sS]|[yY])
            echo -e '\e[92m已确认，开始下载固件\e[0m'
            wget ${repo_url}/download/$(date -d "@$(($(busybox date +%s) - 86400*($days-1)))" +%Y.%m.%d)-Lean${version_num}/${firmware_id}.gz
            ;;
        [nN][oO]|[nN])
            echo -e '\e[91m寻找前一天的固件\e[0m'
            search_file
            ;;
        [eE][xX][iI][tT]|[eE])
            echo -e '\e[91m取消固件下载，退出升级\e[0m'
            clean_up
            exit;
            ;;
        *)
            echo -e '\e[91m请输入[Y/N]进行确认，输入[E]退出\e[0m'
            firmware_confirm
            ;;
    esac
}
#固件验证
firmware_check () {
    if [ -f ${firmware_id}  ]; then
        echo -e '\e[92m检查升级文件大小\e[0m'
        du -s -h ${firmware_id}
    elif [ -f ${firmware_id}.gz ]; then
        echo -e '\e[92m计算固件的sha256sum值\e[0m'
        sha256sum ${firmware_id}.gz
        echo -e '\e[92m对比下列sha256sum值，检查固件是否完整\e[0m'
        grep ${format}-sysupgrade sha256sums
    else
        echo -e '\e[91m没有相关升级文件，请检查网络\e[0m'
        exit;
    fi
    version_confirm
}
#版本确认
version_confirm () {
    read -p "是否确认升级? [Y/N] " confirm
    case $confirm in
        [yY][eE][sS]|[yY])
            echo -e '\e[92m已确认升级\e[0m'
            ;;
        [nN][oO]|[nN])
            echo -e '\e[91m已确认退出\e[0m'
            clean_up
            exit;
            ;;
        *)
            echo -e '\e[91m请输入[Y/N]进行确认\e[0m'
            version_confirm
            ;;
    esac
}
#解压固件
unzip_fireware () {
    echo -e '\e[92m开始解压固件\e[0m'
    gunzip ${firmware_id}.gz
    if [ -f ${firmware_id} ]; then
        echo -e '\e[92m已解压出升级文件\e[0m'
        firmware_check
    else
        echo -e '\e[91m解压固件失败\e[0m'
        clean up;
        exit;
    fi
}
#升级系统
update_system () {
    echo -e '\e[92m开始升级系统\e[0m'
    read -r -p "是否保存配置? [Y/N]确认 [E]退出 " skip
    case $skip in
        [yY][eE][sS]|[yY])
            echo -e '\e[92m已选择保存配置\e[0m'
            sysupgrade -v ${firmware_id}
            ;;
        [nN][oO]|[nN])
            echo -e '\e[91m已选择不保存配置\e[0m'
            sysupgrade -v -n ${firmware_id}
            ;;
        [eE][xX][iI][tT]|[eE])
            echo -e '\e[91m取消升级\e[0m'
            clean_up
            exit;
            ;;
        *)
            echo -e '\e[91m请输入[Y/N]进行确认，输入[E]退出\e[0m'
            update_system
            ;;
    esac
}
#系统更新
update_firmware () {
    clean_up        #清理文件
    check_tmp       #检查内存
    version_choose  #版本选择
    format_choose   #格式选择
    repo_set        #仓库设置
    search_file     #寻找固件
    firmware_check  #固件验证
    unzip_fireware  #解压固件
    update_system   #升级系统
}
update_firmware
