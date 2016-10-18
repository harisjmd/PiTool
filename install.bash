#!/bin/bash

INSTALL_DIR="/usr/local/etc/PiTool"
HELPER_S="./Helper_Scripts/"

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as superuser.Please use 'sudo $0' " 1>&2
    exit 1
fi

# if Installation folder doesn't exist make the dir
if [ ! -e "$INSTALL_DIR" ]; then
    mkdir ${INSTALL_DIR}
fi

# if Log folder doesn't exist make the dir
if [ ! -e "/var/log/PiTool" ]; then
    mkdir "/var/log/PiTool/"
fi

# Moving PiTool Folders to INSTALL_DIR
mv ./Helper_Scripts ${INSTALL_DIR}
mv ./configs $INSTALL_DIR
mv ./cron $INSTALL_DIR
mv ./.reboot $INSTALL_DIR


# Last command 
chmod 600 $INSTALL_DIR
