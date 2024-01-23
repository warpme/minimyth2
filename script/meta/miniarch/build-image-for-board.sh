#!/bin/sh

#--------------------------------------------------------------------------------------
# Config area begin

mm_conf_file="${HOME}/.minimyth2/minimyth.conf.mk"

# This disable all except SD card to speedup process of building
# new SD card image
extra_params=' \
        mm_STRIP_IMAGE="yes" \
'
# To add new board, add it in this file
boards_list_file="../convinience-script-boards.list"

# Uncomment to get some debugging
# debug="1"

# Config area end
#--------------------------------------------------------------------------------------
































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

input=$1

board_list=`cat $boards_list_file | sed -e '/#/d' -e '/^$/d'`

if [ x${input} = "x" ] ; then

    echo " "
    echo "Script version:${ver}"
    echo " "

    while IFS= read -r entry; do

        id=`echo "${entry}" | sed 's/\s*//g' | cut -d":" -f1 | sed 's/\s*selection\s*//g'`
        boards=`echo "${entry}" | cut -d":" -f2 | sed 's/\t\r\n//g'`
        echo "[${id}] -> ${boards}"

    done <<< "$board_list"

    echo " "
    echo "Please choose board by typing NN<Enter>"
    echo "or press just Enter to exit..."
    echo " "

    read input

    echo " "

fi

cd ${mm_home}/script/meta/miniarch

cache_board_list() {
    rm -rf /tmp/miniarch-sd-card-boardlist.tmp
    echo "$1" > /tmp/miniarch-sd-card-boardlist.tmp
}

dbg() {
    if [ x$debug = "x1" ] ; then
        echo "$1"
    fi
}

build_for_board() {
    echo "==> Now building image for board: ${1}"
    cache_board_list ${1}
    make reinstall-new-board mm_BOARD_TYPE=${1} ${extra_params}
    make -C ../../bootloaders/bootloader clean-bootloader
}

while IFS= read -r entry; do

    id=`echo "${entry}" | sed 's/\s*//g' | cut -d":" -f1 | sed 's/\s*selection\s*//g'`
    boards=`echo "${entry}" | cut -d":" -f2 | sed 's/\t\r\n//g'`

    if [ x${input} = x${id} ] ; then

        echo "==> User selected ${id} to build ${boards} ..."

        for board in ${boards} ; do

            dbg "calling build for board:[${board}]"
            build_for_board ${board}

        done

    fi

done <<< "$board_list"

exit 0
