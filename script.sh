#Build by lone-wind
#多合一脚本？？
clean_up () {
    cd /root && rm -rf adg.sh*
}
scripts_choose () {
    echo -e '\e[92m欢迎使用多合一脚本\e[0m'
    echo "0 --- 退出脚本"
    echo "1 --- 双Adg容器"
    echo "2 --- 待开发。。"
    read -p "请输入数字[0-2],回车确认 " scripts_num
    case $scripts_num in
        0)
            echo -e '\e[91m退出脚本，结束操作\e[0m'
            clean_up
            exit;
            ;;
        1)
            echo -e '\e[92m已选择：双Adg容器\e[0m'
            scripts_adg
            ;;
        2)
            echo -e '\e[92m别点啦 没东西>_<\e[0m'
            ;;
        *)
            echo -e '\e[91m非法输入,请输入数字[0-2]\e[0m'
            ;;
    esac
    scripts_choose
}
scripts_adg () {
    echo "0 --- 返回上级菜单"
    echo "1 --- 下载最新脚本"
    echo "2 --- 使用本地脚本"
    read -p "请输入数字[0-2],回车确认 " scripts_update
    case $scripts_update in
        0)
            scripts_choose
            ;;
        1)
            echo -e '\e[92m已选择：下载最新脚本\e[0m'
            wget https://raw.githubusercontent.com/lone-wind/scripts/main/adg.sh 
            echo -e '\e[91m使用最新脚本将覆盖本地脚本\e[0m'
            sh adg.sh
            ;;
        2)
            echo -e '\e[92m已选择：使用本地脚本\e[0m'
            if [ -d custom_adg.sh ]; then
                sh custom_adg.sh
            else
                echo -e '\e[91m未找到本地脚本，请下载最新\e[0m'
            fi
            ;;
        *)
            echo -e '\e[91m非法输入,请输入数字[0-2]\e[0m'
            ;;
    esac
    scripts_adg
}
clean_up
scripts_choose
