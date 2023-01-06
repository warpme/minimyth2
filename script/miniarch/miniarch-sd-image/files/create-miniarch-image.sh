
use_minimyth_python3="yes"
debug_verbosity="no"















#--------------------------------------------------------------------------------------

# mm_home="/home/piotro/minimyth2-aarch64-next"
# install_dir="/home/piotro/backup/minimyth"
# board_list="board-h6.tanix_tx6"
# root_files_loc="/home/piotro/minimyth2-aarch64-next/images/miniarch-rootfs"

mm_home="@@HOME@@"
install_dir="@@INSTALL@@"
board_list="@@BOARDS@@"
root_files_loc="@@ROOTFS@@"
image_version="@@VERSION@@"

boards="$1"

if [ "x${boards}" = "x" ] ; then
    boards=${board_list}
    echo "  using boards list (${boards}) from make invocation var"
else
    echo "  using boards list (${boards}) from script command-line"
fi

base_dir=${mm_home}/images/build/usr/bin/kickstart

if [ ! -e ${base_dir} ] ; then
    echo "ERROR: kickstart OE not found in ${base_dir}. Exiting"
    exit 1
fi

if [ x"${boards}" = "x" ] ; then
    echo "ERROR: no boards list defined. Exiting"
    exit 1
fi

mm_build_dir=${mm_home}/script/meta/minimyth/work/main.d/miniarch
mkdir -p ${mm_build_dir}/stage
boot_files_loc=${mm_home}/images/main/boot

export BUILDDIR=${mm_build_dir}/stage
export BBPATH=${base_dir}
export PATH=${base_dir}/bitbake/bin:/sbin:/bin:/usr/sbin:/usr/bin
export PYTHONPATH=${base_dir}/bitbake/lib:${PYTHONPATH}

if [ x${use_minimyth_python3} = "xyes" ] ; then 
    export PATH=${mm_home}/images/build/bin:${mm_home}/images/build/usr/bin:${PATH}
    export PYTHONPATH=${mm_home}/images/build/usr/lib/python3.9:${PYTHONPATH}
    export PYTHON=${mm_home}/images/build/usr/bin/python3
    export LD_LIBRARY_PATH=${mm_home}/images/build/lib:${mm_home}/images/build/usr/lib
else
    export PYTHON=/usr/bin/python3
fi

if [ x${debug_verbosity} = "xyes" ] ; then
   echo "  build with debug verbosity"
   debug_flag=" --debug"
fi

rm -f ${base_dir}/conf/multiconfig/default.conf
echo "IMAGE_BOOT_FILES ?= \" \"" > ${base_dir}/conf/multiconfig/default.conf
echo "" >> ${base_dir}/conf/multiconfig/default.conf
boards_list=""
rm -f ${base_dir}/MiniArch.wks
echo "#----Entries to raw-copy SPL, bootloader, etc " > ${base_dir}/MiniArch.wks

for board in ${boards} ; do
    echo "  adding "${board}" to default.config & MiniArch.wks"
    cat ${base_dir}/conf/multiconfig/${board}.conf >> ${base_dir}/conf/multiconfig/default.conf
    boards_list=${board}-${boards_list}
    cat ${base_dir}/${board}.wks >> ${base_dir}/MiniArch.wks
done
echo "#----Entries to create boot & rootfs partitions" >> ${base_dir}/MiniArch.wks

# Selecting appropriate common.wks file
if [ ! -z `echo ${boards} | grep -o "board-x86pc"` ] ; then
    echo "  board-x86pc detected. skipping default-mbr[gpt].wks"
elif [ ! -z `echo ${boards} | grep -o "board-rk3566.x96_x6"` ] ; then
    echo "  board-rk35xx detected: using all in one board-rk3566.x96_x6.wks"
    # cat board-rk3566.x96_x6.wks to MiniArch.wks is comented-out as x96_x6
    # box is single exception where board-rk3566.x96_x6.wks
    # creates all paritions (boot related and rootfs). This is because this
    # box speciffics.
    #cat ${base_dir}/board-rk3566.x96_x6.wks >> ${base_dir}/MiniArch.wks
elif [ ! -z `echo ${boards} | grep -o "board-rk3566.*"` ] ; then
    echo "  board-rk35xx detected: using default-gpt.wks"
    cat ${base_dir}/default-gpt.wks >> ${base_dir}/MiniArch.wks
else
    echo "  board-x86pc detected. Using default-mbr.wks"
    cat ${base_dir}/default-mbr.wks >> ${base_dir}/MiniArch.wks
fi

echo "Doing MiniAch fixups in ${base_dir}/MiniArch.wks"
sed -i "s%@MM_HOME@%${mm_home}%g" ${base_dir}/MiniArch.wks
sed -i "/SWAP/d" ${base_dir}/MiniArch.wks
echo "Doing MiniAch fixups in ${base_dir}/conf/multiconfig/default.conf"
sed -i "s%minimyth.conf%initramfs-linux.img%g" ${base_dir}/conf/multiconfig/default.conf
sed -i "s%Image%Image Image.gz%g" ${base_dir}/conf/multiconfig/default.conf

image_filename="MiniArch-${image_version}-${boards_list}SD-Image"

echo "  boards        : ${boards_list}"
echo "  img.filename  : ${image_filename}"
echo "  mm2 home dir  : [${mm_home}]"
echo "  boot files    : [${boot_files_loc}]"
echo "  rootfs files  : [${root_files_loc}]"

cd ${BUILDDIR}
rm -f  ${BUILDDIR}/*.log
rm -f  ${BUILDDIR}/*.direct
rm -f  ${BUILDDIR}/*.vfat
rm -f  ${BUILDDIR}/*.ext4
rm -rf ${BUILDDIR}/tmp
rm -rf ${root_files_loc}/../pseudo*
# By bug kickstart-oe not looks for pseudo binary in ative-sysroot loc.
mkdir -p ${mm_build_dir}/stage/tmp/sysroots-components/x86_64/pseudo-native/usr/bin ${root_files_loc}/../pseudo
ln -srf ${mm_home}/images/build/usr/bin/pseudo ${mm_build_dir}/stage/tmp/sysroots-components/x86_64/pseudo-native/usr/bin/pseudo

#echo '  entering fakeroot enviroment...'
#fakeroot -i ${mm_build_dir}/stage/image/rootfs.fakeroot sh -c " \
echo '  WIC output:'
${PYTHON} ${base_dir}/scripts/wic create ${base_dir}/MiniArch.wks \
--bootimg-dir=${boot_files_loc} \
--kernel-dir=${boot_files_loc} \
--rootfs-dir=${root_files_loc} \
--native-sysroot=${mm_home}/images/build \
${debug_flag}
#"
echo '  removing working files...'
rm -rf ${root_files_loc}/../pseudo*
rm -f ${base_dir}/MiniArch.wks
rm -f ${base_dir}/conf/multiconfig/default.conf
rm -rf ${base_dir}/cache*
rm -rf ${base_dir}/tmp*

echo '  compressing SD image...'
rename MiniArch-*.direct ${image_filename}.img *
xz -f ${image_filename}.img

echo '  SD image creation done!'
mv -f ${BUILDDIR}/${image_filename}* ${install_dir}/
echo "  Image is here:${install_dir}/${image_filename}.xz"

echo '  removing working dirs ...'
rm -rf ${mm_build_dir}*

exit 0
