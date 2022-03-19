#!/bin/bash
#Build by lone_wind
#清理文件
clean_up () {
    rm -rf openwrt*.img* ${img_path}/openwrt*.img* sha256sums* *update.sh*
}
#容器检查
docker_check () {
    if opkg list | grep -q "docker"; then
        /etc/init.d/dockerd stop
    fi
}
#版本选择
version_choose () {
    echo -e '\e[92m根据数字选择固件版本或退出\e[0m'
    echo -e '0 --- Exit退出\n1 --- Docker_容器版\n2 --- Stable_稳定版\n3 --- Formal_正式版'
    read -p "请输入数字[0-3],回车确认 " version_num
    case $version_num in
        0)
            echo -e '\e[91m退出脚本，升级结束\e[0m' && exit;
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
            echo -e '\e[91m非法输入,请输入数字[0-3]\e[0m' && version_choose
            ;;
    esac
}
#格式选择
format_choose () {
    echo -e '\e[92m根据数字选择固件格式或退出\e[0m'
    echo -e '0 --- 退出\n1 --- Ext4\n2 --- Squashfs'
    read -p "请输入数字[0-2],回车确认 " format_num
    case $format_num in
        0)
            echo -e '\e[91m退出脚本，升级结束\e[0m' && exit;
            ;;
        1)
            echo -e '\e[92m已选择EXT4格式\e[0m' && format=ext4
            ;;
        2)
            echo -e '\e[92m已选择Squashfs格式\e[0m' && format=squashfs
            ;;
        *)
            echo -e '\e[91m非法输入,请输入数字[0-2]\e[0m' && format_choose
            ;;
    esac
}
#仓库选择
repo_set () {
    proxy_url=https://ghproxy.com
    repo_url=https://github.com/DHDAXCW/NanoPi-R4S-2021/releases
    firmware_id=openwrt-rockchip-armv8-friendlyarm_nanopi-R4S-${format}-sysupgrade.img
}
#寻找固件
search_file () {
    cd ${work_path} && clean_up && days=$(($days+1))
    #echo `(date -d "@$(($(busybox date +%s) - 86400*($days-1)))" +%Y.%m.%d)`
    wget -q ${proxy_url}/${repo_url}/download/$(date -d "@$(($(busybox date +%s) - 86400*($days-1)))" +%Y.%m.%d)-Lean${version_num}/sha256sums
    exist_judge
}
#存在判断
exist_judge () {
    if [ -f sha256sums ]; then
        echo -e '\e[92m已找到当前日期的固件\e[0m' && echo `(date -d "@$(($(busybox date +%s) - 86400*($days-1)))" +%Y.%m.%d)`-Lean$version_num
        firmware_confirm
    elif [ $days == 21 ]; then
        echo -e '\e[91m未找到合适固件，脚本退出\e[0m' && exit;
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
            wget ${proxy_url}/${repo_url}/download/$(date -d "@$(($(busybox date +%s) - 86400*($days-1)))" +%Y.%m.%d)-Lean${version_num}/${firmware_id}.gz
            ;;
        [nN][oO]|[nN])
            echo -e '\e[91m寻找前一天的固件\e[0m' && search_file
            ;;
        [eE][xX][iI][tT]|[eE])
            echo -e '\e[91m取消固件下载，退出升级\e[0m' && clean_up && exit;
            ;;
        *)
            echo -e '\e[91m请输入[Y/N]进行确认，输入[E]退出\e[0m' && firmware_confirm
            ;;
    esac
}
#固件验证
firmware_check () {
    if [ -f ${img_path}/${firmware_id}  ]; then
        echo -e '\e[92m检查升级文件大小\e[0m' && du -sh ${img_path}/${firmware_id}
    elif [ -f ${firmware_id}.gz ]; then
        echo -e '\e[92m计算固件的sha256sum值\e[0m' && sha256sum ${firmware_id}.gz
        echo -e '\e[92m对比下列sha256sum值，检查固件是否完整\e[0m' && grep -i ${firmware_id}.gz sha256sums
    else
        echo -e '\e[91m没有相关升级文件，请检查网络\e[0m' && exit;
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
            echo -e '\e[91m已确认退出\e[0m' && clean_up && exit;
            ;;
        *)
            echo -e '\e[91m请输入[Y/N]进行确认\e[0m' && version_confirm
            ;;
    esac
}
#解压固件
unzip_fireware () {
    echo -e '\e[92m开始解压固件\e[0m' && gzip -cd ${firmware_id}.gz > ${img_path}/${firmware_id}
    if [ -f ${img_path}/${firmware_id} ]; then
        echo -e '\e[92m已解压出升级文件\e[0m' && firmware_check
    else
        echo -e '\e[91m解压固件失败\e[0m' && clean_up && exit;
    fi
}
#升级系统
update_system () {
    echo -e '\e[92m开始升级系统\e[0m'
    read -r -p "是否保存配置? [Y/N]确认 [E]退出 " skip
    case $skip in
        [yY][eE][sS]|[yY])
            echo -e '\e[92m已选择保存配置\e[0m' && sysupgrade -F ${firmware_id}
            ;;
        [nN][oO]|[nN])
            echo -e '\e[91m已选择不保存配置\e[0m' && sysupgrade -F -n ${firmware_id}
            ;;
        [eE][xX][iI][tT]|[eE])
            echo -e '\e[91m取消升级\e[0m' && clean_up && exit;
            ;;
        *)
            echo -e '\e[91m请输入[Y/N]进行确认，输入[E]退出\e[0m' && update_system
            ;;
    esac
}
#刷写系统
dd_system () {
    echo -e '\e[92m开始升级系统\e[0m'
    dd if=${img_path}/${firmware_id} of=$(hd_id)
    reboot
}
#系统更新
update_firmware () {
    img_path=/tmp && clean_up && docker_check
    mount -t tmpfs -o remount,size=100% tmpfs /tmp
    real_mem=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}') && mini_mem=1572864
    if [ $real_mem -ge $mini_mem ]; then 
        work_path=/tmp && version_choose
        format_choose && repo_set && search_file && firmware_check && unzip_fireware
        update_system
    else
        echo -e '\e[91m您的内存小于2G，升级将不保留配置\e[0m'
        work_path=/root && version_num=2
        format_choose && repo_set && search_file && firmware_check && unzip_fireware
        hd_id=$(df / | tail -n1 | awk '{print $1}' | awk '{print substr($1, 1, length($1)-2)}')
        dd_system
    fi
}

update_firmware
