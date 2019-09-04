
GARNAME      = u-boot-sunxi-20190812
GARVERSION   = f96238e253661b43168352010a2628957940bd4b
CATEGORIES   = kernel
MASTER_SITES = https://gitlab.denx.de/u-boot/custodians/u-boot-sunxi/-/archive/$(GARVERSION)/
DISTFILES    = u-boot-sunxi-$(GARVERSION).tar.bz2
WORKSRC      = $(WORKDIR)/u-boot-sunxi-$(GARVERSION)

PATCHFILES  = 0001-sunxi-H6-Add-basic-Eachlink-H6-Mini-support.patch
PATCHFILES += 0002-sync-beelink-gs1-dts-to-5.3-kernel.patch

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
	BL31=$(DESTDIR)/boot/h6loaderfiles/bl31.bin \

configure-custom:
	@echo "Configuring u-boot for SunXi H6..."
	@sed -i "s%HOSTCC%CC%g" $(WORKSRC)/scripts/dtc/pylibfdt/Makefile
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot for SunXi H6..."
	@$(BUILD_ARGS) $(warning HOSTCC is:$(HOSTCC)) $(MAKE) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)/boot/h6loaderfiles"
	@cp -f $(WORKSRC)/u-boot-sunxi-with-spl.bin $(DESTDIR)/boot/h6loaderfiles/u-boot-sunxi-with-spl.bin
	@$(MAKECOOKIE)

clean-all:
	$(MAKE) clean -C ../arm-trusted-firmware
	@rm -f $(DESTDIR)/boot/h6loaderfiles/u-boot-sunxi-with-spl.bin
	@rm -f $(DESTDIR)/boot/h6loaderfiles/bl31.bin
