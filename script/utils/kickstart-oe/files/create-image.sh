
use_minimyth_python3="yes"
debug_verbosity="no"















#--------------------------------------------------------------------------------------

mm_conf_file="${HOME}/.minimyth2/minimyth.conf.mk"

boards="$1"

if [ "x${boards}" = "x" ] ; then
    boards=`  grep "^mm_BOARD_TYPE "       ${mm_conf_file} | sed -e 's/.*\?=//'`
    echo "  using boards list (${boards}) from minimyth.conf.mk"
else
    echo "  using boards list (${boards}) from script command-line"
fi

branch=` grep "^mm_MYTH_VERSION "     ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
version=`grep "^mm_VERSION_MINIMYTH " ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
arch=`   grep "^mm_GARCH "            ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
mm_home=`grep "^mm_HOME "             ${mm_conf_file} | sed -e 's/.*\?=*\s//'`

base_dir=${mm_home}/images/build/usr/bin/kickstart

mm_build_dir=${mm_home}/script/meta/minimyth/work/main.d/minimyth-${branch}-${version}/build
# Checking do we do debug image?
if [ ! -d ${mm_build_dir} ] ; then
    mm_build_dir=${mm_home}/script/meta/minimyth/work/main.d/minimyth-${branch}-${version}-debug/build
fi

if [ ! -d ${mm_build_dir} ] ; then
    echo "ERROR: create-image.sh can't find mm_build_dir at [${mm_build_dir}]"
    exit 1
fi

root_files_loc=${mm_build_dir}/stage/image/rootfs
boot_files_loc=${mm_build_dir}/stage/boot

export BUILDDIR=${mm_build_dir}/stage
export BBPATH=${base_dir}
export PATH=${base_dir}/bitbake/bin:/sbin:/bin:/usr/sbin:/usr/bin
export PYTHONPATH=${base_dir}/bitbake/lib:${PYTHONPATH}

if [ x${use_minimyth_python3} = "xyes" ] ; then 
    export PATH=${mm_home}/images/build/bin:${mm_home}/images/build/usr/bin:${PATH}
    export PYTHONPATH=${mm_home}/images/build/usr/lib/python3.8:${PYTHONPATH}
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
rm -f ${base_dir}/MiniMyth2.wks
echo "#----Entries to raw-copy SPL, bootloader, etc " > ${base_dir}/MiniMyth2.wks

for board in ${boards} ; do
    echo "  adding "${board}" to default.config & MiniMyth2.wks"
    cat ${base_dir}/conf/multiconfig/${board}.conf >> ${base_dir}/conf/multiconfig/default.conf
    boards_list=${board}-${boards_list}
    cat ${base_dir}/${board}.wks >> ${base_dir}/MiniMyth2.wks
done
echo "#----Entries to create boot & rootfs partitions" >> ${base_dir}/MiniMyth2.wks

# Selecting appropriate common.wks file
if [ ! -z `echo ${boards} | grep -o "board-x86pc"` ] ; then
    echo "  board-x86pc detected. skipping default-mbr[gpt].wks"
elif [ ! -z `echo ${boards} | grep -o "board-rk3566.x96_x6"` ] ; then
    echo "  board-rk35xx detected: using rk3566.x96_x6-gpt.wks"
    cat ${base_dir}/rk3566.x96_x6-gpt.wks >> ${base_dir}/MiniMyth2.wks
elif [ ! -z `echo ${boards} | grep -o "board-rk3566.*"` ] ; then
    echo "  board-rk35xx detected: using default-gpt.wks"
    cat ${base_dir}/default-gpt.wks >> ${base_dir}/MiniMyth2.wks
else
    echo "  board-x86pc detected. Using default-mbr.wks"
    cat ${base_dir}/default-mbr.wks >> ${base_dir}/MiniMyth2.wks
fi

sed -i "s%@MM_HOME@%${mm_home}%g" ${base_dir}/MiniMyth2.wks

echo "  boards        : ${boards_list}"
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
mkdir -p ${mm_build_dir}/stage/tmp/sysroots-components/x86_64/pseudo-native/usr/bin
ln -srf ${mm_home}/images/build/usr/bin/pseudo ${mm_build_dir}/stage/tmp/sysroots-components/x86_64/pseudo-native/usr/bin/pseudo

echo '  entering fakeroot enviroment...'
fakeroot -i ${mm_build_dir}/stage/image/rootfs.fakeroot sh -c " \
echo '  WIC output:'
${PYTHON} ${base_dir}/scripts/wic create ${base_dir}/MiniMyth2.wks \
--bootimg-dir=${boot_files_loc} \
--kernel-dir=${boot_files_loc} \
--rootfs-dir=${root_files_loc} \
--native-sysroot=${mm_home}/images/build \
${debug_flag}
"
echo '  removing working files...'
rm -rf ${root_files_loc}/../pseudo*

echo '  compressing SD image...'
rename MiniMyth2-*.direct MiniMyth2-${arch}-${branch}-${version}-${boards_list}SD-Image.img *
xz -f MiniMyth2-${arch}-${branch}-${version}-${boards_list}SD-Image.img

echo '  SD image creation done!'
echo "  Image is here:${BUILDDIR}/MiniMyth2-${arch}-${branch}-${version}-${boards_list}SD-Image.img.xz"

exit 0
