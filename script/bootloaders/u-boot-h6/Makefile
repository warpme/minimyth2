
GARNAME      = u-boot-h6-20210108
GARVERSION   = 344e0d6665e53b116a5f422a9f6fae83af786689
CATEGORIES   = kernel
MASTER_SITES = https://gitlab.denx.de/u-boot/custodians/u-boot-sunxi/-/archive/$(GARVERSION)/
DISTFILES    = u-boot-sunxi-$(GARVERSION).tar.bz2
WORKSRC      = $(WORKDIR)/u-boot-sunxi-$(GARVERSION)

# Patches from https://github.com/jernejsk/LibreELEC.tv/commits/aw-u-boot
PATCHFILES   += 0001-sunxi-dram-h6-Improve-DDR3-config-detection.patch
PATCHFILES   += 0002-ARM-dts-sunxi-h6-Update-DT-files.patch
PATCHFILES   += 0003-sunxi-Add-support-for-Tanix-TX6.patch
PATCHFILES   += 0004-sunxi-board-extract-creating-a-unique-sid-into-a-hel.patch
PATCHFILES   += 0005-arm-sunxi-add-a-config-option-to-fixup-a-Bluetooth-a.patch
PATCHFILES   += 0007-arm64-dts-sun50i-Add-support-for-Orange-Pi-3.patch
PATCHFILES   += 0008-orange-pi-3-ethernet.patch
PATCHFILES   += 0009-tanix-tx6-ethernet-hack.patch
PATCHFILES   += 0010-unreliable-dram.patch
PATCHFILES   += 0011-sunxi-H6-Add-basic-Eachlink-H6-Mini-support.patch

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c bootloaders/arm-trusted-firmware-h6
BUILDDEPS = devel/swig utils/dtc

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \
	BL31=$(DESTDIR)$(libdir)/u-boot/h6/bl31.bin \

configure-custom:
	@if [ -e $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/scp.bin ] ; then \
		echo "Copying [$(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/scp.bin] to u-boot tree ..." ; \
		cp -pd $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/scp.bin \
		$(WORKSRC)/scp.bin ; \
	 fi
	@echo "Configuring u-boot for SunXi H6..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot for SunXi H6..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/u-boot-sunxi-with-spl.bin \
	       $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
