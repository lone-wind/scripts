#Build by lone-wind
#默认容器路径
default_path () {
    save_path=/mnt/mmcblk2p4
}
#功能选择
work_choose () {
    echo -e '\e[92m请选择功能或退出\e[0m'
    echo "0 --- 退出 Adg脚本"
    echo "1 --- 设定容器目录"
    echo "2 --- 设定工作目录"
    echo "3 --- 操作 ADG容器"
    read -p "请输入数字[0-3],回车确认 " work_num
    case $work_num in
        0)
            echo -e '\e[91m退出脚本，结束操作\e[0m'
            exit;
            ;;
        1)
            echo -e '\e[92m已选择：设定容器目录\e[0m'
            docker_path
            ;;
        2)
            echo -e '\e[92m已选择：设定工作目录\e[0m'
            files_path
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
#设定容器目录
docker_path () {
    echo -e '\e[92m当前容器路径为\e[0m' ${save_path}
    echo "0 --- 返回上级菜单"
    echo "1 --- 默认容器路径"
    echo "2 --- 设定容器路径"
    read -p "请选择功能或退出 " docker_num
    case $docker_num in
        0)
            ;;
        1)
            echo -e '\e[92m已选择：默认容器路径\e[0m'
            ;;
        2)
            echo -e '\e[92m已选择：设定容器路径\e[0m'
            df -h && echo -e '\e[92m请选择足够存放容器的路径\e[0m'
            read -p "请输入带有“/”的绝对路径回车 " save_path
            ;;
        *)
            echo -e '\e[91m非法输入,请输入数字[0-2]\e[0m'
            docker_path
            ;;
    esac
}
#设定工作目录
files_path () {
    echo "0 --- 返回上级菜单"
    echo "1 --- 创建工作目录"
    echo "2 --- 删除工作目录"
    read -p "请选择功能或退出 " files_num
    case $files_num in
        0)
            ;;
        1)
            echo -e '\e[92m已选择：创建工作目录\e[0m'
            files_judge
            ;;
        2)
            echo -e '\e[91m已选择：删除工作目录\e[0m'
            files_del
            ;;
        *)
            echo -e '\e[91m非法输入,请输入数字[0-2]\e[0m'
            files_path
            ;;
    esac
}
#判断工作目录
files_judge () {
    if [ -d "${save_path}/adg" ]; then
        echo -e '\e[91m当前容器目录下已存在Adg工作目录\e[0m'
        files_path
    else
        echo -e '\e[92mAdg工作目录不存在 开始创建\e[0m'
        build_files
    fi
}
files_del () {
    echo -e '\e[91m删除目录 Adg配置将会丢失 请谨慎操作\e[0m'
    read -p "是否确认删除? [Y/N] " del_choose
    case $del_choose in
        [yY][eE][sS]|[yY])
            echo -e '\e[92m已确认删除\e[0m'
            rm -rf ${save_path}/adg
            ;;
        [nN][oO]|[nN])
            echo -e '\e[91m已取消删除\e[0m'
            ;;
        *)
            echo -e '\e[91m请输入[Y/N]进行确认\e[0m'
            files_del
            ;;
    esac
    files_path
}
#创建工作目录
build_files () {
    echo -e '\e[92m开始创建Adg工作目录\e[0m'
    mkdir ${save_path}/adg
    mkdir ${save_path}/adg/workdir1 && mkdir ${save_path}/adg/confdir1
    mkdir ${save_path}/adg/workdir2 && mkdir ${save_path}/adg/confdir2
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
    echo "3 --- 查看 Adg容器状态"
    echo "4 --- 查看 Adg容器日志"
    read -p "请选择功能或退出 " function_num
    case $function_num in
        0)
            adg_choose
            ;;
        1)
            echo -e '\e[92m已选择：创建/更新 Adg容器\e[0m'${adg_num}
            build_adg
            ;;
        2)
            echo -e '\e[92m已选择：删除 Adg容器\e[0m'${adg_num}
            del_adg
            ;;
        3)
            echo -e '\e[92m已选择：查看 Adg容器状态\e[0m'
            docker ps -f "name=adguardhome${adg_num}"
            ;;
        4)
            echo -e '\e[92m已选择：查看 Adg容器日志\e[0m'
            docker logs -f "adguardhome${adg_num}"
            ;;
        *)
            echo -e '\e[91m非法输入,请输入数字[0-4]\e[0m'
            adg_function
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
}
default_path
work_choose
