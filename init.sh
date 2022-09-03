#!/bin/bash


cat << "EOF"
______     _     _             
|  _  \   | |   (_)            
| | | |___| |__  _  __ _ _ __  
| | | / _ | '_ \| |/ _` | '_ \ 
| |/ |  __| |_) | | (_| | | | |
|___/ \___|_.__/|_|\__,_|_| |_|
                               
                               
EOF

echo ""
echo "Script by mtv47 to set up a nuc server with docker"
echo ""

sudo bash variables.sh

echo ""
echo "This script will be working in" $USER_HOME
echo ""

options=("Basic Setup" "Installs for Docker" "Installs for Docker Containers" "Quit")

select opt in "${options[@]}"
do
    case $opt in
        "Basic Setup")
            sudo bash basic.sh
            ;;
        "Installs for Docker")
            sudo bash docker.sh
            ;;
        "Installs for Docker Containers")
            sudo bash containers.sh
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done