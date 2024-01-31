
ifeq (1,0)
# Rockchip custodians u-boot
GARNAME      = u-boot-rk3399-20211012
GARVERSION   = 60df49d22d2586f50bba11eaa59a55f2baa4671f
CATEGORIES   = kernel
MASTER_SITES = https://gitlab.denx.de/u-boot/custodians/u-boot-rockchip/-/archive/$(GARVERSION)/
DISTFILES    = u-boot-rockchip-$(GARVERSION).tar.bz2
PATCHFILES   = 0001-add-orangepi-4.patch
WORKSRC      = $(WORKDIR)/u-boot-rockchip-$(GARVERSION)
endif

ifeq (1,1)
# Mainline u-boot
GARNAME      = u-boot-rk3399-2024.01
GARVERSION   = 866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e
CATEGORIES   = kernel
MASTER_SITES = https://github.com/u-boot/u-boot/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
endif

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c bootloaders/arm-trusted-firmware-rk3399
BUILDDEPS = devel/swig utils/dtc

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk
include ../../python3/python/package-api.mk

# mm_U-BOOT_BOARD_TYPE = rock-4se-rk3399_defconfig
# mm_U-BOOT_BOARD_TYPE = rock-pi-4-rk3399_defconfig
# mm_U-BOOT_BOARD_TYPE = orangepi-rk3399_defconfig

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \
	BL31=$(DESTDIR)$(libdir)/u-boot/rk3399/bl31.bin \

configure-custom:
	@echo "Configuring u-boot rk3399 with $(CONFIGURE_ARGS) ..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot rk3399 with $(CONFIGURE_ARGS) ..."
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/rk3399/$(mm_U-BOOT_BOARD_TYPE)"
	@echo "Instaling idbloader.img ..."
	@cp -f  $(WORKSRC)/idbloader.img \
		$(DESTDIR)$(libdir)/u-boot/rk3399/$(mm_U-BOOT_BOARD_TYPE)/idbloader.img
	@echo "Instaling u-boot.itb ..."
	@cp -f  $(WORKSRC)/u-boot.itb \
		$(DESTDIR)$(libdir)/u-boot/rk3399/$(mm_U-BOOT_BOARD_TYPE)/u-boot.itb
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
