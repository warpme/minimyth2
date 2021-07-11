
ifeq (1,1)
# Mainline U-boot
GARNAME      = u-boot-g12a-20200705
# v2021.07
GARVERSION   = 840658b093976390e9537724f802281c9c8439f5
CATEGORIES   = kernel
MASTER_SITES = https://github.com/u-boot/u-boot/archive/
PATCHFILES   = 0001-add-Radxa-Zero-support.patch
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
endif

ifeq (0,1)
# Amlogic custodians 25.05.2021
GARNAME      = u-boot-g12a-20210525
GARVERSION   = f4b2786b80583c8b48245ac5f90fda47328f3a6c
CATEGORIES   = kernel
MASTER_SITES = https://source.denx.de/u-boot/custodians/u-boot-amlogic/-/archive/$(GARVERSION)/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = 0001-add-Radxa-Zero-support.patch
WORKSRC      = $(WORKDIR)/u-boot-amlogic-$(GARVERSION)
endif

ifeq (0,1)
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

