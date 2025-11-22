
# For forcing given board (usually for testing)
# test bootloader will be in usr/lib/u-boot/test-<soc>

# mm_U-BOOT_BOARD_TYPE = test-rk3328
# mm_U-BOOT_BOARD_DEFCONFIG = beelink-a1-rk3328_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = generic-rk3328_defconfig

# mm_U-BOOT_BOARD_TYPE = test-rk3399
# mm_U-BOOT_BOARD_DEFCONFIG = orangepi-rk3399_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = rock-4se-rk3399_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = rock-pi-4-rk3399_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = rock-pi-4c-rk3399_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = generic-rk3399_defconfig

# mm_U-BOOT_BOARD_TYPE = test-rk3528
# mm_U-BOOT_BOARD_DEFCONFIG = generic-rk3528_defconfig

# mm_U-BOOT_BOARD_TYPE = test-rk3566
# mm_U-BOOT_BOARD_DEFCONFIG = orangepi-3b-rk3566_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = quartz64-b-rk3566_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = radxa-zero-3-rk3566_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = x96-x6-rk3566_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = rock-3c-rk3566_defconfig

# mm_U-BOOT_BOARD_TYPE = test-rk3568
# mm_U-BOOT_BOARD_DEFCONFIG = rock-3a-rk3568_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = rock-3b-rk3568_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = generic-rk3568_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = generic-rk3588_defconfig

# mm_U-BOOT_BOARD_TYPE = test-rk3576
# mm_U-BOOT_BOARD_DEFCONFIG = generic-rk3576_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = roc-pc-rk3576_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = board-rk3576.rock_4d

# mm_U-BOOT_BOARD_TYPE = test-rk3588.
# mm_U-BOOT_BOARD_DEFCONFIG = orangepi-5-plus-rk3588_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = rock5b-rk3588_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = rock-5-itx-rk3588_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = rock5t-rk3588_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = nanopc-t6-rk3588_defconfig

# mm_U-BOOT_BOARD_TYPE = test-rk3588s.
# mm_U-BOOT_BOARD_DEFCONFIG = orangepi-5-rk3588s_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = rock5a-rk3588s_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = nanopi-r6s-rk3588s_defconfig


GARNAME      = u-boot-rk
# git@ 06.10.2025 mainline 2025.10 GA
GARVERSION   = e50b1e8715011def8aff1588081a2649a2c6cd47
# git@ 13.06.2025 https://github.com/rockchip-linux/rkbin/commits/master/
RKBINVERSION = 74213af1e952c4683d2e35952507133b61394862
MASTER_SITES = \
               https://github.com/rockchip-linux/rkbin/raw/3cb8a4e35c99d06563b3707f7e4df1fad68dc301/bin/rk35/ \
               https://github.com/rockchip-linux/rkbin/archive/ \
               https://github.com/u-boot/u-boot/archive/ \

DISTFILES    = $(GARVERSION).zip $(RKBINVERSION).zip rk3576_bl31_v1.08.elf
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
PATCHFILES  += 01-drivers-fastboot-Kconfig-rk35xx-add-def_fastbuf_addr.patch
PATCHFILES  += 02-rockchip-rk3328-set-vop-qos-to-high-priority.patch
PATCHFILES  += 03-ufs-core-Add-ufshcd_dme_enable-and-ufshcd_dme_reset-v3.patch
PATCHFILES  += 04-ufs-rockchip-Add-initial-support-v3.patch
PATCHFILES  += 19-rockchip-mkimage-Split-size_and_off-and-size_and_nim.patch
PATCHFILES  += 20-rockchip-mkimage-Print-image-information-for-all-emb.patch
PATCHFILES  += 21-rockchip-mkimage-Print-boot0-and-boot1-parameters.patch
PATCHFILES  += 22-rockchip-mkimage-Add-option-to-change-image-offset-a.patch
PATCHFILES  += 23-rockchip-mkimage-Add-support-for-up-to-4-input-files.patch
PATCHFILES  += 24-rockchip-mkimage-Add-option-for-image-load-address-a.patch
PATCHFILES  += 25-WIP-rockchip-mkimage-Add-rk3576-align-and-sd-card-workarroud.patch
PATCHFILES  += 50-my-boards-rk3566-defconfigs-enable-overlays.patch
PATCHFILES  += 51-add-rk3328-beelink-a1-defconfig.patch
PATCHFILES  += 52-add-rk3566-x96-x6-defconfig.patch
PATCHFILES  += 53-add-rk3588-rock-5t-defconfig.patch
PATCHFILES  += 54-rk3399-rock-pi-4.dtsi-remove-hdmi-and-audio.patch
PATCHFILES  += 55-rk3588-rock5-itx-disable-spi-in-defconfig.patch
PATCHFILES  += 56-rk3566-zero3-sync-dts-to-kernel-to-make-eth-working.patch
PATCHFILES  += 57-rk3399-orangepi-fix-nonworking-ddc.patch

