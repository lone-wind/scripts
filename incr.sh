#!/bin/bash
#Build by lone-wind
rm -rf incr.sh
#检测硬盘
hd_check () {
    if [ ! -d /sys/block/mmcblk ]; then
        hd_id=$(df | grep /dev/mmcblk | tail -n1 | awk '{print substr($1, 6, length($1)-7)}')
    elif [ ! -d /sys/block/sd ]; then
        hd_id=$(df | grep /dev/sd | tail -n1 | awk '{print substr($1, 6, length($1)-6)}')
    else 
        echo -e '\e[91m无法识别硬盘，退出\e[0m' && exit;
    fi
    part_id=$(df | grep /dev/${hd_id} | tail -n1 | awk '{print substr($1, 6, length($1)-5)}')
    part_check
}
#检测分区
part_check () {
    if fdisk -l | grep -q /dev/${part_id}; then
        echo -e '\e[92m分区正常\e[0m'
    else
        echo -e '\e[91m分区异常，开始修改\e[0m'
        if lscpu | grep -i -q arm; then
            part_incr_arm
        else
            part_incr_x86
        fi
    fi
}
#新建分区
part_incr_x86 () {
    block_num=$(fdisk -l | grep /dev/${hd_id}p2 | awk '{print $3}')
    fdisk /dev/${hd_id} <<EOF
    n
    3
    $(($block_num+1))

    w
EOF
}
part_incr_arm () {
    block_num=$(fdisk -l | grep /dev/${hd_id}p2 | awk '{print $3}')
    fdisk /dev/${hd_id} <<EOF
    n
    p
    3
    $(($block_num+1))

    w
EOF
}
#检测文件
file_check () {
    if cat /proc/mounts | grep -q /mnt/${part_id}\ ext4; then
        echo -e '\e[92m新挂载点正常\e[0m'
        continue;
    else
        echo -e '\e[91m新挂载点异常，开始修改\e[0m'
        if opkg list | grep -q "docker"; then
            if /etc/init.d/dockerd status | grep -q "running"; then
                /etc/init.d/dockerd stop
            fi
        fi
        if cat /proc/mounts | grep -q "/dev/${part_id}"; then
            umount /dev/${part_id}
        fi
        mkfs.ext4 -F /dev/${part_id}
        if [ ! -d /mnt/${part_id} ] && [ ! -d /mnt/${part_id}/docker ]; then
            mkdir /mnt/${part_id}
            mkdir /mnt/${part_id}/docker
        fi
        mount /dev/${part_id} /mnt/${part_id}
    fi
}
#检测容器
docker_check () {
    if opkg list | grep -q "docker"; then
        if cat /etc/config/dockerd | grep -q "/mnt/${part_id}"; then
            echo -e '\e[92mDocker根目录正常\e[0m'
            continue;
        else
            echo -e '\e[91mDocker根目录异常，开始修改\e[0m'
            docker_id=$(cat /etc/config/dockerd | grep data_root | awk '{print substr($3, 2, length($3)-10)}')
            sed -i "s?${docker_id}?/mnt/${part_id}?" /etc/config/dockerd
            if /etc/init.d/dockerd status | grep -q "inactive"; then
                /etc/init.d/dockerd start
            fi
        fi
    fi
}
#程序开始
incr_begin () {
hd_check
file_check
docker_check
sleep 5
echo -e '\e[92m脚本结束，请查看分区\e[0m'
df -h | grep /dev/${part_id}
}

incr_begin
