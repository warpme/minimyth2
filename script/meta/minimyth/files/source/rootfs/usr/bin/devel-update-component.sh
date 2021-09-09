#!/bin/sh

# Script updates changed files from devel. machine to remote target machine using rsync.
# To correct operation script requires rsync daemon running on devel.machne with
# appropriate /etc/rsyncd.conf and rsync binary on target.
# When launched script compares dirs/files and if there is file checksum difference - 
# it replaces old files on target with new files from devel. machine.
#
# Example:
# devel. machine at @MM_DEVEL_IP@ has mirror of target root file system
# at <@MM_HOME@>/main
#
# To configure:
#
# 1. On devel. machine edit /etc/rsyncd.conf to add snipped like below:
#
#---rsync snippet start----
#
#[devel-updates]
#    path = @MM_HOME@/images/main/
#    use chroot = true
#    read only = true
#
#"---rsync snippet end------
#
# 2.run '/usr/bin/rsync --daemon' on devel. machine
#
# 3.make sure on target machine in this script variable 'src_rsync_module' has
# correct IP address on devel.machine. Current autosetup IP for your env. is:
# src_rsync_module="@MM_DEVEL_IP@::devel-updates"
#
# 4. Run script on target and select component to update...
#
# Have fun....
#
# Script already has examplary lists for: MythTV frontend, Mesa3D, Linux kernel, FFmpeg
#
# How to add/modify sw.components:
# Script uses 2 types of list to define content to synchonize:
#
# <directory_list>
# This is white space separated list of tuples <src_dir/>:<dest_dir>
# Script will compare ALL contents on <dest_dir> with content of <src_dir> and if <src_dir>
# has file(s) with different checksums - file(s) from <dest_dir> will be replaced with file(s)
# from <src_dir> Files existing at <dst_dir> but not existing in <src_dir> will be deleted
# from <dst_dir>
#
# <files_list>
# This is white space sepatated list of tuples <src_file>:<dest_file[dir/]>
# Script will compare content of <dest_file> with <src_file> and if there is difference
# in checksums - <dest_file> will be replaced with <src_file> file.
# If second tuple member is <dst_dir> - script checks file at destination
# identified by source filename from <src_file>.


# -------config area begin ---------------------------------------------------

# Uncomment to do dry-run
# dry_run="yes"

# Default host IP::Module where new files reside
src_rsync_module="@MM_DEVEL_IP@::devel-updates"

# Log file with output from rsync
log_file="/var/log/online-update.log"

# Prefix in path to store updated files on persistent storage
persist_store_pref="/initrd/rootfs-ro"

# ---- MythTV dir/files ---
component_1="MythTV"
directory_list1="/usr/lib/mythtv/plugins/:/usr/lib/mythtv/plugins"
file_list1=" \
/usr/lib/libmyth*.so*:/usr/lib/ \
/usr/bin/mythfrontend:/usr/bin/ \
/usr/bin/mythffmpeg:/usr/bin/ \
/usr/bin/mythffplay:/usr/bin/ \
"
epilog_cmd1="mm_manage restart_mythfrontend"
#--------------------------

# ---- Mesa dir/files ---
component_2="Mesa3D"
directory_list2="/usr/lib/dri/:/usr/lib/dri"
file_list2=" \
/usr/lib/libEGL.so*:/usr/lib/ \
/usr/lib/libGL.so*:/usr/lib/ \
/usr/lib/libglapi.so*:/usr/lib/ \
/usr/lib/libgbm.so*:/usr/lib/ \
/usr/lib/libGLESv2.so*:/usr/lib/ \
/usr/lib/libGLESv1_CM.so*:/usr/lib/ \
"
if [ -e /usr/lib/libvdpau_r* ] ; then
    file_list2="${file_list2} /usr/lib/libvdpau_r*:/usr/lib/"
fi
if [ -e /usr/lib/radeonsi_drv_video.so* ] ; then
    file_list2="${file_list2} /usr/lib/radeonsi_drv_video.so*:/usr/lib/"
fi
if [ -e /usr/lib/r600_drv_video.so* ] ; then
    file_list2="${file_list2} /usr/lib/r600_drv_video.so*:/usr/lib/"
fi
epilog_cmd2="mm_manage restart_xserver"
#--------------------------

# ---- Kernel dir/files ---
component_3="Linux kernel"
directory_list3="
/boot/dtbs/:/media/boot/dtbs \
/lib/modules/:/initrd/rootfs-ro/lib/modules \
"
file_list3="/boot/*Image:/media/boot/"
epilog_cmd3="sync"
#--------------------------

# ---- FFmpeg dir/files ---
component_4="FFmpeg"
directory_list4=""
file_list4=" \
/usr/lib/libswscale.so*:/usr/lib/ \
/usr/lib/libswresample.so*:/usr/lib/ \
/usr/lib/libpostproc.so*:/usr/lib/ \
/usr/lib/libavutil.so*:/usr/lib/ \
/usr/lib/libavcodec.so*:/usr/lib/ \
/usr/lib/libavformat.so*:/usr/lib/ \
/usr/lib/libavfilter.so*:/usr/lib/ \
/usr/lib/libavdevice.so*:/usr/lib/ \
/usr/bin/ffprobe:/usr/bin/ \
/usr/bin/ffplay:/usr/bin/ \
/usr/bin/ffmpeg:/usr/bin/ \
"
epilog_cmd4=""
#--------------------------

# --- All lib/bin files ---
component_5="All libs & bins"
directory_list5=" \
/lib/:/lib \
/lib64/:/lib64 \
/bin/:/bin \
/sbin/:/sbin \
/usr/lib/:/usr/lib \
/usr/bin/:/usr/bin \
/usr/sbin/:/usr/sbin \
/usr/share/:/usr/share \
"
file_list5=""
epilog_cmd5="sync"
#--------------------------


