
GARNAME      = u-boot-h616-v2024.04-rc3
GARVERSION   = 2024.04-rc3
CATEGORIES   = kernel
MASTER_SITES = https://github.com/u-boot/u-boot/archive/refs/tags/
DISTFILES    = v$(GARVERSION).tar.gz

PATCHFILES   = 100-sunsi-add-h616-internal-eth-phy-support.patch
PATCHFILES  += 101-unreliable-dram.patch
PATCHFILES  += 102-sunxi-H616-GPU-enable-hack.patch
PATCHFILES  += 103-sunxi-dram-add-lpddr3-6gbit-support.patch
PATCHFILES  += 104-sunxi-add-led-on-at-poweron.patch
PATCHFILES  += 105-mtd-spi-nor-add-zbit-zb25vq128.patch
PATCHFILES  += 106-Add-int-phy-eth-H313-h616-with-AC300.patch
PATCHFILES  += 107-sunxi_mmc-dec-f_max-to-12MHz-to-get-emmc-reliable.patch
# boards aditions.
PATCHFILES  += 150-add-x96-q-lpddr3-defconfig.patch
PATCHFILES  += 151-add-x96-q-ddr3-defconfig.patch
PATCHFILES  += 152-add-tanix-tx6s-defconfig.patch
PATCHFILES  += 153-add-tanix_tx6s_axp313_defconfig.patch
PATCHFILES  += 154-opi-zero2-add-mising-dram-para.patch
PATCHFILES  += 155-opi-zero3-enable-more-usb-pwrled-add-aliases.patch
PATCHFILES  += 157-add-tanix_tx6s_kingston_lpddr3_defconfig.patch
PATCHFILES  += 158-add-pendoo-x12pro-defconfig.patch
PATCHFILES  += 159-add-x96-q-lpddr3-v1.3-defconfig.patch
PATCHFILES  += 160-add-vontar-h618-defconfig.patch
PATCHFILES  += 161-dts-zero2w-improvements.patch

WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
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
# mm_U-BOOT_BOARD_TYPE = tanix_tx6s_axp313_defconfig
# mm_U-BOOT_BOARD_TYPE = tanix_tx6s_defconfig
# mm_U-BOOT_BOARD_TYPE = x96_q_lpddr3_defconfig
# mm_U-BOOT_BOARD_TYPE = x96_q_lpddr3_v1.3_defconfig
# mm_U-BOOT_BOARD_TYPE = x96_q_ddr3_defconfig
# mm_U-BOOT_BOARD_TYPE = orangepi_zero2_defconfig
# mm_U-BOOT_BOARD_TYPE = orangepi_zero3_defconfig
# mm_U-BOOT_BOARD_TYPE = orangepi_zero2w_defconfig
# mm_U-BOOT_BOARD_TYPE = tanix_tx6s_kingston_lpddr3_defconfig
# mm_U-BOOT_BOARD_TYPE = pendoo-x12_defconfig
# mm_U-BOOT_BOARD_TYPE = vontar_h618_defconfig

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
