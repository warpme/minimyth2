#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-

LOCALPATH=$(pwd)
OUT=${LOCALPATH}/out
TOOLPATH=${LOCALPATH}/rkbin/tools
BOARD=$1

PATH=$PATH:$TOOLPATH

finish() {
	echo -e "\e[31m MAKE UBOOT IMAGE FAILED.\e[0m"
	exit -1
}
trap finish ERR

if [ $# != 1 ]; then
	BOARD=rk3288-evb
fi

[ ! -d ${OUT} ] && mkdir ${OUT}
[ ! -d ${OUT}/u-boot ] && mkdir ${OUT}/u-boot
[ ! -d ${OUT}/u-boot/spi ] && mkdir ${OUT}/u-boot/spi

source $LOCALPATH/build/board_configs.sh $BOARD

if [ $? -ne 0 ]; then
	exit
fi

echo -e "\e[36m Building U-boot for ${BOARD} board! \e[0m"
echo -e "\e[36m Using ${UBOOT_DEFCONFIG} \e[0m"

cd ${LOCALPATH}/u-boot
make ${UBOOT_DEFCONFIG} all

if  [ "${CHIP}" == "rk322x" ] || [ "${CHIP}" == "rk3036" ]; then
	if [ `grep CONFIG_SPL_OF_CONTROL=y ./.config` ] && \
			! [ `grep CONFIG_SPL_OF_PLATDATA=y .config` ] ; then
		SPL_BINARY=u-boot-spl-dtb.bin
	else
		SPL_BINARY=u-boot-spl-nodtb.bin
	fi

	if [ "${DDR_BIN}" ]; then
		# Use rockchip close-source ddrbin.
		dd if=${DDR_BIN} of=spl/${SPL_BINARY}
	fi

	tools/mkimage -n ${CHIP} -T \
		rksd -d spl/${SPL_BINARY} idbloader.img
	cat u-boot-dtb.bin >>idbloader.img
	cp idbloader.img ${OUT}/u-boot/
elif [ "${CHIP}" == "rk3288" ]; then
	$TOOLPATH/loaderimage --pack --uboot ./u-boot-dtb.bin uboot.img 0x200000 --size 1024 1
	tools/mkimage -n rk3288 -T rksd -d ../rkbin/bin/rk32/rk3288_ddr_400MHz_v1.07.bin idbloader.img
	cat ../rkbin/bin/rk32/rk3288_miniloader_v2.54.bin >> idbloader.img
	cp idbloader.img ${OUT}/u-boot/
	echo "idbloader.img is ready"

	$TOOLPATH/loaderimage --pack --uboot ./u-boot.bin uboot.img 0x0

	TOS_TA=`sed -n "/TOSTA=/s/TOSTA=//p" ../rkbin/RKTRUST/RK3288TOS.ini|tr -d '\r'`
	TOS_TA=$(echo ${TOS_TA} | sed "s/tools\/rk_tools\///g")
	$TOOLPATH/loaderimage --pack --trustos ../rkbin/${TOS_TA} ./trust.img 0x8400000

	mv trust.img ${OUT}/u-boot/
	cp uboot.img ${OUT}/u-boot/
elif [ "${CHIP}" == "rk3328" ]; then
	$TOOLPATH/loaderimage --pack --uboot ./u-boot-dtb.bin uboot.img 0x200000 --size 1024 1

	tools/mkimage -n rk3328 -T rksd -d ../rkbin/bin/rk33/rk3328_ddr_333MHz_v1.16.bin idbloader.img
	cat ../rkbin/bin/rk33/rk322xh_miniloader_v2.50.bin >> idbloader.img
	cp idbloader.img ${OUT}/u-boot/	
	cp ../rkbin/bin/rk33/rk3328_loader_ddr333_v1.16.250.bin ${OUT}/u-boot/

	cat >trust.ini <<EOF
[VERSION]
MAJOR=1
MINOR=2
[BL30_OPTION]
SEC=0
[BL31_OPTION]
SEC=1
PATH=../rkbin/bin/rk33/rk322xh_bl31_v1.42.elf
ADDR=0x10000
[BL32_OPTION]
SEC=0
[BL33_OPTION]
SEC=0
[OUTPUT]
PATH=trust.img
EOF

	$TOOLPATH/trust_merger --size 1024 1 trust.ini

	cp uboot.img ${OUT}/u-boot/
	cp trust.img ${OUT}/u-boot/
elif [ "${CHIP}" == "rk3399" ]; then
	$TOOLPATH/loaderimage --pack --uboot ./u-boot-dtb.bin uboot.img 0x200000 --size 1024 1

	tools/mkimage -n rk3399 -T rksd -d ../rkbin/bin/rk33/rk3399_ddr_800MHz_v1.20.bin idbloader.img
	cat ../rkbin/bin/rk33/rk3399_miniloader_v1.19.bin >> idbloader.img
	cp idbloader.img ${OUT}/u-boot/

	tools/mkimage -n rk3399 -T rkspi -d ../rkbin/bin/rk33/rk3399_ddr_800MHz_v1.20.bin idbloader-spi.img
	cat ../rkbin/bin/rk33/rk3399_miniloader_spinor_v1.14.bin >> idbloader-spi.img
	cp idbloader-spi.img ${OUT}/u-boot/spi

	cp ../rkbin/bin/rk33/rk3399_loader_v1.20.119.bin ${OUT}/u-boot/
	cp ../rkbin/bin/rk33/rk3399_loader_spinor_v1.20.126.bin ${OUT}/u-boot/spi

	cat >trust.ini <<EOF
[VERSION]
MAJOR=1
MINOR=0
[BL30_OPTION]
SEC=0
[BL31_OPTION]
SEC=1
PATH=../rkbin/bin/rk33/rk3399_bl31_v1.26.elf
ADDR=0x10000
[BL32_OPTION]
SEC=0
[BL33_OPTION]
SEC=0
[OUTPUT]
PATH=trust.img
EOF

	$TOOLPATH/trust_merger --size 1024 1 trust.ini

	cp uboot.img ${OUT}/u-boot/
	cp trust.img ${OUT}/u-boot/

	cat > spi.ini <<EOF
[System]
FwVersion=18.08.03
BLANK_GAP=1
FILL_BYTE=0
[UserPart1]
Name=IDBlock
Flag=0
Type=2
File=../rkbin/bin/rk33/rk3399_ddr_800MHz_v1.20.bin,../rkbin/bin/rk33/rk3399_miniloader_spinor_v1.14.bin
PartOffset=0x40
PartSize=0x7C0
[UserPart2]
Name=uboot
Type=0x20
Flag=0
File=./uboot.img
PartOffset=0x1000
PartSize=0x800
[UserPart3]
Name=trust
Type=0x10
Flag=0
File=./trust.img
PartOffset=0x1800
PartSize=0x800
EOF
	$TOOLPATH/firmwareMerger -P spi.ini ${OUT}/u-boot/spi
	mv ${OUT}/u-boot/spi/Firmware.img ${OUT}/u-boot/spi/uboot-trust-spi.img
	mv ${OUT}/u-boot/spi/Firmware.md5 ${OUT}/u-boot/spi/uboot-trust-spi.img.md5


elif [ "${CHIP}" == "rk3399pro" ]; then
	$TOOLPATH/loaderimage --pack --uboot ./u-boot-dtb.bin uboot.img 0x200000 --size 1024 1

	DDR_TYPE=("rk3399pro_ddr_800MHz_v1.20.bin" "rk3399_ddr_800MHz_v1.22_fix_row_3_4.bin")
	DDR_TYPE_SHORT=("" "-3GB-ddr")
	for num in {0..1}
	do
		tools/mkimage -n rk3399pro -T rksd -d ../rkbin/bin/rk33/${DDR_TYPE[$num]} idbloader${DDR_TYPE_SHORT[$num]}.img
		cat ../rkbin/bin/rk33/rk3399pro_miniloader_v1.15.bin >> idbloader${DDR_TYPE_SHORT[$num]}.img
		cp idbloader${DDR_TYPE_SHORT[$num]}.img ${OUT}/u-boot/

		tools/mkimage -n rk3399pro -T rkspi -d ../rkbin/bin/rk33/${DDR_TYPE[$num]} idbloader-spi${DDR_TYPE_SHORT[$num]}.img
		cat ../rkbin/bin/rk33/rk3399_miniloader_spinor_v1.14.bin >> idbloader-spi${DDR_TYPE_SHORT[$num]}.img
		cp idbloader-spi${DDR_TYPE_SHORT[$num]}.img ${OUT}/u-boot/spi

		cp ../rkbin/bin/rk33/rk3399pro_loader_v1.20.115.bin ${OUT}/u-boot/
		cp ../rkbin/bin/rk33/rk3399pro_loader_3GB_ddr_v1.22.115.bin ${OUT}/u-boot/
		cp ../rkbin/bin/rk33/rk3399pro_npu_loader_v1.02.102.bin ${OUT}/u-boot/
		cp ../rkbin/bin/rk33/rk3399_loader_spinor_v1.15.114.bin ${OUT}/u-boot/spi
	done

	cat >trust.ini <<EOF
[VERSION]
MAJOR=1
MINOR=0
[BL30_OPTION]
SEC=0
[BL31_OPTION]
SEC=1
PATH=../rkbin/bin/rk33/rk3399pro_bl31_v1.22.elf
ADDR=0x10000
[BL32_OPTION]
SEC=0
[BL33_OPTION]
SEC=0
[OUTPUT]
PATH=trust.img
EOF

	$TOOLPATH/trust_merger --size 1024 1 trust.ini

	cp uboot.img ${OUT}/u-boot/
	cp trust.img ${OUT}/u-boot/

	DDR_TYPE=("rk3399pro_ddr_800MHz_v1.20.bin" "rk3399_ddr_800MHz_v1.22_fix_row_3_4.bin")
	DDR_TYPE_SHORT=("" "-3GB-ddr")
	for num in {0..1}
	do
		cat > spi.ini <<EOF
[System]
FwVersion=18.08.03
BLANK_GAP=1
FILL_BYTE=0
[UserPart1]
Name=IDBlock
Flag=0
Type=2
File=../rkbin/bin/rk33/${DDR_TYPE[$num]},../rkbin/bin/rk33/rk3399pro_miniloader_v1.15.bin
PartOffset=0x40
PartSize=0x7C0
[UserPart2]
Name=uboot
Type=0x20
Flag=0
File=./uboot.img
PartOffset=0x1000
PartSize=0x800
[UserPart3]
Name=trust
Type=0x10
Flag=0
File=./trust.img
PartOffset=0x1800
PartSize=0x800
EOF
		$TOOLPATH/firmwareMerger -P spi.ini ${OUT}/u-boot/spi
		mv ${OUT}/u-boot/spi/Firmware.img ${OUT}/u-boot/spi/uboot-trust-spi${DDR_TYPE_SHORT[$num]}.img
		mv ${OUT}/u-boot/spi/Firmware.md5 ${OUT}/u-boot/spi/uboot-trust-spi${DDR_TYPE_SHORT[$num]}.img.md5
	done
elif [ "${CHIP}" == "rk3128" ]; then
	$TOOLPATH/loaderimage --pack --uboot ./u-boot-dtb.bin uboot.img

	dd if=../rkbin/rk31/rk3128_ddr_300MHz_v2.06.bin of=DDRTEMP bs=4 skip=1
	tools/mkimage -n rk3128 -T rksd -d DDRTEMP idbloader.img
	cat ../rkbin/rk31/rk312x_miniloader_v2.40.bin >> idbloader.img
	cp idbloader.img ${OUT}/u-boot/
	cp ../rkbin/rk31/rk3128_loader_v2.05.240.bin ${OUT}/u-boot/

	$TOOLPATH/loaderimage --pack --trustos ../rkbin/rk31/rk3126_tee_ta_v1.27.bin trust.img

	cp uboot.img ${OUT}/u-boot/
	mv trust.img ${OUT}/u-boot/
elif [ "${CHIP}" == "rk3308" ]; then
	$TOOLPATH/loaderimage --pack --uboot ./u-boot-dtb.bin uboot.img 0x600000 --size 1024 1

	tools/mkimage -n rk3308 -T rksd -d ../rkbin/bin/rk33/rk3308_ddr_589MHz_uart0_m0_v1.26.bin idbloader.img
	cat ../rkbin/bin/rk33/rk3308_miniloader_emmc_port_support_sd_20190717.bin >> idbloader.img
	cp idbloader.img ${OUT}/u-boot/
	cp ../rkbin/bin/rk33/rk3308_loader_uart0_m0_emmc_port_support_sd_20190717.bin ${OUT}/u-boot

	cat >trust.ini <<EOF
[VERSION]
MAJOR=1
MINOR=0
[BL30_OPTION]
SEC=0
[BL31_OPTION]
SEC=1
PATH=../rkbin/bin/rk33/rk3308_bl31_v2.10.elf
ADDR=0x00010000
[BL32_OPTION]
SEC=0
[BL33_OPTION]
SEC=0
[OUTPUT]
PATH=trust.img
EOF

	$TOOLPATH/trust_merger --size 1024 1 trust.ini

	cp uboot.img ${OUT}/u-boot/
	cp trust.img ${OUT}/u-boot/
elif [ "${CHIP}" == "px30" ]; then
	$TOOLPATH/loaderimage --pack --uboot ./u-boot-dtb.bin uboot.img 0x200000 --size 1024 1

	tools/mkimage -n px30 -T rksd -d ../rkbin/bin/rk33/px30_ddr_333MHz_v1.14.bin idbloader.img
	cat ../rkbin/bin/rk33/px30_miniloader_v1.20.bin >> idbloader.img
	cp idbloader.img ${OUT}/u-boot/
	cp ../rkbin/bin/rk33/px30_loader_v1.14.120.bin ${OUT}/u-boot

	cat >trust.ini <<EOF
[VERSION]
MAJOR=1
MINOR=0
[BL30_OPTION]
SEC=0
[BL31_OPTION]
SEC=1
PATH=../rkbin/bin/rk33/px30_bl31_v1.18.elf
ADDR=0x00010000
[BL32_OPTION]
SEC=0
[BL33_OPTION]
SEC=0
[OUTPUT]
PATH=trust.img
EOF

	$TOOLPATH/trust_merger --size 1024 1 trust.ini

	cp uboot.img ${OUT}/u-boot/
	cp trust.img ${OUT}/u-boot/
fi
echo -e "\e[36m U-boot IMAGE READY! \e[0m"
