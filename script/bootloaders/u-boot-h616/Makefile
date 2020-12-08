
GARNAME      = u-boot-h616-20201208
GARVERSION   = 27007e5d4a6c4ac1bbd1bc81fb4c19bc45191f35
CATEGORIES   = kernel
MASTER_SITES = https://gitlab.denx.de/u-boot/custodians/u-boot-sunxi/-/archive/$(GARVERSION)/
DISTFILES    = u-boot-sunxi-$(GARVERSION).tar.bz2
WORKSRC      = $(WORKDIR)/u-boot-sunxi-$(GARVERSION)

PATCHFILES   = 0001-sunxi-H6-Add-basic-Eachlink-H6-Mini-support.patch
PATCHFILES  += 0002-sunxi-H6-Add-basic-Tanix-TX6-support.patch
PATCHFILES  += 0003-sunxi-H6-Add-basic-Tanix-TX6-mini-support.patch
# PATCHFILES  += 0004-sunxi-H6-enable-dram-debug.patch
PATCHFILES  += 0006-sunxi-H6-improve-DDR-init.patch
# initial support for H616
# https://github.com/apritzel/u-boot/commits/h616-WIP
PATCHFILES  += 0101-sunxi-Add-arm64-FEL-support.patch
PATCHFILES  += 0102-sunxi-Add-H616-FEL-support.patch
PATCHFILES  += 0103-h616-wip.patch
PATCHFILES  += 0104-wip-opi-zero2.patch
PATCHFILES  += 0105-net-sun8i-emac-Determine-pinmux-based-on-SoC-not-EMA.patch
PATCHFILES  += 0106-embed-H616-RGMII-pins-in-Opi-.dts.patch
PATCHFILES  += 0107-HACKS-to-allow-48KB-SPL.patch
PATCHFILES  += 0108-avoid-warning-about-unused-mctl_phy_bit_delay_compen.patch
PATCHFILES  += 0109-only-do-poweroff-without-PSCI.patch
PATCHFILES  += 0110-bring-back-SPL_FIT-support.patch
PATCHFILES  += 0111-orangepi_zero2_defconfig-720MHz-DRAM-SPL_SPI.patch
PATCHFILES  += 0112-support-loading-with-SPL-32KB.patch
PATCHFILES  += 0113-H616-use-TF-A-address-in-DRAM.patch

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

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \
	BL31=$(DESTDIR)$(libdir)/u-boot/h616/bl31.bin \

configure-custom:
	@echo "Configuring u-boot for SunXi H616..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot for SunXi H616..."
	@$(BUILD_ARGS) $(warning HOSTCC is:$(HOSTCC)) $(MAKE) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/h616/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/u-boot-sunxi-with-spl.bin \
	       $(DESTDIR)$(libdir)/u-boot/h616/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin
	@$(MAKECOOKIE)

clean-all:
