
GARNAME      = u-boot-rk3576
# git@ 11.02.2025 https://github.com/Kwiboo/u-boot-rockchip/commits/rk3576-2025.04-wip/
GARVERSION   = d9abdc3fc104a8852e819f97356f088a163cf0d6
# git@ 24.01.2025 https://github.com/rockchip-linux/rkbin/commits/master/
RKBINVERSION = f43a462e7a1429a9d407ae52b4745033034a6cf9
CATEGORIES   = kernel
MASTER_SITES = \
               https://github.com/Kwiboo/u-boot-rockchip/archive/ \
               https://github.com/rockchip-linux/rkbin/archive/
DISTFILES    = $(GARVERSION).zip $(RKBINVERSION).zip 
PATCHFILES  += 01-drivers-fastboot-Kconfig-rk35xx-add-def_fastbuf_addr.patch \
               02-rockchip-rk3328-set-vop-qos-to-high-priority.patch \
               50-my-boards-rk3566-defconfigs-enable-overlays.patch \
               51-add-rk3328-beelink-a1-defconfig.patch \
               52-add-rk3566-x96-x6-defconfig.patch \
               53-add-rk3588-rock-5t-defconfig.patch \
               54-rk3399-rock-pi-4.dtsi-remove-hdmi-and-audio.patch \
               55-rk3588-rock5-itx-disable-spi-in-defconfig.patch \

#               03-add-rk3528-support.patch \

WORKSRC      = $(WORKDIR)/u-boot-rockchip-$(GARVERSION)

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

# mm_U-BOOT_BOARD_TYPE = orangepi-3b-rk3566_defconfig
# mm_U-BOOT_BOARD_TYPE = orangepi-5-plus-rk3588_defconfig
# mm_U-BOOT_BOARD_TYPE = orangepi-5-rk3588s_defconfig
# mm_U-BOOT_BOARD_TYPE = orangepi-rk3399_defconfig
# mm_U-BOOT_BOARD_TYPE = rock-3a-rk3568_defconfig
# mm_U-BOOT_BOARD_TYPE = rock-3b-rk3568_defconfig
# mm_U-BOOT_BOARD_TYPE = rock-3c-rk3566_defconfig
# mm_U-BOOT_BOARD_TYPE = rock-4se-rk3399_defconfig
# mm_U-BOOT_BOARD_TYPE = rock-pi-4-rk3399_defconfig
# mm_U-BOOT_BOARD_TYPE = rock-pi-4c-rk3399_defconfig
# mm_U-BOOT_BOARD_TYPE = rock5a-rk3588s_defconfig
# mm_U-BOOT_BOARD_TYPE = rock5b-rk3588_defconfig
# mm_U-BOOT_BOARD_TYPE = rock-5-itx-rk3588_defconfig
# mm_U-BOOT_BOARD_TYPE = rock5t-rk3588_defconfig
# mm_U-BOOT_BOARD_TYPE = beelink-a1-rk3328_defconfig
# mm_U-BOOT_BOARD_TYPE = quartz64-b-rk3566_defconfig
# mm_U-BOOT_BOARD_TYPE = x96-x6-rk3566_defconfig
# mm_U-BOOT_BOARD_TYPE = radxa-zero-3-rk3566_defconfig
# mm_U-BOOT_BOARD_TYPE = generic-rk3528_defconfig
# mm_U-BOOT_BOARD_TYPE = generic-rk3576_defconfig

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

ifneq (,$(findstring rk3328,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk33/rk3328_ddr_333MHz_v1.21.bin
BL31         = ../rkbin/bin/rk33/rk322xh_bl31_v1.49.elf
MKIMAGE_TYPE = rk3328
INSTALL_PREF = rk3328
DDR_BIN      = ${TPL}
endif
ifneq (,$(findstring rk3399,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk33/rk3399_ddr_800MHz_v1.30.bin
BL31         = ../rkbin/bin/rk33/rk3399_bl31_v1.36.elf
MKIMAGE_TYPE = rk3399
INSTALL_PREF = rk3399
DDR_BIN      = ${TPL}
endif
ifneq (,$(findstring rk3528,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk35/rk3528_ddr_1056MHz_4BIT_PCB_v1.10.bin
BL31         = ../rkbin/bin/rk35/rk3528_bl31_v1.18.elf
MKIMAGE_TYPE = rk3528
INSTALL_PREF = rk3528
DDR_BIN      = ${TPL}
endif
ifneq (,$(findstring rk3566,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk35/rk3566_ddr_1056MHz_v1.23.bin
BL31         = ../rkbin/bin/rk35/rk3568_bl31_v1.44.elf
MKIMAGE_TYPE = rk3568
INSTALL_PREF = rk3566
DDR_BIN      = ${TPL}
endif
ifneq (,$(findstring rk3568,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk35/rk3568_ddr_1056MHz_v1.23.bin
BL31         = ../rkbin/bin/rk35/rk3568_bl31_v1.44.elf
MKIMAGE_TYPE = rk3568
INSTALL_PREF = rk3568
DDR_BIN      = ${TPL}
endif
ifneq (,$(findstring rk3576,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk35/rk3576_ddr_lp4_2112MHz_lp5_2736MHz_v1.09.bin
BL31         = ../rkbin/bin/rk35/rk3576_bl31_v1.15.elf
MKIMAGE_TYPE = rk3576
INSTALL_PREF = rk3576
DDR_BIN      = ${TPL}
endif
ifneq (,$(findstring rk3588,$(mm_U-BOOT_BOARD_TYPE)))
TPL          = ../rkbin/bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.18.bin
BL31         = ../rkbin/bin/rk35/rk3588_bl31_v1.48.elf
MKIMAGE_TYPE = rk3588
ifneq (,$(findstring rk3588s,$(mm_U-BOOT_BOARD_TYPE)))
INSTALL_PREF = rk3588s
else
INSTALL_PREF = rk3588
endif
DDR_BIN      = ${TPL}
endif

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \

pre-configure:
	@mkdir -p $(WORKDIR)/rkbin
	@mv -f $(WORKDIR)/rkbin-$(RKBINVERSION)/* $(WORKDIR)/rkbin/
	@$(MAKECOOKIE)

configure-custom:
	@echo " "
	@echo "---------------------------------------------------------------"
	@echo "Configuring $(MKIMAGE_TYPE) u-boot with $(CONFIGURE_ARGS) ..."
	@echo " "
	@echo "  -TPL          : $(TPL)"
	@echo "  -BL31         : $(BL31)"
	@echo "  -DDR.bin      : $(DDR_BIN)"
	@echo "  -MKIMAGE type : $(MKIMAGE_TYPE)"
	@echo "  -Install dir  : [$(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/$(mm_U-BOOT_BOARD_TYPE)]"
	@echo "---------------------------------------------------------------"
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

clean-all:
	@$(MAKE) clean
