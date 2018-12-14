
mm_conf_file="/home/piotro/minimyth-dev/minimyth.conf.mk"
upload_addr="piotro@192.168.1.9"
boot_files_loc="/home/piotro/ABS/mythtv-pxe_image/src/boot"
rootfs_archive="/home/piotro/ABS/mythtv-pxe_image/src/rootfs.tar.bz2"

#--------------------------------------------------------------------------------------

board=$1

if [ x${board} = "x" ] ; then
board=`  grep "^mm_BOARD_TYPE "       ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
fi

base_dir=${PWD}

export BUILDDIR=${base_dir}
export BBPATH=${base_dir}
export PATH=${base_dir}/bitbake/bin:$PATH
export PYTHONPATH=${base_dir}/bitbake/lib:$PYTHONPATH

branch=` grep "^mm_MYTH_VERSION "     ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
version=`grep "^mm_VERSION_MINIMYTH " ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
arch=`   grep "^mm_GARCH "            ${mm_conf_file} | sed -e 's/.*\?=*\s//'`

echo " "
echo "---- Starting to create SD image... ----"
echo " "
echo "  branch  : ${branch}"
echo "  version : ${version}"
echo "  arch    : ${arch}"
echo "  board   : ${board}"
echo " "

echo "--> Setting right (${board}) config file..."
cp -f ${base_dir}/conf/multiconfig/${board}.conf ${base_dir}/conf/multiconfig/default.conf
echo " "

echo "  Creating SD image rootfs content requires root priviliges."
echo "  Please provide root password..."
echo " "

su -c " \
cd ${BUILDDIR}; \
rm -f ./*.log; \
rm -f ./*.direct; \
rm -f ./*.vfat; \
rm -f ./*.ext4; \
rm -f ./*.tar.bz2; \
rm -rf ./rootfs*; \
rm -rf ./pseudo*; \
echo '--> Unpacking rootfs...'; \
tar -jxf ${rootfs_archive} -C ./; \
echo '--> Building SD Image...'; \
${base_dir}/scripts/wic create MiniMyth2.wks --bootimg-dir=${boot_files_loc} --kernel-dir=${boot_files_loc} --rootfs-dir=${base_dir}/rootfs --native-sysroot='/'; \
rename MiniMyth2-*.direct MiniMyth2-${arch}-${branch}-${version}-${board}-SD-Image.img *; \
echo '--> Removing working files...'; \
rm -rf ./rootfs*; \
rm -rf ./pseudo*; \
echo '--> Packaging image...'; \
tar cjvf MiniMyth2-${arch}-${branch}-${version}-${board}-SD-Image.tar.bz2 ./*.img; \
rm -f ./*.img; \
echo '--> Image creation done!';
"
