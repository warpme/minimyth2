

#--------------------------------------------------------------------------------------
# Config area begin

mm_conf_file="${HOME}/.minimyth2/minimyth.conf.mk"

extra_params="mm_STRIP_IMAGE=yes"

selection_1="board-rpi3.mainline64"
selection_2="board-rpi4.mainline64"
selection_3="board-s905 board-h6.eachlink_mini"
selection_4="board-s912 board-h6.tanix_tx6"
selection_5="board-sm1 board-h6.beelink_gs1"
selection_6="board-rk3328.beelink_a1"
selection_7="board-rk3399.rockpi4-b"
selection_8="board_sm1"
selection_9="all above..."

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
    echo "Script version:${ver}"
    echo " "
    echo "Please choose board by pressing key [1..9]"
    echo " "
    echo "  (1) for "${selection_1}
    echo "  (2) for "${selection_2}
    echo "  (3) for "${selection_3}
    echo "  (4) for "${selection_4}
    echo "  (5) for "${selection_5}
    echo "  (6) for "${selection_6}
    echo "  (7) for "${selection_7}
    echo "  (8) for "${selection_8}
    echo "  (9) for "${selection_9}
    echo " "
    echo "or press Eneter to exit..."
    echo " "

    read selection

fi

cd ${mm_home}/script/meta/minimyth

cache_board_list() {
    rm -rf /tmp/mm2-sd-card-boardlist.tmp
    echo "$1" > /tmp/mm2-sd-card-boardlist.tmp
}

case "${selection}" in

    1)  cache_board_list "${selection_1}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_1}" "${extra_params}" ;;

    2)  cache_board_list "${selection_2}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_2}" "${extra_params}" ;;

    3)  cache_board_list "${selection_3}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_3}" "${extra_params}" ;;

    4)  cache_board_list "${selection_4}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_4}" "${extra_params}" ;;

    5)  cache_board_list "${selection_5}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_5}" "${extra_params}" ;;

    6)  cache_board_list "${selection_6}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_6}" "${extra_params}" ;;

    7)  cache_board_list "${selection_7}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_7}" "${extra_params}" ;;

    8)  cache_board_list "${selection_8}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_8}" "${extra_params}" ;;

    9)
        make reinstall-new-board mm_BOARD_TYPE="${selection_1}" "${extra_params}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_2}" "${extra_params}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_3}" "${extra_params}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_4}" "${extra_params}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_5}" "${extra_params}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_6}" "${extra_params}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_7}" "${extra_params}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_8}" "${extra_params}" ;;

    *)
        echo "Unknown selction !"
        echo "Exiting..."
        echo ""
        exit 1 ;;
esac

exit 0
