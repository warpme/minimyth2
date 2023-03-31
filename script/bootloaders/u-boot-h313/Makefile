
ifeq (0,1)
# https://github.com/jernejsk/u-boot/commits/h616-dram-imp 12.12.2022
GARNAME      = u-boot-h313-20221212
GARVERSION   = 152d1a37b4856c23976cfd0758cab654b84336cd
CATEGORIES   = kernel
MASTER_SITES = https://github.com/jernejsk/u-boot/archive/
DISTFILES    = $(GARVERSION).zip
PATCHFILES  += 02-fix-x96-q-booting.patch
PATCHFILES  += 03-fix-x96-q-memory-sizing.patch
PATCHFILES  += 04-sunxi-H616-GPU-enable-hack.patch
PATCHFILES  += 05-drivers-power-axp305-add-dcdc3-offset.patch
PATCHFILES  += 50-add-h616-tanix-tx6s-defconfig.patch
PATCHFILES  += 51-add-h616-t95-defconfig.patch
PATCHFILES  += 52-add-h313-x96-q-v1-defconfig.patch
#PATCHFILES  += 99-enable-debug.patch
#PATCHFILES  += 99-dump-dram-controller-regs.patch
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
endif


ifeq (0,1)
# Sunxi custodians 05.03.2023
GARNAME      = u-boot-h313-20230305
GARVERSION   = 8e2c0ee3bafbc283b58b66d9007847a5a3ed07be
CATEGORIES   = kernel
MASTER_SITES = https://gitlab.denx.de/u-boot/custodians/u-boot-sunxi/-/archive/$(GARVERSION)/
DISTFILES    = $(GARVERSION).zip
PATCHFILES  += 02-fix-x96-q-booting.patch
PATCHFILES  += 04-sunxi-H616-GPU-enable-hack.patch
PATCHFILES  += 50-add-h616-tanix-tx6s-defconfig.patch
PATCHFILES  += 51-add-h616-t95-defconfig.patch
PATCHFILES  += 52-add-h313-x96-q-v1-defconfig.patch
#PATCHFILES  += 99-enable-debug.patch
#PATCHFILES  += 99-dump-dram-controller-regs.patch
WORKSRC      = $(WORKDIR)/u-boot-sunxi-$(GARVERSION)
endif

ifeq (1,1)
# Sunxi custodians 11.05.2021
GARNAME      = u-boot-h616-20210511
GARVERSION   = 647b392bf20614006917d5fcd3390347a668eee5
CATEGORIES   = kernel
MASTER_SITES = https://gitlab.denx.de/u-boot/custodians/u-boot-sunxi/-/archive/$(GARVERSION)/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = 01-hack-add-h313-int.emac.phy-support.patch
PATCHFILES  += 02-fix-x96-q-booting.patch
PATCHFILES  += 03-fix-x96-q-memory-sizing.patch
PATCHFILES  += 04-sunxi-H616-GPU-enable-hack.patch
# PATCHFILES  += 05-drivers-power-axp305-add-dcdc3-offset.patch
PATCHFILES  += 50-add-h616-tanix-tx6s-defconfig.patch
PATCHFILES  += 51-add-h313-x96-q-v1-defconfig.patch
# PATCHFILES  += 99-enable-debug.patch
# PATCHFILES  += 99-dump-dram-controller-regs.patch
WORKSRC      = $(WORKDIR)/u-boot-sunxi-$(GARVERSION)
endif

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c bootloaders/arm-trusted-firmware-h313
BUILDDEPS = devel/swig utils/dtc

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk
include ../../python3/python/package-api.mk

# For forcing given board (usually for testing)
# mm_U-BOOT_BOARD_TYPE = h616_lpddr3_tvbox_defconfig
# mm_U-BOOT_BOARD_TYPE = tanix_tx6s_defconfig
# mm_U-BOOT_BOARD_TYPE = x96q_v1_defconfig

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)


CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \
	BL31=$(DESTDIR)$(libdir)/u-boot/h313/bl31.bin \

configure-custom:
	@echo "Configuring u-boot for SunXi H313 with $(CONFIGURE_ARGS) ..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot for SunXi H313 with $(CONFIGURE_ARGS) ..."
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/h313/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/u-boot-sunxi-with-spl.bin \
	       $(DESTDIR)$(libdir)/u-boot/h313/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
