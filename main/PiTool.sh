#!/bin/bash
### BEGIN INIT INFO
# Provides:          pitool
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start setup
# Description:       Enable setup again.
### END INIT INFO ###

##### Directories #####
INSTALL_DIR="/usr/local/etc/PiTool/"
CONFIG_DIR=""$INSTALL_DIR"configs/"
REBOOT_DIR=""$INSTALL_DIR"".reboot/""
CRON_DIR=""$INSTALL_DIR""cron/""
HELPERS_DIR="$INSTALL_DIR"Helper_Scripts""
LOG_DIR="/var/log/PiTool/"

#######################

##### Files #####

#LOG FILES#
UP_INST_LOG="$LOG_DIR"pitool_installs_updates.log""

#################


echo ${INSTALL_DIR}
echo ${CONFIG_DIR}
echo ${REBOOT_DIR}
echo ${CRON_DIR}
echo ${LOG_DIR}
echo ${UP_INST_LOG}

echo "Enable automounting of disks or usbs?"

plugged_labels=$(ls -la /dev/disk/by-label/ | awk '/sd[a-z][1-9]/{print $9}')
plugged_uuids=$(ls -la /dev/disk/by-uuid/ | awk '/sd[a-z][1-9]/{print $9}')

if [ ${#plugged_labels[@]} -eq ${#plugged_uuids[@]} ]; then
for i in ${!plugged_labels[@]}; do
    echo  -e "${i+1}) ${plugged_labels[$i]}\t${plugged_uuids[$i]}"
done
fi



exit 0
