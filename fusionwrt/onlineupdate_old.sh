#---Build by lone_wind
#检查更新
check_update () {
    #wget 'https://git.openwrt.org/?p=keyring.git;a=blob_plain;f=usign/1035ac73cc4e59e3' -O 1035ac73cc4e59e3
    #opkg-key add 1035ac73cc4e59e3
    opkg update && opkg install gzip
}
#工作目录
work_path () {
    echo -e '\e[92m当前路径为\e[0m'${PWD} && df -h
    echo -e '\e[92m请手动指定存放固件的路径\e[0m'
    echo -e '\e[91m千万不要使用/overlay\e[0m'
    read -p "输入带有“/”的路径回车 " save_path
    echo "你选择的文件夹路径为${save_path}"
}
#清理文件
clean_up() {
    rm -rf artifact openwrt-rockchip*.img.gz openwrt-rockchip*img* sha256sums* onlineupdate.sh*
}
#格式选择
version_choose () {
    echo -e '\e[92m请选择固件格式或退出\e[0m'
    echo "0 --- 退出"
    echo "1 --- Ext4"
    echo "2 --- Squashfs"
    read -p "请输入数字[0-2],回车确认 " version
    case $version in
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
            version_choose
            ;;
    esac
    machine_choose
}
#设备选择
machine_choose () {
    echo -e '\e[92m请选择设备或退出\e[0m'
    echo "0 --- 退出"
    echo "2 --- R2S"
    echo "4 --- R4S"
    read -p "请输入数字[0/2/4],回车确认 " machine
    case $machine in
        0)
            echo -e '\e[91m退出脚本，升级结束\e[0m'
            exit;
            ;;
        2)
            echo -e '\e[92m已选择R2S\e[0m'
            firmware_r2s
            ;;
        4)
            echo -e '\e[92m已选择R4S\e[0m'
            firmware_r4s
            ;;
        *)
            echo -e '\e[91m非法输入,请输入数字[0/2/4]\e[0m'
            machine_choose
            ;;
    esac
}
#R2S固件选择
firmware_r2s () {
    echo -e '\e[92m请选择版本或退出\e[0m'
    echo "0 --- Exit退出"
    echo "1 --- Docker_高大全"
    echo "2 --- Beta_高大全"
    echo "3 --- Stable_精简"
    echo "4 --- WANLAN互换_高大全"
    read -p "请输入数字[0-4],回车确认 " firmware
    case $firmware in
        0)
            echo -e '\e[91m退出脚本，升级结束\e[0m'
            exit;
            ;;
        1)
            echo -e '\e[92m已选择Docker_高大全版\e[0m'
            ;;
        2)
            echo -e '\e[92m已选择Beta_高大全版\e[0m'
            ;;
        3)
            echo -e '\e[92m已选择Stable_精简版\e[0m'
            ;;
        4)
            echo -e '\e[92m已选择网口互换_高大全版\e[0m'
            ;;
        *)
            echo -e '\e[91m非法输入,请输入数字[0-4]\e[0m'
            firmware_r2s
            ;;
    esac
}
#R4S固件选择
firmware_r4s () {
    echo -e '\e[92m请选择版本或退出\e[0m'
    echo "0 --- 退出"
    echo "1 --- Docker_高大全"
    echo "2 --- Stable_稳定精简"
    echo "3 --- Formal_正式版"
    read -p "请输入数字[0-3],回车确认 " firmware
    case $firmware in
        0)
            echo -e '\e[91m退出脚本，升级结束\e[0m'
            exit;
            ;;
        1)
            echo -e '\e[92m已选择Docker_高大全\e[0m'
            ;;
        2)
            echo -e '\e[92m已选择Stable_稳定精简\e[0m'
            ;;
        3)
            echo -e '\e[92m已选择Formal_正式版\e[0m'
            ;;
        *)
            echo -e '\e[91m非法输入,请输入数字[0-3]\e[0m'
            firmware_r4s
            ;;
    esac
}
#固件下载
download_file () {
    cd ${save_path} && clean_up && days=$(($days+1))
    echo `(date -d "@$(($(busybox date +%s) - 86400*($days-1)))" +%Y.%m.%d)`
    wget https://github.com/DHDAXCW/NanoPi-R${machine}S-2021/releases/download/$(date -d "@$(($(busybox date +%s) - 86400*($days-1)))" +%Y.%m.%d)-Lean$firmware/openwrt-rockchip-armv8-friendlyarm_nanopi-r${machine}s-${format}-sysupgrade.img.gz
    wget https://github.com/DHDAXCW/NanoPi-R${machine}S-2021/releases/download/$(date -d "@$(($(busybox date +%s) - 86400*($days-1)))" +%Y.%m.%d)-Lean$firmware/sha256sums
    exist_judge
}
#存在判断
exist_judge () {
    if [ -f openwrt-rockchip-armv8-friendlyarm_nanopi-r${machine}s-${format}-sysupgrade.img.gz ]; then
        echo -e '\e[92m固件已下载\e[0m'
        echo `(date -d "@$(($(busybox date +%s) - 86400*($days-1)))" +%Y.%m.%d)`-Lean$firmware
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
            echo "已确认"
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
    if [ -f openwrt-rockchip-armv8-friendlyarm_nanopi-r${machine}s-${format}-sysupgrade.img	]; then
        echo -e '\e[92m检查升级文件大小\e[0m'
        du -h openwrt-rockchip-armv8-friendlyarm_nanopi-r${machine}s-${format}-sysupgrade.img
    elif [ -f openwrt-rockchip-armv8-friendlyarm_nanopi-r${machine}s-${format}-sysupgrade.img.gz	]; then
        echo -e '\e[92m计算固件的sha256sum值\e[0m'
        sha256sum openwrt-rockchip-armv8-friendlyarm_nanopi-r${machine}s-${format}-sysupgrade.img.gz
        echo -e '\e[92m对比下列sha256sum值，检查固件是否完整\e[0m'
        grep ${format}-sysupgrade sha256sums
    else
        echo -e '\e[91m没有相关升级文件，请检查网络\e[0m'
        clean_up
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
    rm -rf openwrt-rockchip-armv8-friendlyarm_nanopi-r${machine}s-${format}-sysupgrade.img
    echo -e '\e[92m开始解压固件\e[0m'
    pv openwrt-rockchip-armv8-friendlyarm_nanopi-r${machine}s-${format}-sysupgrade.img.gz | gunzip -dc > openwrt-rockchip-armv8-friendlyarm_nanopi-r${machine}s-${format}-sysupgrade.img
    gunzip openwrt-rockchip-armv8-friendlyarm_nanopi-r${machine}s-${format}-sysupgrade.img.gz
    if [ -f openwrt-rockchip-armv8-friendlyarm_nanopi-r${machine}s-${format}-sysupgrade.img	]; then
        echo -e '\e[92m已解压出升级文件\e[0m'
        firmware_check
        rm -rf openwrt-rockchip-armv8-friendlyarm_nanopi-r${machine}s-${format}-sysupgrade.img.gz
    else
        echo -e '\e[91m解压固件失败\e[0m'
        clean_up;
        exit;
    fi
}
#升级系统
update_system () {
    echo -e '\e[92m开始升级系统\e[0m'
    sleep 3s
    sysupgrade -v openwrt-rockchip-armv8-friendlyarm_nanopi-r${machine}s-${format}-sysupgrade.img
}
#系统更新
update_firmware () {
    check_update    #检查更新
    work_path       #工作目录
    clean_up        #清理文件
    version_choose  #设备选择
    download_file   #固件下载
    firmware_check  #固件验证
    unzip_fireware  #解压固件
    update_system   #升级系统
}
update_firmware
