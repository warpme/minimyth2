#!/bin/sh

# Script uses scp to download files from host to this machine.
#
# Usage:
#   dev-install-updated-mesa.sh <user@host_ip> <path_to_root_with_files_to_download>
#   or
#   dev-install-updated-mesa.sh <user@host_ip>
#   or
#   dev-install-updated-mesa.sh
#
#   If no  param is provided, following defaults are used:
#     <host_ip>=piotro@192.168.1.190
#     <path_to_root_with_files_to_download>="/home/piotro/minimyth-dev/images/main"








ip=$1
base_path=$2

echo " "
echo "--- Updated mesa binaries installer v1.0 ---"
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

# Mesa libs
src="/home/piotro/minimyth-dev/images/main/usr/lib/"
dest="/initrd/rootfs-ro/usr/lib/"
files_list="libEGL.so.1 libGL.so.1 libglapi.so.0 libgbm.so.1 libGLESv2.so.2 libGLESv1_CM.so.1"
copy_files

# Mesa dri
src="//home/piotro/minimyth-dev/images/main/usr/lib/dri/"
dest="/initrd/rootfs-ro/usr/lib/dri/"
files_list="armada-drm_dri.so exynos_dri.so hx8357d_dri.so ili9225_dri.so ili9341_dri.so imx-drm_dri.so kms_swrast_dri.so lima_dri.so meson_dri.so mi0283qt_dri.so mxsfb-drm_dri.so panfrost_dri.so pl111_dri.so repaper_dri.so rockchip_dri.so st7586_dri.so st7735r_dri.so stm_dri.so sun4i-drm_dri.so swrast_dri.so v3d_dri.so vc4_dri.so"
copy_files

echo " "
echo " "
echo "  kicking ldconfig..."
ldconfig

echo "  Restarting xserver..."
mm_manage restart_xserver

echo "Done..."
echo " "

exit 0
