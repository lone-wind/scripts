#Build by lone-wind
#选择容器目录
work_path () {
    df -h
    echo -e '\e[92m请选择容器的路径\e[0m'
    echo "0 --- 返回上级菜单"
    echo "1 --- 默认容器路径"
    echo "2 --- 设定容器路径"
    read -p "请选择功能或退出 " path_choose
    case $path_choose in
        0)
            ;;
        1)
            echo -e '\e[92m已选择：默认容器路径\e[0m'
            default_path
            ;;
        2)
            echo -e '\e[92m已选择：设定容器路径\e[0m'
            read -p "请输入带有“/”的绝对路径回车 " save_path
            ;;
        *)
            echo -e '\e[91m非法输入,请输入数字[0-2]\e[0m'
            work_path
            ;;
    esac
}
#默认容器路径
default_path () {
    save_path=/mnt/mmcblk2p4
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
#Adg容器选择
adg_choose () {
    echo "0 --- 返回上级菜单"
    echo "1 --- Adguradhome 1"
    echo "2 --- Adguradhome 2"
    read -p "请选择功能或退出 " adg_num
    case $adg_num in
        0)
            ;;
        1)
            echo -e '\e[92m已选择：Adg容器 1\e[0m'
            adg_function
            ;;
        2)
            echo -e '\e[92m已选择：Adg容器 2\e[0m'
            adg_function
            ;;
        *)
            echo -e '\e[91m非法输入,请输入数字[0-2]\e[0m'
            adg_choose
            ;;
    esac
}
#Adg功能选择
adg_function () {
    echo "0 --- 返回上级菜单"
    echo "1 --- 创建/更新 Adg容器"
    echo "2 --- 删除 Adg容器"
    read -p "请选择功能或退出 " function_num
    case $function_num in
        0)
            ;;
        1)
            echo -e '\e[92m已选择：创建/更新 Adg容器\e[0m'${adg_num}
            build_adg
            ;;
        2)
            echo -e '\e[92m已选择：删除 Adg容器\e[0m'${adg_num}
            del_adg
            ;;
        *)
            echo -e '\e[91m非法输入,请输入数字[0-2]\e[0m'
            adg_choose
            ;;
    esac
}
#创建/更新 Adg容器
build_adg () {
    del_adg
    echo -e '\e[92m开始创建/更新 Adg容器\e[0m'${adg_num}
    docker pull  adguard/adguardhome:latest
    docker run --name adguardhome${adg_num} \
        -v ${save_path}/adg/workdir${adg_num}:/opt/adguardhome/work \
        -v ${save_path}/adg/confdir${adg_num}:/opt/adguardhome/conf \
        --restart=always \
        --net=host \
        -d adguard/adguardhome:latest
    echo -e '\e[91m请设置/完善该容器后，再操作另一容器\e[0m'
    echo -e '\e[92m首次设置，使用浏览器访问 ip:3000\e[0m'
}
#删除 Adg容器
del_adg () {
    echo -e '\e[91m开始删除 Adg容器\e[0m'${adg_num}
    docker stop adguardhome${adg_num}
    docker rm adguardhome${adg_num}
    docker image prune -f
    echo -e '\e[91m已删除 Adg容器\e[0m'${adg_num}
}
#功能选择
work_choose () {
    echo -e '\e[92m请选择功能或退出\e[0m'
    echo "0 --- 退出脚本"
    echo "1 --- 选择容器目录"
    echo "2 --- 创建工作目录"
    echo "3 --- 操作 ADG容器"
    read -p "请输入数字[0-3],回车确认 " works
    case $works in
        0)
            echo -e '\e[91m退出脚本，结束操作\e[0m'
            exit;
            ;;
        1)
            echo -e '\e[92m已选择：设定容器目录\e[0m'
            work_path
            echo -e '\e[92m当前容器路径为\e[0m' ${save_path}
            ;;
        2)
            echo -e '\e[92m已选择：创建工作目录\e[0m'
            build_files
            ;;
        3)
            echo -e '\e[92m已选择：操作 ADG容器\e[0m'
            adg_choose
            ;;
        *)
            echo -e '\e[91m非法输入,请输入数字[0-3]\e[0m'
            ;;
    esac
    work_choose
}
#start
default_path
work_choose
