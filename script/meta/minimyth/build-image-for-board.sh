

#--------------------------------------------------------------------------------------
# Config area begin

mm_conf_file="${HOME}/.minimyth2/minimyth.conf.mk"

extra_params="mm_STRIP_IMAGE=yes"

selection_1="board-rpi3.mainline64"
selection_2="board-rpi4.rpi64"
selection_3="board-s905 board-h6.eachlink_mini"
selection_4="board-s912 board-h6.tanix_tx6"
selection_5="board-sm1.x96_air2g board-h6.beelink_gs1"
selection_6="board-rk3328.beelink_a1"
selection_7="board-rk3399.rockpi4-b"
selection_8="board-rpi34.mainline64 board-sm1.tanix_tx5_plus"
selection_9="board-h616.orangepi_zero2"
selection_a="my testbed boards"
selection_b="board-x86pc.bios_efi64"
selection_c="board-h616.tanix_tx6s"
selection_d="board-rpi3.mainline32"
selection_e="board-rk3399.orangepi_4"
selection_f="board-h616.t95"
selection_g="board-h616.x96_mate"
selection_h="board-g12.radxa_zero"
selection_i="board-sm1.tanix_tx5_plus"
selection_j="board-rk3566.x96_x6"
selection_k="board-h6.orangepi_3"
selection_l="board-rk3568.rock3-a"
selection_m="board-rk3568.rock3-b"
selection_n="board-rk3566.quartz64-b"
selection_o="board-rpi4.mainline64"
selection_p="board-rk3566.rock3-c"
selection_r="board-rk3399.rockpi4-se"
selection_s="board-rk3588.rock5-b"
selection_t="board-rk3588s.rock5-a"
selection_u="board-rk3566.urve-pi"
selection_w="board-h313.x96_q"

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
    echo "  (a) for "${selection_a}
    echo "  (b) for "${selection_b}
    echo "  (c) for "${selection_c}
    echo "  (d) for "${selection_d}
    echo "  (e) for "${selection_e}
    echo "  (f) for "${selection_f}
    echo "  (g) for "${selection_g}
    echo "  (h) for "${selection_h}
    echo "  (i) for "${selection_i}
    echo "  (j) for "${selection_j}
    echo "  (k) for "${selection_k}
    echo "  (l) for "${selection_l}
    echo "  (m) for "${selection_m}
    echo "  (n) for "${selection_n}
    echo "  (o) for "${selection_o}
    echo "  (p) for "${selection_p}
    echo "  (r) for "${selection_r}
    echo "  (s) for "${selection_s}
    echo "  (t) for "${selection_t}
    echo "  (u) for "${selection_u}
    echo "  (w) for "${selection_w}
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

# This disable all except SD card to speedup process of building
# new SD card image
extra_params=' \
        mm_DISTRIBUTION_SHARE="no" \
        mm_INSTALL_ONLINE_UPDATES="no" \
        mm_DISTRIBUTION_RAM="no" \
        mm_INSTALL_RAM_BOOT="no" \
        mm_DISTRIBUTION_NFS="no" \
        mm_INSTALL_NFS_BOOT="no" \
        mm_DISTRIBUTION_SDCARD="yes" \
'

case "${selection}" in

    1)  cache_board_list "${selection_1}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_1}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    2)  cache_board_list "${selection_2}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_2}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    3)  cache_board_list "${selection_3}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_3}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    4)  cache_board_list "${selection_4}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_4}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    5)  cache_board_list "${selection_5}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_5}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    6)  cache_board_list "${selection_6}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_6}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    7)  cache_board_list "${selection_7}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_7}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    8)  cache_board_list "${selection_8}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_8}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    9)  cache_board_list "${selection_9}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_9}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    a)
#        make reinstall-new-board mm_BOARD_TYPE="${selection_1}" ${extra_params}
#        make reinstall-new-board mm_BOARD_TYPE="${selection_2}" ${extra_params}
        make reinstall-new-board mm_BOARD_TYPE="${selection_3}" ${extra_params}
        make reinstall-new-board mm_BOARD_TYPE="${selection_4}" ${extra_params}
        make reinstall-new-board mm_BOARD_TYPE="${selection_5}" ${extra_params}
        make reinstall-new-board mm_BOARD_TYPE="${selection_6}" ${extra_params}
        make reinstall-new-board mm_BOARD_TYPE="${selection_7}" ${extra_params}
        make reinstall-new-board mm_BOARD_TYPE="${selection_8}" ${extra_params}
        make reinstall-new-board mm_BOARD_TYPE="${selection_9}" ${extra_params}
        make reinstall-new-board mm_BOARD_TYPE="${selection_c}" ${extra_params}
        make reinstall-new-board mm_BOARD_TYPE="${selection_h}" ${extra_params}
        make reinstall-new-board mm_BOARD_TYPE="${selection_j}" ${extra_params}
        make reinstall-new-board mm_BOARD_TYPE="${selection_l}" ${extra_params}
        make reinstall-new-board mm_BOARD_TYPE="${selection_n}" ${extra_params}
        make reinstall-new-board mm_BOARD_TYPE="${selection_p}" ${extra_params}
        make reinstall-new-board mm_BOARD_TYPE="${selection_r}" ${extra_params}
        make reinstall-new-board mm_BOARD_TYPE="${selection_u}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    b)  cache_board_list "${selection_b}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_b}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    c)  cache_board_list "${selection_c}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_c}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    d)  cache_board_list "${selection_d}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_d}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    e)  cache_board_list "${selection_e}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_e}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    f)  cache_board_list "${selection_f}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_f}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    g)  cache_board_list "${selection_g}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_g}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    h)  cache_board_list "${selection_h}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_h}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    i)  cache_board_list "${selection_i}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_i}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    j)  cache_board_list "${selection_j}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_j}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    k)  cache_board_list "${selection_k}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_k}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    l)  cache_board_list "${selection_l}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_l}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    m)  cache_board_list "${selection_m}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_m}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    n)  cache_board_list "${selection_n}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_n}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    o)  cache_board_list "${selection_o}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_o}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    p)  cache_board_list "${selection_p}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_p}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    r)  cache_board_list "${selection_r}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_r}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    s)  cache_board_list "${selection_s}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_s}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    t)  cache_board_list "${selection_t}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_t}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    u)  cache_board_list "${selection_u}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_u}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    w)  cache_board_list "${selection_w}"
        make reinstall-new-board mm_BOARD_TYPE="${selection_w}" ${extra_params}
        make -C ../../bootloaders/bootloader clean-bootloader ;;

    *)
        echo "Unknown selction !"
        echo "Exiting..."
        echo ""
        exit 1 ;;
esac

exit 0
