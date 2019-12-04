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
#   dev-install-updated-mesa.sh <user@host_ip> <path_to_root_with_files_to_download>
#   or
#   dev-install-updated-mesa.sh <user@host_ip>
#   or
#   dev-install-updated-mesa.sh
#
#   If no any param is provided, following defaults are used:
#     <host_ip>=piotro@192.168.1.190
#     <path_to_root_with_files_to_download>="/home/piotro/minimyth-dev/images/main"

# -------config area begin ---------------------------------------------------

# path at destination where installed libs will be find (and deleted) and new libs will be
# installed
lib_destination_path="/usr/lib"

# libs list to install. Best is to provide filename with '*' as this will allow to:
# delete all old libs found target
# install all new libs found on source
# endependently on minor .so versions.
# Example:
# script will find /usr/lib/libxx.so.a.b.c on target (and delete it).
# script will find /home/piotro/minimyth-dev/images/main/usr/lib/libxx.so.d.e.f on source (and install it).
lib_files_list="libEGL.so* libGL.so* libglapi.so* libgbm.so* libGLESv2.so* libGLESv1_CM.so*"

# path at destination where installed bins will be find (and deleted) and new bins will be
# installed
bin_destination_path="/usr/lib/dri/"

# bins list to install
bin_files_list="armada-drm_dri.so exynos_dri.so hx8357d_dri.so ili9225_dri.so ili9341_dri.so imx-drm_dri.so kms_swrast_dri.so lima_dri.so meson_dri.so mi0283qt_dri.so mxsfb-drm_dri.so panfrost_dri.so pl111_dri.so repaper_dri.so rockchip_dri.so st7586_dri.so st7735r_dri.so stm_dri.so sun4i-drm_dri.so swrast_dri.so v3d_dri.so vc4_dri.so"

# uncomment if You want to dry-run scropt (without any installed files deletion and new files install)
# dry_run=true

# Default MiniMyth2 host IP and user where new files reside 
default_login="piotro@192.168.1.190"

# Default MiniMyth2 home path (assuming that target
default_mm2_home_path="/home/piotro/minimyth-dev"

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

devel_install_files "${home_path}/images/main${lib_destination_path}" "${lib_destination_path}" "${lib_files_list}"
devel_install_files "${home_path}/images/main${bin_destination_path}" "${bin_destination_path}" "${bin_files_list}"

echo "==> Kicking ldconfig..."
ldconfig
echo " "
echo "==> All done! Exiting..."
echo " "
echo " "

exit 0
