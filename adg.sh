#Build by lone-wind
#设定容器目录
work_path () {
    echo -e '\e[92m当前路径为\e[0m'${PWD} && df -h
    echo -e '\e[92m请手动指定存放容器的路径\e[0m'
    read -p "输入带有“/”的路径回车 " save_path
    echo "你选择的绝对路径为${save_path}"
}
#创建工作目录
build_files () {
    echo -e '\e[92m开始创建ADG文件夹\e[0m'
    mkdir ${save_path}/adg
    mkdir ${save_path}/adg/workdir1
    mkdir ${save_path}/adg/confdir1
    mkdir ${save_path}/adg/workdir2
    mkdir ${save_path}/adg/confdir2
    echo -e '\e[91m请检查文件夹是否创建完毕\e[0m'
    ls ${save_path}/adg/
}
#创建/更新 容器1
build_adg1 () {
    echo -e '\e[92m开始创建/更新ADG容器1\e[0m'
    docker stop adguardhome1
    docker rm adguardhome1
    docker pull  adguard/adguardhome:latest
    docker image prune -f
    docker run --name adguardhome1 \
        -v ${save_path}/adg/workdir1:/opt/adguardhome/work \
        -v ${save_path}/adg/confdir1:/opt/adguardhome/conf \
        --restart=always \
        --net=host \
        -d adguard/adguardhome:latest
    echo -e '\e[91m请设置/完善该容器后，再操作另一容器\e[0m'
    echo -e '\e[92m首次设置，使用浏览器访问 ip:3000\e[0m'
}
#创建/更新 容器2
build_adg2 () {
    echo -e '\e[92m开始创建/更新ADG容器2\e[0m'
    docker stop adguardhome2
    docker rm adguardhome2
    docker pull  adguard/adguardhome:latest
    docker image prune -f
    docker run --name adguardhome2 \
        -v ${save_path}/adg/workdir2:/opt/adguardhome/work \
        -v ${save_path}/adg/confdir2:/opt/adguardhome/conf \
        --restart=always \
        --net=host \
        -d adguard/adguardhome:latest
    echo -e '\e[91m请设置/完善该容器后，再操作另一容器\e[0m'
    echo -e '\e[92m首次设置，使用浏览器访问 ip:3000\e[0m'
}
#功能选择
work_choose () {
    echo -e '\e[92m请选择功能或退出\e[0m'
    echo "0 --- 退出"
    echo "1 --- 设定容器目录"
    echo "2 --- 创建工作目录"
    echo "3 --- 创建/更新 ADG容器1"
    echo "4 --- 创建/更新 ADG容器2"
    read -p "请输入数字[0-4],回车确认 " works
    case $works in
        0)
            echo -e '\e[91m退出脚本，结束操作\e[0m'
            exit;
            ;;
        1)
            echo -e '\e[92m已选择：设定容器目录\e[0m'
            work_path
            ;;
        2)
            echo -e '\e[92m已选择：创建工作目录\e[0m'
            build_files
            ;;
        3)
            echo -e '\e[92m已选择：创建/更新 ADG容器1\e[0m'
            build_adg1
            ;;
        4)
            echo -e '\e[92m已选择：创建/更新 ADG容器2\e[0m'
            build_adg2
            ;;
        *)
            echo -e '\e[91m非法输入,请输入数字[0-4]\e[0m'
            work_choose
            ;;
    esac
    work_choose
}
#start
save_path=/mnt/mmcblk2p4
echo -e '\e[92m默认容器路径为\e[0m' ${save_path}
work_choose
