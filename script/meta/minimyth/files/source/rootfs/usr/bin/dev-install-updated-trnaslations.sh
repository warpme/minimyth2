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

src="${base_path}/usr/share/mythtv/i18n/"
dest="/usr/share/mythtv/i18n/"
files_list="mytharchive_pl.qm mythbrowser_pl.qm mythfrontend_pl.qm mythgame_pl.qm mythmusic_pl.qm mythnetvision_pl.qm mythnews_pl.qm mythweather_pl.qm mythzoneminder_pl.qm"
copy_files

exit 0
