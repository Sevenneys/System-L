#!/bin/bash

echo "US=$USER" > ~/.config-systemscripts
echo "PROJECT=$(pwd)" >> ~/.config-systemscripts


source /etc/os-release
source ~/.config-systemscripts


access_control() {
    clear
    sudo -v || access_denided

    if [ ! -d /home/$US/packages ]; then
        mkdir /home/$US/packages

        sudo chmod -R 700 /home/$US/packages
        sudo chown $US:$US /home/$US/packages
        sudo chmod -R 700 $PROJECT/modules
        sudo chown $US:$US $PROJECT/modules
        sudo chmod -R 700 $PROJECT/test
        sudo chown $US:$US $PROJECT/test

    fi

    $PROJECT/test/net.sh
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
        ./modules/ubuntu.sh
    ;;
        "debian")
        ./modules/debian.sh
    ;;
        "kali")
        ./modules/kali.sh
    ;;
        *)
        echo "ERROR: Unsupported system.."
    ;;
    esac

}


access_control
run_proccess
