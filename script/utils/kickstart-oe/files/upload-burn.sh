
#--------------------------------------------------------------------------------------

mm_home="/home/piotro/minimyth-dev"
upload_addr="piotro@192.168.1.9"

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

echo " "
echo "---- Uploading SD image... ----"
echo " "
echo "  branch  : ${branch}"
echo "  version : ${version}"
echo "  arch    : ${arch}"
echo "  board   : ${board}"
echo " "

echo " "
echo "--> Uploading file to destimation (${upload_addr})..."
echo "(This may require account password on target machine)"
echo " "
scp -c none ${mm_build_dir}/stage/MiniMyth2-${arch}-${branch}-${version}-${board}-SD-Image.tar.bz2 ${upload_addr}:Desktop/MiniMyth2-${arch}-${branch}-${version}-${board}-SD-Image.tar.bz2
echo '--> Image upload done!';

echo " "
echo "--> Unpacking image on destination..."
ssh ${upload_addr} "cd Desktop; bsdtar -xf MiniMyth2-${arch}-${branch}-${version}-${board}-SD-Image.tar.bz2;"
echo '--> Image unapck done!'

echo " "
echo "--> Burning image on destination..."
echo "(This may require account password on target machine)"
echo " "
ssh ${upload_addr} "cd Desktop; echo movax | sudo -S /usr/local/bin/balena-etcher --drive /dev/disk2 --yes ./MiniMyth2-${arch}-${branch}-${version}-${board}-SD-Image.img;"
echo " "
echo "--> Done :-)"

