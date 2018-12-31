
use_minimyth_python3="no"

#--------------------------------------------------------------------------------------

mm_conf_file="${HOME}/.minimyth2/minimyth.conf.mk"

boards=$1

if [ x${board} = "x" ] ; then
    boards=`  grep "^mm_BOARD_TYPE "       ${mm_conf_file} | sed -e 's/.*\?=//'`
fi

branch=` grep "^mm_MYTH_VERSION "     ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
version=`grep "^mm_VERSION_MINIMYTH " ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
arch=`   grep "^mm_GARCH "            ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
mm_home=`grep "^mm_HOME "             ${mm_conf_file} | sed -e 's/.*\?=*\s//'`

base_dir=${mm_home}/images/build/usr/bin/kickstart
mm_build_dir=${mm_home}/script/meta/minimyth/work/main.d/minimyth-master-${version}/build
root_files_loc=${mm_build_dir}/stage/image/rootfs
boot_files_loc=${mm_build_dir}/stage/boot

export BUILDDIR=${mm_build_dir}/stage
export BBPATH=${base_dir}
export PATH=${base_dir}/bitbake/bin:/sbin:/bin:/usr/sbin:/usr/bin
export PYTHONPATH=${base_dir}/bitbake/lib:${PYTHONPATH}

if [ x${use_minimyth_python3} = "xyes" ] ; then 
    export PATH=${mm_home}/images/build/bin:${mm_home}/images/build/usr/bin:${PATH}
    export PYTHONPATH=${mm_home}/images/build/usr/lib/python3.7:${PYTHONPATH}
    export PYTHON=${mm_home}/images/build/usr/bin/python3
    export LD_LIBRARY_PATH=${mm_home}/images/build/usr/lib
else
    export PYTHON=/usr/bin/python3
fi

rm -f ${base_dir}/conf/multiconfig/default.conf
echo "IMAGE_BOOT_FILES ?= \" \"" > ${base_dir}/conf/multiconfig/default.conf
echo "" >> ${base_dir}/conf/multiconfig/default.conf
boards_list=""

for board in ${boards} ; do
    echo "  adding "${board}" to default.config"
    cat ${base_dir}/conf/multiconfig/${board}.conf >> ${base_dir}/conf/multiconfig/default.conf
    boards_list=${board}-${boards_list}
done

echo "  boards        : ${boards_list}"
echo "  mm2 home dir  : [${mm_home}]"
echo "  boot files    : [${boot_files_loc}]"
echo "  rootfs files  : [${root_files_loc}]"

cd ${BUILDDIR}
rm -f  ${BUILDDIR}/*.log
rm -f  ${BUILDDIR}/*.direct
rm -f  ${BUILDDIR}/*.vfat
rm -f  ${BUILDDIR}/*.ext4
rm -rf ${root_files_loc}/../pseudo*
mkdir -p ${mm_build_dir}/stage/tmp/sysroots-components/x86_64/pseudo-native/usr/bin
ln -srf ${base_dir}/native-bins/usr/bin/pseudo ${mm_build_dir}/stage/tmp/sysroots-components/x86_64/pseudo-native/usr/bin/pseudo

echo '  entering fakeroot enviroment...'
fakeroot -i ${mm_build_dir}/stage/image/rootfs.fakeroot sh -c " \
echo '  WIC output:'
${PYTHON} ${base_dir}/scripts/wic create ${base_dir}/MiniMyth2.wks \
--bootimg-dir=${boot_files_loc} \
--kernel-dir=${boot_files_loc} \
--rootfs-dir=${root_files_loc} \
--native-sysroot=${base_dir}/native-bins \
"
echo '  removing working files...'
rm -rf ${root_files_loc}/../pseudo*

echo '  copmpressing SD image...'
rename MiniMyth2-*.direct MiniMyth2-${arch}-${branch}-${version}-${boards_list}SD-Image.img *
tar cjvf MiniMyth2-${arch}-${branch}-${version}-${boards_list}SD-Image.tar.bz2 ./*.img > /dev/null
rm -f ./*.img

echo '  SD image creation done'

exit 0
