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


# make mkinitcpio happy with archlinuxarm mkinitcpio def. config
echo 'adding some fixups in archlinuxarm image to make mkinitcpio happy ...'
cp -f ${src}/script/miniarch/miniarch-rootfs/files/{base,fsck} ${dest}/usr/lib/initcpio/install/

# adding somehow missing usb .conf
echo 'doing some general fixups in archlinuxarm image ...'
cp -f ${src}/script/miniarch/miniarch-rootfs/files/bluetooth-usb.conf ${dest}/usr/lib/modprobe.d/bluetooth-usb.conf

# disabling pacman download timeouts
echo "disabling pacman downloads timeout ..."
sed "/Architecture\s*=.*/a DisableDownloadTimeout" -i ${dest}/etc/pacman.conf

# make pacman happy when user is installing bluez pkg
echo 'hack removing /usr/lib/modprobe.d/bluetooth-usb.conf to make pacman happy when user is installing bluez pkg ...'
rm -f ${dest}/usr/lib/modprobe.d/bluetooth-usb.conf

# switch to sw cursor due broken hw cursor in wayland due kodi/mythtv required drm planes reordering hack
echo "force software cursor in wayland as workarround for drm planes reordering req. by kodi/mythtv ..."
echo "# miniarch: force software cursor in wayland as workarround for drm planes reordering req. by kodi/mythtv" >> ${dest}/etc/environment
echo "export KWIN_FORCE_SW_CURSOR=1" >> ${dest}/etc/environment




echo "----end----"
exit 0
