
#
# common part of NFS boot script
#

base_url="http://${serverip}/${nfs_top_dir}"

echo "Downloading kernel image ..."
wget ${kernel_addr_r} ${base_url}/boot/Image

echo "Downloading dtb: ${dtb_file} ..."
wget ${fdt_addr_r} ${base_url}/boot/dtbs/${dtb_file}

if itest.s "x${quiet_boot}" == "xyes" ; then
  verbosity="logo.nologo vt.cur_default=1"
else
  verbosity="debug"
fi;

if test ${dtb_overlays} != "" ; then
  fdt addr ${fdt_addr_r}
  fdt resize 131072
  for overlay in ${dtb_overlays}; do
    echo "Downloading dtb overlay: ${overlay} ..."
    if wget ${ramdisk_addr_r} ${base_url}/boot/dtbs/${overlay}; then
      if fdt apply ${ramdisk_addr_r}; then
        echo "Successfuly applied dtb overlay: ${overlay} ..."
      else
        echo "ERROR appling dtb overlay: ${overlay} ..."
      fi;
    else
        echo "ERORR: cant download dtb overlay: ${overlay} ..."
    fi;
  done;
fi;

setenv bootargs root=/dev/nfs nfsroot=${serverip}:/var/tftpboot/PXEclient/${nfs_top_dir}/rootfs,v3,ro ro ip=dhcp ${early_con} ${extra_params} ${verbosity}

booti ${kernel_addr_r} - ${fdt_addr_r}

