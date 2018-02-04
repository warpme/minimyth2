#!/bin/sh
################################################################################
# rc.sysinit
################################################################################
. /etc/conf

# Create /proc.
/bin/mkdir -p /proc
/bin/mount -n -t proc  /proc /proc

# Create /sys.
/bin/mkdir -p /sys
/bin/mount -n -t sysfs /sys /sys

# Create /tmp.
/bin/mkdir -p /tmp
/bin/chmod 1777 /tmp

# Create /var.
/bin/mkdir -p /var
/bin/mkdir -p /var/cache
/bin/mkdir -p /var/lib
/bin/mkdir -p /var/lock
/bin/mkdir -p /var/log
/bin/mkdir -p /var/run
/bin/touch    /var/run/utmp
/bin/mkdir -p /var/tmp
/bin/mount -t tmpfs -o nodev,nosuid,size=64M,mode=1777 tmpfs /var/tmp
/bin/mount -t tmpfs -o nodev,nosuid,size=64M,mode=1777 tmpfs /var/log

# Create /run.
/bin/mkdir -p /run
/bin/mkdir -p /run/udev

# Create /dev.
/bin/mkdir -p /var
/bin/mount -n -t devtmpfs /dev /dev
/bin/mknod -m 0600 /dev/initctl p
/bin/mkdir -p /dev/pts
/bin/mount -n -t devpts /dev/pts /dev/pts
/bin/mkdir -p /dev/shm
/bin/mount -n -t tmpfs  /dev/shm /dev/shm

# Stop kernel from calling hotplug.
/bin/echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug

# Start udev userspace daemon of listening to events.
/usr/lib/udev/udevd -d
# Regenerate the events that have already happened.
/usr/bin/udevadm trigger --action=add
# Wait for udev to process all the regenerated events.
/usr/bin/udevadm settle --timeout=60

# Create remaining root directories.
/bin/mkdir -p /media
/bin/mkdir -p /mnt
/bin/mkdir -p /srv

# Start system logging.
/sbin/syslogd

# Determine kernel image and write it to the core configuration file.
MM_KERNEL_IMAGE="${BOOT_IMAGE}"
/bin/echo -n "MM_KERNEL_IMAGE="   >> /etc/conf.d/core
/bin/echo -n "'"                  >> /etc/conf.d/core
/bin/echo -n "${MM_KERNEL_IMAGE}" >> /etc/conf.d/core
/bin/echo    "'"                  >> /etc/conf.d/core

# Determine root file system image and write it to the core configuration file.
MM_ROOTFS_IMAGE="${initrd}"
/bin/echo -n "MM_ROOTFS_IMAGE="   >> /etc/conf.d/core
/bin/echo -n "'"                  >> /etc/conf.d/core
/bin/echo -n "${MM_ROOTFS_IMAGE}" >> /etc/conf.d/core
/bin/echo    "'"                  >> /etc/conf.d/core

# Determine root file system type and write it to the core configuration file.
/usr/bin/test -r /proc/mounts && MM_ROOTFS_TYPE=`/bin/cat /proc/mounts | /bin/grep '^/dev/root /initrd ' | /usr/bin/cut -d' ' -f3`
/bin/echo -n "MM_ROOTFS_TYPE="    >> /etc/conf.d/core
/bin/echo -n "'"                  >> /etc/conf.d/core
/bin/echo -n "${MM_ROOTFS_TYPE}"  >> /etc/conf.d/core
/bin/echo    "'"                  >> /etc/conf.d/core

# Create shared library cache.
# This is needed so the MySQL perl modules will load correctly.
/sbin/ldconfig

# Loading kernel tuned parameters from sysctl.conf
/sbin/sysctl -q -p /etc/sysctl.conf > /dev/null

# Symlink needed by util-linux 2.31
ln -sf /proc/self/mounts /etc/mtab > /dev/null

exit 0
