
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

# mm_U-BOOT_BOARD_TYPE = test-rk3588
# mm_U-BOOT_BOARD_DEFCONFIG = orangepi-5-plus-rk3588_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = rock5b-rk3588_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = rock-5-itx-rk3588_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = rock5t-rk3588_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = nanopc-t6-rk3588_defconfig

# mm_U-BOOT_BOARD_TYPE = test-rk3588s
# mm_U-BOOT_BOARD_DEFCONFIG = orangepi-5-rk3588s_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = rock5a-rk3588s_defconfig


GARNAME      = u-boot-rk

ifeq (0,1)
# collabora rk3588 enablement repo
# git@ 08.07.2025 https://gitlab.collabora.com/hardware-enablement/rockchip-3588/u-boot
GARVERSION   = eaadfde0c6a8975c85d9da9e19a5af70795cd1c6
# git@ 24.01.2025 https://github.com/rockchip-linux/rkbin/commits/master/
RKBINVERSION = f43a462e7a1429a9d407ae52b4745033034a6cf9
MASTER_SITES = \
               https://github.com/rockchip-linux/rkbin/raw/3cb8a4e35c99d06563b3707f7e4df1fad68dc301/bin/rk35/ \
               https://github.com/rockchip-linux/rkbin/archive/ \
               https://gitlab.collabora.com/hardware-enablement/rockchip-3588/u-boot/-/archive/$(GARVERSION)/ \

DISTFILES    = u-boot-$(GARVERSION).tar.bz2 $(RKBINVERSION).zip rk3576_bl31_v1.08.elf
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
PATCHFILES  += 01-drivers-fastboot-Kconfig-rk35xx-add-def_fastbuf_addr.patch \
               02-rockchip-rk3328-set-vop-qos-to-high-priority.patch \
               50-my-boards-rk3566-defconfigs-enable-overlays.patch \
               51-add-rk3328-beelink-a1-defconfig.patch \
               52-add-rk3566-x96-x6-defconfig.patch \
               53-add-rk3588-rock-5t-defconfig.patch \
               54-rk3399-rock-pi-4.dtsi-remove-hdmi-and-audio.patch \
               55-rk3588-rock5-itx-disable-spi-in-defconfig.patch \
               56-rk3566-zero3-sync-dts-to-kernel-to-make-eth-working.patch \

endif

ifeq (1,1)
# mainline u-boot
# git@ 01.08.2025 mainline 2025.10-rc1
GARVERSION   = 182cb30084516c3085d2ca5dde3f105f7625d774
# git@ 24.01.2025 https://github.com/rockchip-linux/rkbin/commits/master/
RKBINVERSION = f43a462e7a1429a9d407ae52b4745033034a6cf9
MASTER_SITES = \
               https://github.com/rockchip-linux/rkbin/raw/3cb8a4e35c99d06563b3707f7e4df1fad68dc301/bin/rk35/ \
               https://github.com/rockchip-linux/rkbin/archive/ \
               https://github.com/u-boot/u-boot/archive/ \

DISTFILES    = $(GARVERSION).zip $(RKBINVERSION).zip rk3576_bl31_v1.08.elf
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
PATCHFILES  += 01-drivers-fastboot-Kconfig-rk35xx-add-def_fastbuf_addr.patch \
               02-rockchip-rk3328-set-vop-qos-to-high-priority.patch \
               03-add-generic-rk3576_defconfig.patch \
               50-my-boards-rk3566-defconfigs-enable-overlays-mainline.patch \
               51-add-rk3328-beelink-a1-defconfig.patch \
               52-add-rk3566-x96-x6-defconfig.patch \
               53-add-rk3588-rock-5t-defconfig.patch \
               54-rk3399-rock-pi-4.dtsi-remove-hdmi-and-audio.patch \
               55-rk3588-rock5-itx-disable-spi-in-defconfig.patch \
               56-rk3566-zero3-sync-dts-to-kernel-to-make-eth-working.patch \

endif

ifeq (0,1)
# kwiboo rk3xx repo
# git@ 12.02.2025 https://github.com/Kwiboo/u-boot-rockchip/commits/rk3xxx-2025.04/
GARVERSION   = 228e9e5b3502ec0e3aac3fae38d9d99f77e9ede1
# git@ 24.01.2025 https://github.com/rockchip-linux/rkbin/commits/master/
RKBINVERSION = f43a462e7a1429a9d407ae52b4745033034a6cf9
MASTER_SITES = \
               https://github.com/Kwiboo/u-boot-rockchip/archive/ \
               https://github.com/rockchip-linux/rkbin/archive/
DISTFILES    = $(GARVERSION).zip $(RKBINVERSION).zip 
WORKSRC      = $(WORKDIR)/u-boot-rockchip-$(GARVERSION)
PATCHFILES  += 01-drivers-fastboot-Kconfig-rk35xx-add-def_fastbuf_addr.patch \
               02-rockchip-rk3328-set-vop-qos-to-high-priority.patch \
               50-my-boards-rk3566-defconfigs-enable-overlays-kwiboo.patch \
               51-add-rk3328-beelink-a1-defconfig.patch \
               52-add-rk3566-x96-x6-defconfig.patch \
               53-add-rk3588-rock-5t-defconfig.patch \
               54-rk3399-rock-pi-4.dtsi-remove-hdmi-and-audio.patch \
               55-rk3588-rock5-itx-disable-spi-in-defconfig.patch \