CATEGORIES   = bootloaders
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS = devel/swig utils/dtc python3/python-pyelftools lib/libgnutls

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = uboot idbloader
INSTALL_SCRIPTS     = custom

include ../../gar.mk
include ../../python3/python/package-api.mk

# set to default value when package build is called without any defined board....
mm_U-BOOT_BOARD_TYPE ?= test-rk3588

# set this for inform ATF about plat to build
export mm_U-BOOT_BOARD_TYPE

ifneq (,$(findstring rk3328,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk33/rk3328_ddr_333MHz_v1.21.bin
# BL31         = ../rkbin/bin/rk33/rk322xh_bl31_v1.49.elf
BL31         = $(DESTDIR)$(libdir)/u-boot/rk3328/bl31.bin
MKIMAGE_TYPE = rk3328
INSTALL_PREF = rk3328
DDR_BIN      = ${TPL}
DEFCONFIG    = generic-rk3328_defconfig
endif

ifneq (,$(findstring rk3399,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk33/rk3399_ddr_800MHz_v1.30.bin
# use rkbin bl31 as with mainline 2.13 bl31 there is no hdmi auio
BL31         = ../rkbin/bin/rk33/rk3399_bl31_v1.36.elf
# BL31         = $(DESTDIR)$(libdir)/u-boot/rk3399/bl31.bin
MKIMAGE_TYPE = rk3399
INSTALL_PREF = rk3399
DDR_BIN      = ${TPL}
DEFCONFIG    = generic-rk3399_defconfig
endif

ifneq (,$(findstring rk3528,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk35/rk3528_ddr_1056MHz_4BIT_PCB_v1.11.bin
# use rkbin bl31 as mainline 2.13 bl31 don't have support for 3528 (yet)
BL31         = ../rkbin/bin/rk35/rk3528_bl31_v1.20.elf
# BL31         = $(DESTDIR)$(libdir)/u-boot/rk3528/bl31.bin
MKIMAGE_TYPE = rk3528
INSTALL_PREF = rk3528
DDR_BIN      = ${TPL}
DEFCONFIG    = generic-rk3528_defconfig
endif

ifneq (,$(findstring rk3566,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk35/rk3566_ddr_1056MHz_v1.23.bin
# use rkbin bl31 as with mainline 2.13 bl31 there is issue with gpu clocking
BL31         = ../rkbin/bin/rk35/rk3568_bl31_v1.45.elf
# BL31         = $(DESTDIR)$(libdir)/u-boot/rk3566/bl31.bin
MKIMAGE_TYPE = rk3568
INSTALL_PREF = rk3566
DDR_BIN      = ${TPL}
#DEFCONFIG    = generic-rk3566_defconfig
DEFCONFIG    = generic-rk3568_defconfig
endif

ifneq (,$(findstring rk3568,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk35/rk3568_ddr_1056MHz_v1.23.bin
# use rkbin bl31 as with mainline 2.13 bl31 there is issue with gpu clocking
BL31         = ../rkbin/bin/rk35/rk3568_bl31_v1.45.elf
# BL31         = $(DESTDIR)$(libdir)/u-boot/rk3568/bl31.bin
MKIMAGE_TYPE = rk3568
INSTALL_PREF = rk3568
DDR_BIN      = ${TPL}
DEFCONFIG    = generic-rk3568_defconfig
endif

ifneq (,$(findstring rk3576,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk35/rk3576_ddr_lp4_2112MHz_lp5_2736MHz_v1.09.bin
# use rkbin bl31 as with mainline 2.13 bl31 there is issue with constantly low cpu clocks
# use rkbin bl31 v1.08 as newer vers. have issue with constantly low cpu clocks
# BL31         = ../rkbin/bin/rk35/rk3576_bl31_v1.20.elf
# BL31         = $(DESTDIR)$(libdir)/u-boot/rk3576/bl31.bin
BL31         = ../rk3576_bl31_v1.08.elf
MKIMAGE_TYPE = rk3576
INSTALL_PREF = rk3576
DDR_BIN      = ${TPL}
DEFCONFIG    = generic-rk3576_defconfig
endif

ifneq (,$(findstring rk3588.,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.19.bin
# BL31         = ../rkbin/bin/rk35/rk3588_bl31_v1.51.elf
BL31         = $(DESTDIR)$(libdir)/u-boot/rk3588/bl31.bin
MKIMAGE_TYPE = rk3588
INSTALL_PREF = rk3588
DDR_BIN      = ${TPL}
DEFCONFIG    = generic-rk3588_defconfig
endif

ifneq (,$(findstring rk3588s.,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.19.bin
# BL31         = ../rkbin/bin/rk35/rk3588_bl31_v1.51.elf
BL31         = $(DESTDIR)$(libdir)/u-boot/rk3588s/bl31.bin
MKIMAGE_TYPE = rk3588
INSTALL_PREF = rk3588s
DDR_BIN      = ${TPL}
DEFCONFIG    = generic-rk3588_defconfig
endif

ifeq ($(mm_U-BOOT_BOARD_DEFCONFIG),)
mm_U-BOOT_BOARD_DEFCONFIG = $(DEFCONFIG)
endif
CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_DEFCONFIG)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \

$(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/bl31.bin:
	@# build mainline atf only for supported socs. For other socs we are using rkbin bl31 blobs
ifeq (,$(findstring rk3528,$(mm_U-BOOT_BOARD_TYPE)))
	@echo "Building ATF as dependency ..."
	@$(MAKE) clean install -C ../arm-trusted-firmware
	@# clean current uboot build as it depends on just built ATF
	@$(MAKE) clean
endif
	@$(MAKECOOKIE)

post-extract:
	@mkdir -p $(WORKDIR)/rkbin
	@cp -rf $(WORKDIR)/rkbin-$(RKBINVERSION)/* $(WORKDIR)/rkbin/
	@$(MAKECOOKIE)

pre-everything: $(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/bl31.bin

configure-custom:
	@echo " "
	@echo "------------------------------------------------------------------"
	@echo "Configuring $(MKIMAGE_TYPE) u-boot with args:$(CONFIGURE_ARGS) ..."
	@echo " "
	@echo "  -mm_U-BOOT_BOARD_TYPE      : $(mm_U-BOOT_BOARD_TYPE)"
	@echo "  -mm_U-BOOT_BOARD_DEFCONFIG : $(mm_U-BOOT_BOARD_DEFCONFIG)"
	@echo "  -TPL                       : $(TPL)"
	@echo "  -BL31                      : $(BL31)"
	@echo "  -DDR.bin                   : $(DDR_BIN)"
	@echo "  -building defconfig        : $(mm_U-BOOT_BOARD_DEFCONFIG)"
	@echo "  -MKIMAGE type              : $(MKIMAGE_TYPE)"
	@echo "  -Install dir               : [$(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/$(mm_U-BOOT_BOARD_TYPE)]"
	@echo "-----------------------------------------------------------------"
	@echo " "
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-uboot:
	@echo "Building u-boot $(MKIMAGE_TYPE) with $(CONFIGURE_ARGS) ..."
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) $(PARALLELMFLAGS) ROCKCHIP_TPL=$(TPL) BL31=$(BL31) all
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@$(MAKECOOKIE)

build-idbloader:
	@echo "Creating idbloader.img ..."
ifneq (,$(findstring rk3328,$(mm_U-BOOT_BOARD_TYPE)))
	@echo "Override rk3328 RKBIN v.conservative frequency ..."
	@cd $(WORKSRC); sed -s 's/\x4d\x1\x4d\x1\x4d\x1\x4d\x1\x4d\x1\x4d\x1/\x20\x3\x20\x3\x20\x3\x20\x3\x20\x3\x20\x3/g' -i "$(DDR_BIN)"
	@cd $(WORKSRC); sed -s 's/\x90\x1\x90\x1\x90\x1\x90\x1\x90\x1\x90\x1/\x20\x3\x20\x3\x20\x3\x20\x3\x20\x3\x20\x3/g' -i "$(DDR_BIN)"
endif
	@cd ./$(WORKSRC) && ./tools/mkimage -n $(MKIMAGE_TYPE) -T rksd -d $(DDR_BIN):spl/u-boot-spl.bin idbloader.img
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/$(mm_U-BOOT_BOARD_TYPE)"
	@echo "Instaling idbloader.img ..."
	@cp -f  $(WORKSRC)/idbloader.img \
		$(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/$(mm_U-BOOT_BOARD_TYPE)/idbloader.img
	@echo "Instaling u-boot.itb ..."
	@cp -f  $(WORKSRC)/u-boot.itb \
		$(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/$(mm_U-BOOT_BOARD_TYPE)/u-boot.itb
	@$(MAKECOOKIE)

clean-all: clean
	rm -f $(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/$(mm_U-BOOT_BOARD_TYPE)/idbloader.img
	rm -f $(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/$(mm_U-BOOT_BOARD_TYPE)/u-boot.itb
	rm -f $(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/bl31.bin
