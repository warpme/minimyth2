
GARNAME      = u-boot-rk3399-20200220
GARVERSION   = f9561d8e3671415c7780df4b5e70f0f1e2d2bf57
CATEGORIES   = kernel
MASTER_SITES = https://gitlab.denx.de/u-boot/custodians/u-boot-rockchip/-/archive/$(GARVERSION)/
DISTFILES    = u-boot-rockchip-$(GARVERSION).tar.bz2
WORKSRC      = $(WORKDIR)/u-boot-rockchip-$(GARVERSION)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c bootloaders/arm-trusted-firmware
BUILDDEPS = devel/swig utils/dtc

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \
	BL31=$(DESTDIR)/boot/rk3399loaderfiles/bl31.bin \

configure-custom:
	@echo "Configuring u-boot for rk3399..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot for rk3399..."
	@$(BUILD_ARGS) $(warning HOSTCC is:$(HOSTCC)) $(MAKE) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)/boot/rk3399loaderfiles"
	@cp -f $(WORKSRC)/u-boot-rk3399-with-spl.bin $(DESTDIR)/boot/rk3399loaderfiles/u-boot-rk3399-with-spl.bin
	@$(MAKECOOKIE)

clean-all:
	$(MAKE) clean -C ../arm-trusted-firmware
	@rm -rf $(DESTDIR)/boot/rk3399loaderfiles*
