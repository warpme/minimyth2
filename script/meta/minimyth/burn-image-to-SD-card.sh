
# Script to automate uploading SD card image to remote host and burining it
# remotelly with balena-etcher
# Script:
# -copy via scp SD_image.xz to {remote_dir} at {remote_addr}
# -ssh to unpack on remote hast SD_image.xz
# -ssh to flash with command "sudo {remote_password} | {balena_etcher_command} --drive {remote_flash_drive} SD_image
#
# In macOS - remember to set "allow remote users full disk access" in macOS Preferences/Sharing/Remote Login

. ${HOME}/.minimyth2/burn-image-to-SD-card.conf

# burn-image-to-SD-card.conf must contain:

# mm_conf_file="${HOME}/.minimyth2/minimyth.conf.mk"
# remote_addr="<user@host_ip"
# remote_dir="<>dir"
# remote_password="<password>"
# default_remote_flash_drive="/dev/disk4"
# scp_command="scp -c aes128-ctr "
# ssh_command="ssh "
# balena_etcher_command="/usr/local/bin/balena"







ver="2.0"

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

sd_drive=`${ssh_command} ${remote_addr} "diskutil list external physical | grep /dev/disk | cut -d \" \" -f 1 | head -n 1"`
if [ x${sd_drive} = "x" ] ; then
    echo "Can't determine SD crd drive. Will use default drive [${default_remote_flash_drive}]"
    remote_flash_drive=${default_remote_flash_drive}
else
    remote_flash_drive=${sd_drive}
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
# Checking do we do debug image?
if [ ! -d ${mm_build_dir} ] ; then
    mm_build_dir=${mm_home}/script/meta/minimyth/work/main.d/minimyth-${branch}-${version}-debug/build
fi

boards_list=""

if [ -e /tmp/mm2-sd-card-boardlist.tmp ]; then
    boards=`cat /tmp/mm2-sd-card-boardlist.tmp`
    echo "(Using cached boardlist: ${boards})"
fi

for board in ${boards} ; do
    boards_list=${board}-${boards_list}
done

image_file="MiniMyth2-${arch}-${branch}-${version}-${boards_list}SD-Image.img"

if [ ! -e ${mm_build_dir}/stage/${image_file}.xz ] ; then
    echo "ERROR: there is no file:"
    echo "${image_file}.xz"
    echo "at"
    echo "[${mm_build_dir}/stage/]"
    echo "Exiting ..."
    exit 1

fi

echo " "
echo "---- Uploading SD image... ----"
echo " "
echo "  branch     : ${branch}"
echo "  version    : ${version}"
echo "  arch       : ${arch}"
echo "  board      : ${boards_list}"
echo "  image file : ${image_file}"
echo "  SD drive   : ${remote_flash_drive}"
echo " "

echo " "
echo "==> Uploading file to destination: ${remote_addr} ..."
echo "(This may require account remote_password on target machine)"
echo " "
${scp_command} ${mm_build_dir}/stage/${image_file}.xz ${remote_addr}:${remote_dir}/${image_file}.xz
echo '==> Image upload done ...'

echo " "
echo "==> Remotelly unpacking ${image_file}.xz ..."
echo " "
${ssh_command} ${remote_addr} "cd ${remote_dir}; /opt/local/bin/xz -df ${image_file}.xz"

echo " "
echo "==> Remotelly unmouting ${remote_flash_drive} ..."
echo " "
${ssh_command} ${remote_addr} "diskutil unmountDisk ${remote_flash_drive}"

flash_cmd="cd ${remote_dir} && echo '${remote_password}' | sudo -S ${balena_etcher_command} local flash ./${image_file} --yes --drive ${remote_flash_drive}"

echo " "
echo "==> Remotelly burning image ..."
echo "(This may require account remote_password on target machine)"
echo " "
# echo "Flash CMD: ${ssh_command} ${remote_addr} \"${flash_cmd}\""
${ssh_command} ${remote_addr} "${flash_cmd}"

echo " "
echo "==> Remotelly unmouting ${remote_flash_drive} ..."
echo " "
${ssh_command} ${remote_addr} "diskutil unmountDisk ${remote_flash_drive}"

echo " "
echo "==> Remotelly delete unpacked image ${image_file} ..."
echo " "
${ssh_command} ${remote_addr} "cd ${remote_dir}; rm -f ${image_file}"

echo " "
echo "==> Done :-)"
