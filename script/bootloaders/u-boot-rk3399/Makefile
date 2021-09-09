
GARNAME      = u-boot-rk3399-20210812
GARVERSION   = 60df49d22d2586f50bba11eaa59a55f2baa4671f
CATEGORIES   = kernel
MASTER_SITES = https://gitlab.denx.de/u-boot/custodians/u-boot-rockchip/-/archive/$(GARVERSION)/
DISTFILES    = u-boot-rockchip-$(GARVERSION).tar.bz2
PATCHFILES   = 0001-add-orangepi-4.patch
WORKSRC      = $(WORKDIR)/u-boot-rockchip-$(GARVERSION)

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

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \
	BL31=$(DESTDIR)$(libdir)/u-boot/rk3399/bl31.bin \

configure-custom:
	@echo "Configuring u-boot with $(mm_U-BOOT_BOARD_TYPE) ..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot for $(mm_U-BOOT_BOARD_TYPE) ..."
	@$(BUILD_ARGS) $(warning HOSTCC is:$(HOSTCC)) $(MAKE) -C $(WORKSRC) $(PARALLELMFLAGS)
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
