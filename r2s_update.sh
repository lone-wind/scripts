#Build by lone_wind
#清理文件
clean_up () {
    rm -rf openwrt*.img* sha256sums* *update.sh*
}
#扩容交换
increase_tmp () {
    mount -t tmpfs -o remount,size=100% tmpfs /tmp
}
#工作目录
work_path () {
    echo -e '\e[92m请手动指定存放固件的路径(千万不要使用/overlay)\e[0m' && df -h
    echo -e '\e[92m2G内存以下需要扩容tf卡，2G内存以上可使用/tmp\e[0m'
    echo -e '\e[91m如果空间不够，解压镜像可能会造成系统卡死\e[0m'
    read -p "输入带有“/”的绝对路径回车 " work_path
    echo "你选择的文件夹路径为${work_path}"
}
#版本选择
version_choose () {
    echo -e '\e[92m输入对应数字选择版本或退出\e[0m'
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
    echo -e '\e[92m请选择固件格式或退出\e[0m'
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
#固件下载
download_file () {
    cd ${work_path} && clean_up && days=$(($days+1))
    echo `(date -d "@$(($(busybox date +%s) - 86400*($days-1)))" +%Y.%m.%d)`
    wget https://github.com/DHDAXCW/NanoPi-R2S-2021/releases/download/$(date -d "@$(($(busybox date +%s) - 86400*($days-1)))" +%Y.%m.%d)-Lean${version_num}/sha256sums
    exist_judge
}
#存在判断
exist_judge () {
    if [ -f sha256sums ]; then
        echo -e '\e[92m已找到当前日期的固件\e[0m'
        echo `(date -d "@$(($(busybox date +%s) - 86400*($days-1)))" +%Y.%m.%d)`-Lean$version_num
        version_skip
    elif [ $days == 21 ]; then
        echo -e '\e[91m未找到合适固件，脚本退出\e[0m'
        exit;
    else
        echo -e '\e[91m当前固件不存在，寻找前一天的固件\e[0m'
        download_file
    fi
}
#跳过固件
version_skip () {
    read -r -p "是否使用此固件? [Y/N]确认 [E]退出 " skip
    case $skip in
        [yY][eE][sS]|[yY])
            echo "已确认，开始下载固件"
            wget https://github.com/DHDAXCW/NanoPi-R2S-2021/releases/download/$(date -d "@$(($(busybox date +%s) - 86400*($days-1)))" +%Y.%m.%d)-Lean${version_num}/openwrt-rockchip-armv8-friendlyarm_nanopi-R2S-${format}-sysupgrade.img.gz
            ;;
        [nN][oO]|[nN])
            echo -e '\e[91m寻找前一天的固件\e[0m'
            download_file
            ;;
        [eE][xX][iI][tT]|[eE])
            echo -e '\e[91m取消固件下载，退出升级\e[0m'
            clean_up
            exit;
            ;;
        *)
            echo -e '\e[91m请输入[Y/N]进行确认，输入[E]退出\e[0m'
            version_skip
            ;;
    esac
}
#固件验证
firmware_check () {
    if [ -f openwrt-rockchip-armv8-friendlyarm_nanopi-R2S-${format}-sysupgrade.img  ]; then
        echo -e '\e[92m检查升级文件大小\e[0m'
        du -s -h openwrt-rockchip-armv8-friendlyarm_nanopi-R2S-${format}-sysupgrade.img
    elif [ -f openwrt-rockchip-armv8-friendlyarm_nanopi-R2S-${format}-sysupgrade.img.gz ]; then
        echo -e '\e[92m计算固件的sha256sum值\e[0m'
        sha256sum openwrt-rockchip-armv8-friendlyarm_nanopi-R2S-${format}-sysupgrade.img.gz
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
    gunzip openwrt-rockchip-armv8-friendlyarm_nanopi-R2S-${format}-sysupgrade.img.gz
    if [ -f openwrt-rockchip-armv8-friendlyarm_nanopi-R2S-${format}-sysupgrade.img ]; then
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
            sysupgrade -v openwrt-rockchip-armv8-friendlyarm_nanopi-R2S-${format}-sysupgrade.img
            ;;
        [nN][oO]|[nN])
            echo -e '\e[91m已选择不保存配置\e[0m'
            sysupgrade -v -n openwrt-rockchip-armv8-friendlyarm_nanopi-R2S-${format}-sysupgrade.img
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
    increase_tmp    #扩容交换
    work_path       #工作目录
    version_choose  #版本选择
    format_choose   #格式选择
    download_file   #固件下载
    firmware_check  #固件验证
    unzip_fireware  #解压固件
    update_system   #升级系统
}
update_firmware