#------- config area end ------------------------------------------------------
























ver="v1.2 by (c)Piotr Oniszczuk"

clear

selection=$1
persistent=$2

if [ x${persistent} = "xpersist" ] ; then
    dest_prefix=${persist_store_pref}
else
    dest_prefix=""
fi

echo " "
echo "---rsync snippet start----"
echo " "
echo "[devel-updates]"
echo "    path = @MM_HOME@/main/"
echo "    use chroot = true"
echo "    read only = true"
echo " "
echo "---rsync snippet end------"
echo " "

if [ x${selection} = "x" ] ; then

    echo " "
    echo "Script version:${ver}"
    echo " "
    echo "Please choose component to update by pressing key [1..5]"
    echo " "
    echo "  (1) for "${component_1}
    echo "  (2) for "${component_2}
    echo "  (3) for "${component_3}
    echo "  (4) for "${component_4}
    echo "  (5) for "${component_5}
    echo " "
    echo "or press Eneter to exit..."
    echo " "

    read selection

fi

case "${selection}" in

    1)
        echo "Updating ${component_1} ..."
        directory_list=${directory_list1}
        file_list=${file_list1}
        epilog_cmd="${epilog_cmd1}" ;;

    2)  echo "Updating ${component_2} ..."
        directory_list=${directory_list2}
        file_list=${file_list2}
        epilog_cmd="${epilog_cmd2}" ;;

    3)  echo "Updating ${component_3} ..."
        directory_list=${directory_list3}
        file_list=${file_list3}
        epilog_cmd="${epilog_cmd3}" ;;

    4)  echo "Updating ${component_4} ..."
        directory_list=${directory_list4}
        file_list=${file_list4}
        epilog_cmd="${epilog_cmd4}" ;;

    5)  echo "Updating ${component_5} ..."
        directory_list=${directory_list5}
        file_list=${file_list5}
        epilog_cmd="${epilog_cmd5}" ;;

    *)
        echo "Unknown selection !"
        echo "Exiting..."
        echo ""
        exit 1 ;;
esac

echo " "
echo "Source         : [${src_rsync_module}]"
echo "Directory list : [${directory_list}]"
echo "Files list     : [${file_list}]"
echo " "

run_rsync() {

    local src
    local dst
    local param

    src=$1
    dst=$2
    paam=$3

    echo ' '
    echo "From          : [$1]"
    echo "To            : [$2]"
    echo "Updated files :"

rsync \
--recursive \
--links \
--perms \
--devices \
--specials \
--checksum \
--compress \
--log-file=${log_file} \
--out-format=' => %f' \
--log-file-format='%f [%b bytes]' \
--stats \
--exclude=/dev* \
--exclude=*.ssh* \
--exclude=*_dtb \
--exclude=*.scr \
--exclude=config.txt \
--exclude=cmdline.txt \
--exclude=minimyth.conf \
--exclude=s905_autoscript \
--exclude=boot.ini \
--exclude=uEnv.ini \
$3 \
$1 \
$2 \

    echo " "

}


rm -f ${log_file}

if [ "x${dry_run}" = "xyes" ] ; then

    echo 'Starting dry-run for update ...'
    dry_run="--dry-run"

else

    echo 'Starting update ...'
    dry_run="--delete"

fi

if [ "x${directory_list}" != "x" ] ; then

    for tuple in ${directory_list} ; do

        src_dir=`echo ${tuple} | cut -d":" -f1`
        dst_dir=`echo ${tuple} | cut -d":" -f2`

        run_rsync "${src_rsync_module}${src_dir}" "${dest_prefix}${dst_dir}" "${dry_run}"

    done

else

    echo "Seems to be no any directories declared to rsyncing ..."

fi

if [ "x${file_list}" != "x" ] ; then

    for tuple in ${file_list} ; do

        src_file=`echo ${tuple} | cut -d":" -f1`
        dst_file=`echo ${tuple} | cut -d":" -f2`

        run_rsync "${src_rsync_module}${src_file}" "${dest_prefix}${dst_file}" "${dry_run}"

    done

else

    echo "Seems to be no any files declared to rsyncing ..."

fi

if [ -e ${log_file} ] ; then

    is_error=`cat ${log_file} 2>/dev/null | grep -c "error"`

else

    echo " "
    echo "Seems to be no any content declared to rsyncing ..."
    echo "Exiting!"
    echo " "
    exit 0

fi

if [ ${is_error} -eq 0 ] ; then

    number_upd_files=`cat ${log_file} | grep "Number of regular files transferred" | cut -d" " -f9 | sed -e 's/,//g'`

    for number in ${number_upd_files} ; do

      files_total=$((${files_total} + ${number}))

    done

    if [ x${files_total} = "x0" ] ; then

        echo " "
        echo " -------------------------------------------------"
        echo "   All files are already the same to source ..."
        echo " -------------------------------------------------"
        echo " "

    else

        echo " "
        echo " -------------------------------------------------"
        echo "            "${files_total}" files were updated ..."
        echo " -------------------------------------------------"

        if [ x${persistent} = "xpersist" ] ; then

            sleep 3
            echo " "
            echo "Running epilog cmd : [sync]"
            echo " "
            sync

        elif [ "x${epilog_cmd}" != "x" ] ; then

            sleep 3
            echo " "
            echo "Running epilog cmd : [${epilog_cmd}]"
            echo " "
            ${epilog_cmd}

        fi

    fi

    echo "All Done ! "
    echo " "

else

    echo 'Something went wrong :-( !'
    exit 1

fi

exit 0
