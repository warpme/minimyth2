
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

ifeq (0,1)
# Amlogic custodians 11.05.2021
GARNAME      = u-boot-h616-20210511
GARVERSION   = 647b392bf20614006917d5fcd3390347a668eee5
CATEGORIES   = kernel
MASTER_SITES = https://gitlab.denx.de/u-boot/custodians/u-boot-sunxi/-/archive/$(GARVERSION)/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = add-emac2-to-h6-h616.patch
PATCHFILES  += add-h616-tanix-tx6s-defconfig.patch
PATCHFILES  += add-h616-x96-mate-defconfig.patch
PATCHFILES  += add-h616-t95-defconfig.patch
WORKSRC      = $(WORKDIR)/u-boot-sunxi-$(GARVERSION)
endif

ifeq (1,1)
# Radxa u-boot https://github.com/radxa/u-boot/commits/aml-atv-fastboot-loader
GARNAME      = u-boot-g12a-20210702
# 02.07.2021
GARVERSION   = 81de0f1f95b65a9446b8b180162b98025c910d3a
CATEGORIES   = kernel
MASTER_SITES = https://github.com/radxa/u-boot/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
endif

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS = devel/swig utils/dtc

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk

#mm_U-BOOT_BOARD_TYPE = radxa-zero_defconfig

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \

configure-custom:
	@echo "Configuring u-boot for Amlogic G12A with $(CONFIGURE_ARGS)..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot for Amlogic G12A  with $(CONFIGURE_ARGS)..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/g12a/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/u-boot.bin \
	       $(DESTDIR)$(libdir)/u-boot/g12a/$(mm_U-BOOT_BOARD_TYPE)/bl33.bin
	@$(MAKECOOKIE)

clean-all: clean

