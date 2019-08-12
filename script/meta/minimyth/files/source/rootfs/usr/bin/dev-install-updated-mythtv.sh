#!/bin/sh

# Script uses scp to download files from host to this machine.
#
# Usage:
#   dev-install-updated-mythtv.sh <user@host_ip> <path_to_root_with_files_to_download>
#   or
#   dev-install-updated-mythtv.sh <user@host_ip>
#   or
#   dev-install-updated-mythtv.sh
#
#   If no  param is provided, following defaults are used:
#     <host_ip>=piotro@192.168.1.190
#     <path_to_root_with_files_to_download>="/home/piotro/minimyth-dev/images/main"








ip=$1
base_path=$2

echo " "
echo "--- Updated mythtv-31 binaries installer v1.0 ---"
echo " "


if [ "x${ip}" = "x" ] ; then

    # Default user@IP_address of host where compiled binaries are present to pull from
    ip="piotro@192.168.1.190"

    # Default absolute root path on host where compiled binaries are present to pull from
    base_path="/home/piotro/minimyth-dev/images/main"

    echo "  --> Using defaults for IP and base_path..."
else
    if [ "x${base_path}" = "x" ] ; then

        # Default absolute root path on host where compiled binaries are present to pull from
        base_path="/home/piotro/minimyth-dev/images/main"

        echo "  --> Using IP=${ip} and defaults for base_path..."
    fi
fi

echo "  --> Will pull files from:[${ip}/${base_path}]"
echo " "
echo "  Now downloading and installing files..."
echo " "

copy_files() {
  for file in ${files_list}; do
    scp -c none ${ip}:${src}${file} ${dest}${file}
    chown root:root ${dest}${file}
    chmod 0755 ${dest}${file}
  done
}

# Myth libs
src="${base_path}/usr/lib/"
dest="/usr/lib/"
files_list="libmyth-31.so.31 libmythavcodec.so.58 libmythavfilter.so.7 libmythavformat.so.58 libmythavutil.so.56 libmythbase-31.so.31 libmythfreemheg-31.so.31 libmythmetadata-31.so.31 libmythpostproc.so.55 libmythservicecontracts-31.so.31 libmythswresample.so.3 libmythswscale.so.5 libmythtv-31.so.31 libmythui-31.so.31 libmythupnp-31.so.31"
copy_files

src="${base_path}/usr/lib/mythtv/filters/"
dest="/usr/lib/mythtv/filters"
files_list="libadjust.so libbobdeint.so libcrop.so libdenoise3d.so libfieldorder.so libforce.so libgreedyhdeint.so libinvert.so libivtc.so libkerneldeint.so liblinearblend.so libonefield.so libpostprocess.so libquickdnr.so libvflip.so libyadif.so"
copy_files

src="${base_path}/usr/lib/mythtv/plugins/"
dest="/usr/lib/mythtv/plugins"
files_list="libmythbrowser.so libmythgame.so libmythmusic.so libmythnetvision.so libmythnews.so libmythweather.so libmythzoneminder.so"
copy_files

# Myth bins
src="${base_path}/usr/bin/"
dest="/usr/bin/"
files_list="mythfrontend mythffmpeg"
copy_files

echo "  kicking ldconfig..."
ldconfig

echo "Done..."
echo " "

exit 0
