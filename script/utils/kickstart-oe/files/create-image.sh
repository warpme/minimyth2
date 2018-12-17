
mm_home="/home/piotro/minimyth-dev"
use_minimyth_python3="no"

#--------------------------------------------------------------------------------------

mm_conf_file="${mm_home}/minimyth.conf.mk"

board=$1

if [ x${board} = "x" ] ; then
    board=`  grep "^mm_BOARD_TYPE "       ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
fi

branch=` grep "^mm_MYTH_VERSION "     ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
version=`grep "^mm_VERSION_MINIMYTH " ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
arch=`   grep "^mm_GARCH "            ${mm_conf_file} | sed -e 's/.*\?=*\s//'`

base_dir=${mm_home}/images/build/usr/bin/kickstart
mm_build_dir=${mm_home}/script/meta/minimyth/work/main.d/minimyth-master-${version}/build
root_files_loc=${mm_build_dir}/stage/image/rootfs
boot_files_loc=${mm_build_dir}/stage/boot

export BUILDDIR=${mm_build_dir}/stage
export BBPATH=${base_dir}
export PATH=${base_dir}/bitbake/bin:${PATH}
export PYTHONPATH=${base_dir}/bitbake/lib:${PYTHONPATH}

if [ x${use_minimyth_python3} = "xyes" ] ; then 
    export PATH=/home/piotro/minimyth-dev/images/build/bin:/home/piotro/minimyth-dev/images/build/usr/bin:${PATH}
    export PYTHONPATH=/home/piotro/minimyth-dev/images/build/usr/lib/python3.7:${PYTHONPATH}
    export PYTHON=/home/piotro/minimyth-dev/images/build/usr/bin/python3
    export LD_LIBRARY_PATH=/home/piotro/minimyth-dev/images/build/usr/lib
else
    export PYTHON=/usr/bin/python3
fi

echo " "
echo "---- Starting to create SD image... ----"
echo " "
echo "  branch  : ${branch}"
echo "  version : ${version}"
echo "  arch    : ${arch}"
echo "  board   : ${board}"
echo "  boot    : ${boot_files_loc}"
echo "  rootfs  : ${root_files_loc}"
echo " "

echo "--> Setting right (${board}) config file..."
cp -f ${base_dir}/conf/multiconfig/${board}.conf ${base_dir}/conf/multiconfig/default.conf

echo '--> Preparing for building SD Image...'
cd ${BUILDDIR}
rm -f  ${BUILDDIR}/*.log
rm -f  ${BUILDDIR}/*.direct
rm -f  ${BUILDDIR}/*.vfat
rm -f  ${BUILDDIR}/*.ext4
rm -rf ${root_files_loc}/../pseudo*
mkdir -p ${mm_build_dir}/stage/tmp/sysroots-components/x86_64/pseudo-native/usr/bin
ln -srf ${base_dir}/native-bins/usr/bin/pseudo ${mm_build_dir}/stage/tmp/sysroots-components/x86_64/pseudo-native/usr/bin/pseudo

echo '--> Entering fakeroot enviroment...'
fakeroot -i ${mm_build_dir}/stage/image/rootfs.fakeroot sh -c " \
${PYTHON} ${base_dir}/scripts/wic create ${base_dir}/MiniMyth2.wks \
--bootimg-dir=${boot_files_loc} \
--kernel-dir=${boot_files_loc} \
--rootfs-dir=${root_files_loc} \
--native-sysroot=${base_dir}/native-bins \
"
echo '--> Removing working files...'
rm -rf ${root_files_loc}/../pseudo*

echo '--> Packaging image...'
rename MiniMyth2-*.direct MiniMyth2-${arch}-${branch}-${version}-${board}-SD-Image.img *
tar cjvf MiniMyth2-${arch}-${branch}-${version}-${board}-SD-Image.tar.bz2 ./*.img
rm -f ./*.img

echo '--> Image creation done!'

exit 0
