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
#   dev-install-updated-mesa.sh persistent
#   or
#   dev-install-updated-mythtv.sh
#
#   If no any param is provided, following defaults are used:
#     <host_ip>=piotro@192.168.1.190
#     <path_to_root_with_files_to_download>="/home/piotro/minimyth-dev/images/main"

# -------config area begin ---------------------------------------------------

# path at destination where installed libs will be find (and deleted) and new libs will be installed
lib_destination_path="/usr/lib"

# Prefix in path on destination used by all destination paths to write
# all files on mounted RW SD card image (/initrd/rootfs-ro). This is usefull
# to write updated filres into persistent storage
persistent_storage_path="/initrd/rootfs-ro"

# libs list to install. Best is to provide filename with '*' as this will allow to:
# delete all old libs found target
# install all new libs found on source
# endependently on minor .so versions.
# Example:
# script will find /usr/lib/libxx.so.a.b.c on target (and delete it).
# script will find /home/piotro/minimyth-dev/images/main/usr/lib/libxx.so.d.e.f on source (and install it).
lib_files_list="libmyth-*.so* libmythavcodec.so* libmythavfilter.so* libmythavformat.so* libmythavutil.so* libmythbase-*.so* libmythfreemheg-*.so* libmythmetadata-*.so* libmythpostproc.so* libmythservicecontracts-*.so* libmythswresample.so* libmythswscale.so* libmythtv-*.so* libmythui-*.so* libmythupnp-*.so*"

# path at destination where plugins will be installed
plugins_destination_path="/usr/lib/mythtv/plugins"

# plugins list to install. Best is to provide filename with '*'
plugins_files_list="libmythbrowser.so libmythgame.so libmythmusic.so libmythnetvision.so libmythnews.so libmythweather.so libmythzoneminder.so"

# path at destination where installed bins will be find (and deleted) and new bins will be installed
bin_destination_path="/usr/bin"

# bins list to install
bin_files_list="mythfrontend mythffmpeg mythffplay"

# uncomment if You want to dry-run scropt (without any installed files deletion and new files install)
# dry_run=true

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

elif [ "x${opt_devel_login}" = "xpersistent" ] ; then

    # No any param provided case. Go with all defaults
    devel_login="${default_login}"
    home_path="${default_mm2_home_path}"
    prefix=${persistent_storage_path}

    echo "    Using defaults for login and MiniMyth2 home path ..."
    echo "    Writing files to persistent storage ..."

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

devel_install_files "${home_path}/images/main${lib_destination_path}"     "${prefix}${lib_destination_path}"     "${lib_files_list}"
devel_install_files "${home_path}/images/main${plugins_destination_path}" "${prefix}${plugins_destination_path}" "${plugins_files_list}"
devel_install_files "${home_path}/images/main${bin_destination_path}"     "${prefix}${bin_destination_path}"     "${bin_files_list}"

echo "==> Kicking ldconfig..."
ldconfig
echo " "
echo "==> Restarting mythfrontend..."
mm_manage restart_mythfrontend
echo " "
echo "==> All done! Exiting..."
echo " "
echo " "

exit 0
