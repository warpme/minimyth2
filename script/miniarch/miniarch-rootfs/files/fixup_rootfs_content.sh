#!/bin/sh

# this script does fixups and chages in vnilla archlinuxarm rootfs required/desired
# for miniarch.
# Source top dir is minimyth2 home dir (defined in minimyth2.conf.mk)




src=$1
dest=$2

echo "MiniArch rootfs fixup script ..."

echo " "
echo "Source top dir  : [${src}]"
echo "destination dir : [${dest}]"
echo " "
echo "----start----"

# remove /boot dir as we will use our own /boot part
echo 'remove /boot dir as we will use our own /boot part ...'
rm -rf ${dest}/boot*

# remove kernel depmod artefacts in /lib/modules as we will generate our own 
echo 'remove original kernel depmod artefacts from rootfs ...'
rm -rf ${dest}/lib/modules/*aarch64-ARCH

# disabling pacman download timeouts
echo "disabling pacman downloads timeout ..."
sed "/Architecture\s*=.*/a DisableDownloadTimeout" -i ${dest}/etc/pacman.conf

# block updates of kernel, kernel headers and firmware
echo "blocking updates of kernel and firmwares ..."
sed "s/\#IgnorePkg\s*=.*/IgnorePkg = linux-aarch64 linux-aarch64-headers linux-aarch64-api-headers linux-headers linux-api-headers linux-firmware linux-firmware\-\*/g" -i ${dest}/etc/pacman.conf

echo "----end----"
exit 0
