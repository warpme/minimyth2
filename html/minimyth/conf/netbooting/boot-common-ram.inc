
#
# common part of RAM boot script
#

base_url="http://${serverip}/${ram_top_dir}"

echo "Downloading kernel image ..."
wget ${kernel_addr_r}  ${base_url}/boot/Image

echo "Downloading DTB: ${dtb_file} ..."
wget ${fdt_addr_r}     ${base_url}/boot/dtbs/${dtb_file}

echo "Downloading rootfs image ..."
wget ${ramdisk_addr_r} ${base_url}/rootfs

if itest.s "x${quiet_boot}" == "xyes" ; then
  verbosity="logo.nologo vt.cur_default=1"
else
  verbosity="debug"
fi;

setenv bootargs ro root=/dev/ram0 initrd=rootfs ramdisk_size=384000 overlay.index=off overlay.nfs_export=off ${early_con} ${extra_params} ${verbosity}

booti ${kernel_addr_r} ${ramdisk_addr_r}:${filesize} ${fdt_addr_r}
