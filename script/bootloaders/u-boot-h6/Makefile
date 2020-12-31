
GARNAME      = u-boot-h6-20201231
GARVERSION   = 27007e5d4a6c4ac1bbd1bc81fb4c19bc45191f35
CATEGORIES   = kernel
MASTER_SITES = https://gitlab.denx.de/u-boot/custodians/u-boot-sunxi/-/archive/$(GARVERSION)/
DISTFILES    = u-boot-sunxi-$(GARVERSION).tar.bz2
WORKSRC      = $(WORKDIR)/u-boot-sunxi-$(GARVERSION)

PATCHFILES   = 0001-sunxi-H6-Add-basic-Eachlink-H6-Mini-support.patch
PATCHFILES  += 0002-sunxi-H6-Add-basic-Tanix-TX6-support.patch
PATCHFILES  += 0003-sunxi-H6-Add-basic-Tanix-TX6-mini-support.patch
# PATCHFILES  += 0004-sunxi-H6-enable-dram-debug.patch
# PATCHFILES  += 0005-allowall-usb-start.patch
PATCHFILES  += 0006-sunxi-H6-improve-DDR-init.patch

LICENSE = GPL2


DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c bootloaders/arm-trusted-firmware-h6 bootloaders/crust
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
	@cp -f $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/scp.bin $(WORKSRC)/scp.bin
	@echo "Configuring u-boot for SunXi H6..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot for SunXi H6..."
	@$(BUILD_ARGS) $(warning HOSTCC is:$(HOSTCC)) $(MAKE) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/u-boot-sunxi-with-spl.bin \
	       $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin
	@$(MAKECOOKIE)

clean-all:
