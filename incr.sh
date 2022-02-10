#Build by lone-wind
rm -rf incr.sh
#检测硬盘
hd_check () {
    hd_id='mmcblk0' && part_id='mmcblk0p3'
    if [ ! -d /sys/block/$hd_id ]; then
        hd_id='sda' && part_id='sda3'
    fi
    part_check
}
#检测分区
part_check () {
    if fdisk -l | grep -q /dev/${part_id}; then
        echo -e '\e[91m分区存在\e[0m'
    else
        echo -e '\e[92m新建分区\e[0m' && part_incr
        mkfs.ext4 -F /dev/${part_id}
    fi
}
#新建分区
part_incr () {
    block_num=$(fdisk -l | grep /dev/${hd_id}p2 | awk '{print $3}')
    fdisk /dev/${hd_id} <<EOF
    p
    n
    3
    $(($block_num+1))

    w
EOF
}
#检测文件
file_check () {
    if [ ! -d /mnt/${part_id} ]; then
        mkdir /mnt/${part_id}
    elif cat /proc/mounts | grep /dev/${part_id}; then
        /etc/init.d/dockerd restart && /etc/init.d/dockerd stop
        umount /dev/${part_id}
    fi
    mount /dev/${part_id} /mnt/${part_id}
    if [ ! -d /mnt/${part_id}/docker ]; then
        mkdir /mnt/${part_id}/docker
    fi
    /etc/init.d/dockerd start
}
#检测容器
docker_check () {
    if opkg list | grep -q "docker"; then
        if cat /etc/config/dockerd | grep -q "/mnt/${part_id}"; then
            exit;
        else
            sed -i 's?/opt?/mnt/mmcblk0p3?' /etc/config/dockerd
        fi
        /etc/init.d/dockerd restart
    fi
}
#程序开始
incr_begin () {
hd_check
file_check
docker_check
}
incr_begin
