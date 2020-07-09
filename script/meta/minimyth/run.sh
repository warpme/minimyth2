#!/bin/sh
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

    reset
    echo " "
    echo "---- Convienience script v${ver}, (c)Piotr Oniszczuk ----"
    echo " "
    echo "Please choose action by pressing key [1..9]"
    echo " "
    echo "  (1) Update MythTV sources & Re-build"
    echo "  (3) Build Archlinux package"
    echo "  (4) Re-build MiniMyth2 image"
    echo "  (5) Re-build MythTV"
    echo "  (6) Burn SD card image to SD card"
    echo "  (7) Build SD card image for board"
    echo "  (8) Re-build Linux Kernel"
    echo "  (9) Re-build Mesa 3D library"
    echo " "
    echo "or press Enter to exit..."
    echo

    read selection

fi

cd ${mm_home}/script/meta/minimyth

case "${selection}" in

    1)  rm -rf /tmp/mm2-sd-card-boardlist.tmp
        ./update-mythtv-sources-and-rebuild-mythtv.sh ;;

    5)  rm -rf /tmp/mm2-sd-card-boardlist.tmp
        make rebuild-mythtv ;;

    4)  rm -rf /tmp/mm2-sd-card-boardlist.tmp
        make clean install ;;

    6) ./burn-image-to-SD-card.sh ;;

    7) ./build-image-for-board.sh ;;

    8)  rm -rf /tmp/mm2-sd-card-boardlist.tmp
        make rebuild-kernel ;;

    9)  rm -rf /tmp/mm2-sd-card-boardlist.tmp
        make rebuild-mesa ;;

    *)
        echo "Unknown selction !"
        echo "Exiting..."
        echo ""
        exit 1 ;;
esac

exit 0