endif

ifeq (0,1)
# kwiboo rk3576-wip repo
# git@ 11.02.2025 https://github.com/Kwiboo/u-boot-rockchip/commits/rk3576-2025.04-wip/
GARVERSION   = d9abdc3fc104a8852e819f97356f088a163cf0d6
# git@ 24.01.2025 https://github.com/rockchip-linux/rkbin/commits/master/
RKBINVERSION = f43a462e7a1429a9d407ae52b4745033034a6cf9
MASTER_SITES = \
               https://github.com/Kwiboo/u-boot-rockchip/archive/ \
               https://github.com/rockchip-linux/rkbin/archive/
DISTFILES    = $(GARVERSION).zip $(RKBINVERSION).zip 
WORKSRC      = $(WORKDIR)/u-boot-rockchip-$(GARVERSION)
PATCHFILES  += 01-drivers-fastboot-Kconfig-rk35xx-add-def_fastbuf_addr.patch \
               02-rockchip-rk3328-set-vop-qos-to-high-priority.patch \
               50-my-boards-rk3566-defconfigs-enable-overlays-kwiboo.patch \
               51-add-rk3328-beelink-a1-defconfig.patch \
               52-add-rk3566-x96-x6-defconfig.patch \
               53-add-rk3588-rock-5t-defconfig.patch \
               54-rk3399-rock-pi-4.dtsi-remove-hdmi-and-audio.patch \
               55-rk3588-rock5-itx-disable-spi-in-defconfig.patch \

endif

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
BL31         = ../rkbin/bin/rk33/rk322xh_bl31_v1.49.elf
MKIMAGE_TYPE = rk3328
INSTALL_PREF = rk3328
DDR_BIN      = ${TPL}
DEFCONFIG    = generic-rk3328_defconfig
endif

ifneq (,$(findstring rk3399,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk33/rk3399_ddr_800MHz_v1.30.bin
BL31         = ../rkbin/bin/rk33/rk3399_bl31_v1.36.elf
# BL31         = $(DESTDIR)$(libdir)/u-boot/rk3399/bl31.bin
MKIMAGE_TYPE = rk3399
INSTALL_PREF = rk3399
DDR_BIN      = ${TPL}
DEFCONFIG    = generic-rk3399_defconfig
endif

ifneq (,$(findstring rk3528,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk35/rk3528_ddr_1056MHz_4BIT_PCB_v1.10.bin
BL31         = ../rkbin/bin/rk35/rk3528_bl31_v1.18.elf
MKIMAGE_TYPE = rk3528
INSTALL_PREF = rk3528
DDR_BIN      = ${TPL}
DEFCONFIG    = generic-rk3528_defconfig
endif

ifneq (,$(findstring rk3566,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk35/rk3566_ddr_1056MHz_v1.23.bin
BL31         = ../rkbin/bin/rk35/rk3568_bl31_v1.44.elf
MKIMAGE_TYPE = rk3568
INSTALL_PREF = rk3566
DDR_BIN      = ${TPL}
#DEFCONFIG    = generic-rk3566_defconfig
DEFCONFIG    = generic-rk3568_defconfig
endif

ifneq (,$(findstring rk3568,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk35/rk3568_ddr_1056MHz_v1.23.bin
BL31         = ../rkbin/bin/rk35/rk3568_bl31_v1.44.elf
MKIMAGE_TYPE = rk3568
INSTALL_PREF = rk3568
DDR_BIN      = ${TPL}
DEFCONFIG    = generic-rk3568_defconfig
endif

ifneq (,$(findstring rk3576,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk35/rk3576_ddr_lp4_2112MHz_lp5_2736MHz_v1.09.bin
# due bug in bl31 newer than 1.08 we use v1.08
# BL31         = ../rkbin/bin/rk35/rk3576_bl31_v1.15.elf
# BL31         = $(DESTDIR)$(libdir)/u-boot/rk3576/bl31.bin
BL31         = ../rk3576_bl31_v1.08.elf
MKIMAGE_TYPE = rk3576
INSTALL_PREF = rk3576
DDR_BIN      = ${TPL}
DEFCONFIG    = generic-rk3576_defconfig
endif

ifneq (,$(findstring rk3588,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.18.bin
# use mainline BL31 for rk3588
# BL31         = ../rkbin/bin/rk35/rk3588_bl31_v1.48.elf
BL31         = $(DESTDIR)$(libdir)/u-boot/rk3588/bl31.bin
MKIMAGE_TYPE = rk3588
ifneq (,$(findstring rk3588s,$(mm_U-BOOT_BOARD_TYPE)))
INSTALL_PREF = rk3588s
else
INSTALL_PREF = rk3588
endif
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
