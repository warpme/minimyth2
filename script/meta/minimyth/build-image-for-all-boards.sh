
mm_conf_file="${HOME}/.minimyth2/minimyth.conf.mk"
mm_home=`grep "^mm_HOME " ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
cd ${mm_home}/script/meta/minimyth

make reinstall-new-board mm_BOARD_TYPE="board-rpi3.mainline64"
make reinstall-new-board mm_BOARD_TYPE="board-rpi4.mainline64"
make reinstall-new-board mm_BOARD_TYPE="board-sm1 board-h6.beelink_gs1"
make reinstall-new-board mm_BOARD_TYPE="board-s905 board-h6.eachlink_mini"
make reinstall-new-board mm_BOARD_TYPE="board-rk3328.beelink_a1"
make reinstall-new-board mm_BOARD_TYPE="board-rk3399.rockpi4-b"
make reinstall-new-board mm_BOARD_TYPE="board-s912 board-h6.tanix_tx6"

echo "Done!"

