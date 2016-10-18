#!/bin/bash

####################################################
####################################################
##                                                ##
##   Downloads and installs driver for TP-Link    ##
##   TL-WN725N-V2 USB Wireless Adapter depending  ##
##   on the current Kernel and Build Version of   ##
##   Raspberry Pi A/A+,B,B+,Zero and 2 B, 3 B     ##
##                                                ##
####################################################
####################################################


if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as superuser.Please use 'sudo $0' " 1>&2
    exit 1
fi

INSTALL_DIR="/usr/local/etc/PiTool/"
CONFIG_DIR=""${INSTALL_DIR}"configs/TL-WN725N-V2/"

if [ ! -e  ${INSTALL_DIR} ]; then
    mkdir ${INSTALL_DIR}
fi

if [ ! -e  ${CONFIG_DIR} ]; then
    mkdir ${CONFIG_DIR}
fi

# Raspberry Pi Version
RASPIV=$(cat /proc/cpuinfo | awk -F' ' '/Revision/{print $3}')

# Getting Kernel and Build
KERNEL=$(uname -a | grep -o "4.4.[0-9][0-9]*")
BUILD=$(uname -a | grep -o "#[0-9][0-9][0-9]" | sed "s/#//g")

case ${RASPIV} in

        "0002"|"0003"|"0004"|"0005"|"0006"|"0007"|"0008"|"0009"|"000d"|"000e"|"000f"|"0010"|"0013"|"0011"|"0012"|"900092")
            # Raspberry Pi Version A/A+,B,B+ and Zero

            # Downloading the Driver
            wget -P ${CONFIG_DIR}  "https://dl.dropboxusercontent.com/u/80256631/8188eu-"${KERNEL}"-"${BUILD}".tar.gz"
            sleep 1

            # Installing the Driver
            tar xzf  ${CONFIG_DIR}"8188eu-"${KERNEL}"-v7-"${BUILD}".tar.gz"
            /bin/bash -c ${CONFIG_DIR}"install.sh"
        ;;

        "a01041"|"a21041"|"a02082"|"a22082")
        # Raspberry Pi Version 2 B and 3 B

        # Downloading the Driver
        wget -P ${CONFIG_DIR}  "https://dl.dropboxusercontent.com/u/80256631/8188eu-"${KERNEL}"-v7-"${BUILD}".tar.gz"
        sleep 1

        # Installing the Driver
        tar xzf  ${CONFIG_DIR}"8188eu-"${KERNEL}"-v7-"${BUILD}".tar.gz"
        /bin/bash -c ${CONFIG_DIR}"install.sh"
        ;;

esac