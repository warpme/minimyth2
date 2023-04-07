
# Sunxi custodians 11.05.2021
GARNAME      = u-boot-h616-20210511
GARVERSION   = 647b392bf20614006917d5fcd3390347a668eee5
CATEGORIES   = kernel
MASTER_SITES = https://gitlab.denx.de/u-boot/custodians/u-boot-sunxi/-/archive/$(GARVERSION)/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = 0000-sync-h616-dram-to-8f1704087.patch
PATCHFILES  += 0001-sunxi-Fix-write-to-H616-DRAM-CR-register.patch
PATCHFILES  += 0002-sunxi-cosmetic-Fix-H616-DRAM-driver-code-style.patch
PATCHFILES  += 0003-sunxi-parameterize-H616-DRAM-ODT-values.patch
PATCHFILES  += 0004-sunxi-Convert-H616-DRAM-options-to-single-setting.patch
PATCHFILES  += 0005-sunxi-Always-configure-ODT-on-H616-DRAM.patch
PATCHFILES  += 0006-sunxi-Make-bit-delay-function-in-H616-DRAM-code-void.patch
PATCHFILES  += 0007-sunxi-Parameterize-bit-delay-code-in-H616-DRAM-drive.patch
PATCHFILES  += 0008-sunxi-Parameterize-H616-DRAM-code-some-more.patch
PATCHFILES  += 0009-sunxi-add-H616-LPDDR3-DRAM-support.patch
PATCHFILES  += 0010-sunxi-add-support-for-AXP313-PMIC.patch
PATCHFILES  += 0011-sunxi-dram-add-lpddr3-6gbit-support.patch
PATCHFILES  += 0012-sunxi-dram-add-H616-LPDDR4-DRAM-support.patch
PATCHFILES  += 01-hack-add-h313-int.emac.phy-support.patch
PATCHFILES  += 02-sunxi-arm64-boot0.h-add-support-muliple-h313-variants.patch
PATCHFILES  += 03-fix-h616-4gb-ram-detection.patch
PATCHFILES  += 04-sunxi-H616-GPU-enable-hack.patch
PATCHFILES  += 05-fix-ddr3-memory-sizing.patch
PATCHFILES  += 50-add-x96-q-lpddr3-defconfig.patch
PATCHFILES  += 51-add-x96-q-ddr3-defconfig.patch
PATCHFILES  += 52-add-tanix-tx6s-defconfig.patch
# PATCHFILES  += 99-enable-debug.patch
# PATCHFILES  += 99-dump-dram-controller-regs.patch
WORKSRC      = $(WORKDIR)/u-boot-sunxi-$(GARVERSION)

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
# mm_U-BOOT_BOARD_TYPE = x96_q_lpddr3_defconfig
# mm_U-BOOT_BOARD_TYPE = x96_q_ddr3_defconfig

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \
	BL31=$(DESTDIR)$(libdir)/u-boot/h616/bl31.bin \

configure-custom:
	@echo "Configuring u-boot for SunXi h616 with $(CONFIGURE_ARGS) ..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot for SunXi h616 with $(CONFIGURE_ARGS) ..."
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/h616/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/u-boot-sunxi-with-spl.bin \
	       $(DESTDIR)$(libdir)/u-boot/h616/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
