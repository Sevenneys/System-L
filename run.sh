#!/bin/bash

source /etc/os-release
path=$(pwd)


access_control() {
    clear
    sudo -v || access_denided

    if [ ! -d /home/$USER/packages ]; then
        mkdir /home/$USER/packages

        sudo chmod -R 700 /home/$USER/packages
        sudo chown $USER:$USER /home/$USER/packages
        sudo chmod -R 700 $path/modules
        sudo chown $USER:$USER $path/modules
        sudo chmod -R 700 $path/test
        sudo chown $USER:$USER $path/test

    fi

    $path/test/net.sh
}


access_denided(){
    echo ""
    echo "WARNING: Access denided!"
    echo
    exit
}


run_proccess() {

    case $ID in
        "ubuntu")
        sudo ./modules/ubuntu.sh
    ;;
        "debian")
        sudo ./modules/debian.sh
    ;;
        "kali")
        sudo ./modules/kali.sh
    ;;
        *)
        echo "ERROR: Unsupported system.."
    ;;
    esac

}


access_control
run_proccess
