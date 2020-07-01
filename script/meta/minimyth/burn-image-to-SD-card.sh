
# Script to automate uploading SD card image to remote host and burining it
# remotelly with balena-etcher
# Script:
# -copy via scp SD_image to {remote_dir} at {remote_addr}
# -ssh with command "sudo {remote_password} {balena_etcher_command} --drive {remote_flash_drive} SD_image

#--------------------------------------------------------------------------------------
# Config area begin

mm_conf_file="${HOME}/.minimyth2/minimyth.conf.mk"

remote_addr="<user>@<host>"
remote_dir="<dir>"
remote_password="<pass>"
remote_flash_drive="<device>"

scp_command="scp -c none "
ssh_command="ssh "

balena_etcher_command="/usr/local/bin/balena-etcher"

# Config area end
#--------------------------------------------------------------------------------------
ver="1.0"



















if [ ! -f ${mm_conf_file} ] ; then
    echo " "
    echo "Error: Can't find MiniMyth2 conf file !"
    echo "Exiting..."
    echo " "
    exit 1
fi
mm_home=`grep "^mm_HOME " ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
if [ ! -f ${mm_home}/script/meta/minimyth/Makefile ] ; then
    echo " "
    echo "Error: MiniMyth2 home [${mm_home}] seems to be wrong directory !"
    echo "Exiting..."
    echo " "
    exit 1
fi

boards=$1

echo "Script version:${ver}"

if [ x${board} = "x" ] ; then
    boards=`  grep "^mm_BOARD_TYPE "       ${mm_conf_file} | sed -e 's/.*\?=//'`
fi

branch=` grep "^mm_MYTH_VERSION "     ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
version=`grep "^mm_VERSION_MINIMYTH " ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
arch=`   grep "^mm_GARCH "            ${mm_conf_file} | sed -e 's/.*\?=*\s//'`

base_dir=${mm_home}/images/build/usr/bin/kickstart
mm_build_dir=${mm_home}/script/meta/minimyth/work/main.d/minimyth-${branch}-${version}/build

boards_list=""

if [ -e /tmp/mm2-sd-card-boardlist.tmp ]; then
    boards=`cat /tmp/mm2-sd-card-boardlist.tmp`
    echo "(Using cached boardlist: ${boards})"
fi

for board in ${boards} ; do
    boards_list=${board}-${boards_list}
done

echo " "
echo "---- Uploading SD image... ----"
echo " "
echo "  branch  : ${branch}"
echo "  version : ${version}"
echo "  arch    : ${arch}"
echo "  board   : ${boards_list}"
echo " "

if [ ! -e ${mm_build_dir}/stage/MiniMyth2-${arch}-${branch}-${version}-${boards_list}SD-Image.img.bz2 ] ; then
    echo "ERROR: there is no file:"
    echo "MiniMyth2-${arch}-${branch}-${version}-${boards_list}SD-Image.img.bz2"
    echo "at"
    echo "${mm_build_dir}/stage/"
    echo "Exiting..."
exit 1

fi

echo " "
echo "--> Uploading file to destimation (${remote_addr})..."
echo "(This may require account remote_password on target machine)"
echo " "
${scp_command} ${mm_build_dir}/stage/MiniMyth2-${arch}-${branch}-${version}-${boards_list}SD-Image.img.bz2 ${remote_addr}:${remote_dir}/MiniMyth2-${arch}-${branch}-${version}-${boards_list}SD-Image.img.bz2
echo '--> Image upload done!';

echo " "
echo "--> Burning image on destination..."
echo "(This may require account remote_password on target machine)"
echo " "
${ssh_command} ${remote_addr} "cd ${remote_dir}; echo ${remote_password} | sudo -S ${balena_etcher_command} --drive ${remote_flash_drive} --yes ./MiniMyth2-${arch}-${branch}-${version}-${boards_list}SD-Image.img.bz2;"
echo " "
echo "--> Done :-)"

