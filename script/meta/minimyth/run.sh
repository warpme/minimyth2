#!/bin/bash
#
# Convienience script to daily tasks...
# Pressing key will do most frequent tasks.

#--------------------------------------------------------------------------------------
# Config area begin

mm_conf_file="${HOME}/.minimyth2/minimyth.conf.mk"

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

selection=$1

if [ x${selection} = "x" ] ; then

    echo " "
    echo "---- Convienience script v${ver}, (c)Piotr Oniszczuk ----"
    echo " "
    echo "Please choose action by pressing key [1..9]"
    echo " "
    echo "  (1) Update MythTV sources & Re-build"
    echo "  (2) Sync local GIT to remote GIT"
    echo "  (3) Re-build MiniMyth2 unstripped image"
    echo "  (4) Re-build MiniMyth2 stripped image"
    echo "  (5) Re-build MythTV"
    echo "  (6) Burn SD card image to SD card"
    echo "  (7) Build SD card image for board"
    echo "  (8) Re-build Linux Kernel"
    echo "  (9) Re-build Mesa 3D library"
    echo "  (b) Re-build current bootloader"
    echo "  (d) Re-build MythTV with debug profile and unstripped image"
    echo "  (n) Install NFS boot/root files"
    echo "  (r) Install pxeboot RAMfs files"
    echo "  (o) Install On-Line update files"
    echo "  (s) Install SDcard/USBkey files"
    echo " "
    echo "or press Enter to exit..."
    echo

    read selection

fi

cd ${mm_home}/script/meta/minimyth

case "${selection}" in

    1)  rm -rf /tmp/mm2-sd-card-boardlist.tmp
        ./update-mythtv-sources-and-rebuild-mythtv.sh ;;

    2)  git fetch origin
        git reset --hard origin/master ;;

    3)  rm -rf /tmp/mm2-sd-card-boardlist.tmp
        make -C ../../bootloaders/bootloader clean-bootloader
        make clean install mm_STRIP_IMAGE="no" ;;

    4)  rm -rf /tmp/mm2-sd-card-boardlist.tmp
        make -C ../../bootloaders/bootloader clean-bootloader
        make clean install mm_STRIP_IMAGE="yes" ;;

    5)  rm -rf /tmp/mm2-sd-card-boardlist.tmp
        make rebuild-mythtv ;;

    6) ./burn-image-to-SD-card.sh ;;

    7) ./build-image-for-board.sh ;;

    8)  rm -rf /tmp/mm2-sd-card-boardlist.tmp
        make rebuild-kernel ;;

    9)  rm -rf /tmp/mm2-sd-card-boardlist.tmp
        make rebuild-mesa ;;

    b)  rm -rf /tmp/mm2-sd-card-boardlist.tmp
        make -C ../../bootloaders/bootloader clean clean-all install ;;

    d)  rm -rf /tmp/mm2-sd-card-boardlist.tmp
        make -C ../../myth/mythtv clean clean-all
        make clean install mm_DEBUG="yes" mm_STRIP_IMAGE="no" ;;

    n)  make \
        mm_DISTRIBUTION_SHARE="no" \
        mm_INSTALL_ONLINE_UPDATES="no" \
        mm_DISTRIBUTION_RAM="no" \
        mm_INSTALL_RAM_BOOT="no" \
        mm_DISTRIBUTION_NFS="yes" \
        mm_INSTALL_NFS_BOOT="yes" \
        mm_DISTRIBUTION_SDCARD="no" \
        reinstall
        ;;

    o)  make \
        mm_DISTRIBUTION_SHARE="no" \
        mm_INSTALL_ONLINE_UPDATES="yes" \
        mm_DISTRIBUTION_RAM="no" \
        mm_INSTALL_RAM_BOOT="no" \
        mm_DISTRIBUTION_NFS="no" \
        mm_INSTALL_NFS_BOOT="no" \
        mm_DISTRIBUTION_SDCARD="no" \
        reinstall
        ;;

    r)  make \
        mm_DISTRIBUTION_SHARE="no" \
        mm_INSTALL_ONLINE_UPDATES="no" \
        mm_DISTRIBUTION_RAM="yes" \
        mm_INSTALL_RAM_BOOT="yes" \
        mm_DISTRIBUTION_NFS="no" \
        mm_INSTALL_NFS_BOOT="no" \
        mm_DISTRIBUTION_SDCARD="no" \
        reinstall
        ;;

    s)  make reinstall-new-board mm_BOARD_TYPE="board-x86pc.bios_efi64"
        make \
        mm_DISTRIBUTION_SHARE="no" \
        mm_INSTALL_ONLINE_UPDATES="no" \
        mm_DISTRIBUTION_RAM="no" \
        mm_INSTALL_RAM_BOOT="no" \
        mm_DISTRIBUTION_NFS="no" \
        mm_INSTALL_NFS_BOOT="no" \
        mm_DISTRIBUTION_SDCARD="yes" \
        reinstall
        ;;

    *)
        echo "Unknown selction !"
        echo "Exiting..."
        echo ""
        exit 1 ;;
esac

exit 0

