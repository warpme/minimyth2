
ifeq (0,1)
# Mainline U-boot
GARNAME      = u-boot-h616-20210111
# v2021.01
GARVERSION   = c4fddedc48f336eabc4ce3f74940e6aa372de18c
CATEGORIES   = kernel
MASTER_SITES = https://github.com/u-boot/u-boot/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
endif

ifeq (1,1)
# Sunxi custodians 11.05.2021
GARNAME      = u-boot-h616-20210511
GARVERSION   = 647b392bf20614006917d5fcd3390347a668eee5
CATEGORIES   = kernel
MASTER_SITES = https://gitlab.denx.de/u-boot/custodians/u-boot-sunxi/-/archive/$(GARVERSION)/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = add-emac2-to-h6-h616.patch
PATCHFILES  += add-h616-tanix-tx6s-defconfig.patch
PATCHFILES  += add-h616-x96-mate-defconfig.patch
PATCHFILES  += add-h616-t95-defconfig.patch
PATCHFILES  += sunxi-H616-GPU-enable-hack.patch
WORKSRC      = $(WORKDIR)/u-boot-sunxi-$(GARVERSION)
endif

ifeq (0,1)
# Jernejsk GIT https://github.com/jernejsk/u-boot/commits/t95
GARNAME      = u-boot-h616-20201201
# 01.12.2020
GARVERSION   = 53d4a7302318f1d188abbbad59dccaf453087d2c
CATEGORIES   = kernel
MASTER_SITES = https://github.com/jernejsk/u-boot/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
endif

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c bootloaders/arm-trusted-firmware-h616
BUILDDEPS = devel/swig utils/dtc

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk
include ../../python3/python/package-api.mk

# For forcing given board (usually for testing)
# mm_U-BOOT_BOARD_TYPE = tanix_tx6s_defconfig
# mm_U-BOOT_BOARD_TYPE = t95_defconfig

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \
	BL31=$(DESTDIR)$(libdir)/u-boot/h616/bl31.bin \

configure-custom:
	@echo "Configuring u-boot for SunXi H616 with $(CONFIGURE_ARGS) ..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot for SunXi H616 with $(CONFIGURE_ARGS) ..."
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/h616/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/u-boot-sunxi-with-spl.bin \
	       $(DESTDIR)$(libdir)/u-boot/h616/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
