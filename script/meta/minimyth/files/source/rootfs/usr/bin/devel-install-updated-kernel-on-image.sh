#!/bin/sh

. /etc/rc.d/functions

# Script installs new files from sources machine to local machine.
# First it finds local files with the same filename and deletes them (to avoid
# i.e. conflict of lib with the same filemame but different minor ver.
# Next it finds all files with given name on remote host and then download them
# to local machine.
# Script uses ssh to find files on remote machine and scp to download found files 
# from remote host to local machine.
#
# Usage:
#   dev-install-updated-mythtv.sh <user@host_ip> <path_to_root_with_files_to_download>
#   or
#   dev-install-updated-mythtv.sh <user@host_ip>
#   or
#   dev-install-updated-mythtv.sh
#
#   If no any param is provided, following defaults are used:
#     <host_ip>=piotro@192.168.1.190
#     <path_to_root_with_files_to_download>="/home/piotro/minimyth-dev"

# -------config area begin ---------------------------------------------------

# Prefix on destination used for all destination paths. Usefull i.e. to 
# put all files on mounted RW SD card image (/initrd/rootfs-ro)
prefix="/initrd/rootfs-ro"

# path at destination where installed dtb files will deleted and new dtb files will be installed
dtbs_destination_path="/media/boot/dtbs"
# path at source where dtb files will be sourced to install
dtbs_source_path="/boot/dtbs"
# dtb files list to install. Best is to provide filename with '*' as this will allow to:
# delete all old libs found target
# install all new libs found on source
# endependently on minor .so versions.
# Example:
# script will find /usr/lib/libxx.so.a.b.c on target (and delete it).
# script will find /home/piotro/minimyth-dev/images/main/usr/lib/libxx.so.d.e.f on source (and install it).
dtbs_files_list="*.dtb "

# path at destination where installed modules files will deleted and new modules files will be installed
modules_destination_path="/lib/modules"
# path at source where module files will be sourced to install
modules_source_path="/lib/modules"
# modules list to install. Best is to provide filename with '*'
modules_files_list="modules.* *.ko "

# path at destination where installed kernel images will be find (and deleted) and new image will be installed
image_destination_path="/media/boot"
# path at source where kernel image files will be sourced to install
image_source_path="/boot"
# kernel image file list to install
image_files_list="Image uImage"

# uncomment if You want to dry-run scropt (without any installed files deletion and new files install)
#dry_run=true

# Default MiniMyth2 host IP and user where new files reside 
default_login="piotro@192.168.1.190"

# Default MiniMyth2 home path (assuming that target
default_mm2_home_path="@MM_HOME@"

#------- config area end ------------------------------------------------------

















opt_devel_login=$1
opt_home_path=$2

echo " "
echo "----- Updated files installer v1.0 -----"
echo " "

home_path=

if [ "x${opt_devel_login}" = "x" ] ; then

    # No any param provided case. Go with all defaults
    devel_login="${default_login}"
    home_path="${default_mm2_home_path}"

    echo "    Using defaults for login and MiniMyth2 home path..."

else

    if [ "x${opt_home_path}" = "x" ] ; then

        # Only login provided case. Go with provided login an default path
        devel_login="${opt_devel_login}"
        home_path="${default_mm2_home_path}"
        echo "    Using IP=${devel_login} and defaults for MiniMyth2 home path..."

    else

        # Login and path provided case. Go with provided login and path
        devel_login="${opt_devel_login}"
        home_path="${opt_home_path}"
        echo "    Using IP=${devel_login} and ${home_path} for MiniMyth2 home path..."

    fi
fi

echo " "
echo "MiniMyth2 devel host      :[${devel_login}]"
echo "MiniMyth2 devel home path :[${home_path}]"
echo " "

devel_install_files "${home_path}/images/main${modules_source_path}" "${prefix}${modules_destination_path}" "$modules_files_list}"
devel_install_files "${home_path}/images/main${dtbs_source_path}"    "${dtbs_destination_path}"    "${dtbs_files_list}"
devel_install_files "${home_path}/images/main${image_source_path}"   "${image_destination_path}"   "${image_files_list}"

echo "==> To run updated kernel, please reboot!"
echo " "
echo "==> All done! Exiting..."
echo " "
echo " "

exit 0
