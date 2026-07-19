#!/bin/bash

source ~/.config-systemscripts
clear

update_system() {
    echo ""
    echo "UPDATE AND UPGRADE THE SYSTEM"
    echo ""
    
    sleep 1

    sudo apt update 2> /dev/null
    echo ""
    sudo apt-get full-upgrade -y 2> /dev/null

}


set_lang() {
    echo ""
    echo "SET RU-ENG LANGUAGE FOR THE SYSTEM"

    if [ ! -d /home/$US/scriptss ]; then
        mkdir /home/$US/scripts
        chmod -R 700 /home/$US/scripts
        chown $US:$US /home/$US/scripts

        
        cp $PROJECT/config/lang.sh /home/$US/scripts

        echo "INFO: The script has been copied to the "scripts" directory. Don't forget to enable autorun!"
        echo ""

        read -p "Press Enter to continue.." go_next
        

    else
        echo "INFO: The file has already been created!"
        echo ""
    fi
}


update_system
set_lang