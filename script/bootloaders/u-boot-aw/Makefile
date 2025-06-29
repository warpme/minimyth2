
GARNAME      = u-boot-aw
GARVERSION   = 2025.04
CATEGORIES   = bootloaders
MASTER_SITES = https://github.com/u-boot/u-boot/archive/
DISTFILES    = v$(GARVERSION).tar.gz

# h6 boards related patches
PATCHFILES  += 052-sunxi-H6-Add-basic-Eachlink-H6-Mini-support.patch
PATCHFILES  += 054-sunxi-Add-OrangePi-3-LTS-board.patch
PATCHFILES  += 056-sunxi-dram-Fix-incorrect-ram-size-detection-for-some-H6-boards.patch
# h616 patches
PATCHFILES  += 100-sunsi-add-h616-internal-eth-phy-support.patch
PATCHFILES  += 101-unreliable-dram.patch
PATCHFILES  += 102-sunxi-H616-GPU-enable-hack.patch
PATCHFILES  += 104-sunxi-add-led-on-at-poweron.patch
PATCHFILES  += 105-mtd-spi-nor-add-zbit-zb25vq128.patch
PATCHFILES  += 106-Add-int-phy-eth-H313-h616-with-AC300.patch
PATCHFILES  += 107-drivers-mmc-sunxi_mmc-fix-failing-rw-ops.patch
PATCHFILES  += 109-hack-hack-fix-h618-boot-on-uboot2024.07.patch
PATCHFILES  += 110-sunxi-H616-dram-Lower-max-row-count.patch
PATCHFILES  += 111-sunxi-H616-dram-Improve-size-scan-procedure.patch
PATCHFILES  += 112-sunxi-H616-dram-fix-pendoo-x12-size-detection.patch
# PATCHFILES  += 113-add-dram-sizing-debug-verbosity.patch
# h616 boards aditions.
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
PATCHFILES  += 162-add-tx1-defconfig.patch
PATCHFILES  += 163-add-x96-q-ddr3-v5.1-defconfig.patch
PATCHFILES  += 164-add-tx1-v1.2-defconfig.patch
PATCHFILES  += 165-transpeed-8k618-t-improvements.patch

WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS = devel/swig utils/dtc python3/python-pyelftools lib/libgnutls

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk
include ../../python3/python/package-api.mk

# For forcing given board (usually for testing)
# test bootloader will be in usr/lib/u-boot/test-<soc>

# for h6 - rememnber also to rebuild crust...
# export mm_U-BOOT_BOARD_TYPE = test-h6
# export mm_U-BOOT_BOARD_DEFCONFIG = tanix_tx6_defconfig
# export mm_U-BOOT_BOARD_DEFCONFIG = eachlink_h6_mini_defconfig
# export mm_U-BOOT_BOARD_DEFCONFIG = beelink_gs1_defconfig

# export mm_U-BOOT_BOARD_TYPE = test-h616
# export mm_U-BOOT_BOARD_DEFCONFIG = tanix_tx6s_axp313_defconfig
# export mm_U-BOOT_BOARD_DEFCONFIG = tanix_tx6s_defconfig
# export mm_U-BOOT_BOARD_DEFCONFIG = orangepi_zero2_defconfig
# export mm_U-BOOT_BOARD_DEFCONFIG = tanix_tx6s_kingston_lpddr3_defconfig
# export mm_U-BOOT_BOARD_DEFCONFIG = pendoo-x12_defconfig

# export mm_U-BOOT_BOARD_TYPE = test-h313
# export mm_U-BOOT_BOARD_DEFCONFIG = x96_q_lpddr3_defconfig
# export mm_U-BOOT_BOARD_DEFCONFIG = x96_q_lpddr3_v1.3_defconfig
# export mm_U-BOOT_BOARD_DEFCONFIG = x96_q_ddr3_defconfig
# export mm_U-BOOT_BOARD_DEFCONFIG = x96_q_ddr3_v5.1_defconfig
# export mm_U-BOOT_BOARD_DEFCONFIG = tanix_tx1_defconfig
# export mm_U-BOOT_BOARD_DEFCONFIG = tanix_tx1_v1.2_defconfig

# export mm_U-BOOT_BOARD_TYPE = test-h618
# export mm_U-BOOT_BOARD_DEFCONFIG = orangepi_zero3_defconfig
# export mm_U-BOOT_BOARD_DEFCONFIG = orangepi_zero2w_defconfig
# export mm_U-BOOT_BOARD_DEFCONFIG = vontar_h618_defconfig
# export mm_U-BOOT_BOARD_DEFCONFIG = transpeed-8k618-t_defconfig









# set this for inform ATF about plat to build
export mm_U-BOOT_BOARD_TYPE

ifneq (,$(findstring h6,$(mm_U-BOOT_BOARD_TYPE)))
INSTALL_PREF = h6
BL31         = $(DESTDIR)$(libdir)/u-boot/h6/bl31.bin
DEFCONFIG    = generic-h6_defconfig
endif
ifneq (,$(findstring h313,$(mm_U-BOOT_BOARD_TYPE)))
INSTALL_PREF = h313
BL31         = $(DESTDIR)$(libdir)/u-boot/h313/bl31.bin
DEFCONFIG    = generic-h313_defconfig
endif
ifneq (,$(findstring h616,$(mm_U-BOOT_BOARD_TYPE)))
INSTALL_PREF = h616
BL31         = $(DESTDIR)$(libdir)/u-boot/h616/bl31.bin
DEFCONFIG    = generic-h616_defconfig
endif
ifneq (,$(findstring h618,$(mm_U-BOOT_BOARD_TYPE)))
INSTALL_PREF = h618
BL31         = $(DESTDIR)$(libdir)/u-boot/h618/bl31.bin
DEFCONFIG    = generic-h618_defconfig
endif
ifneq (,$(findstring a523,$(mm_U-BOOT_BOARD_TYPE)))
INSTALL_PREF = a523
BL31         = $(DESTDIR)$(libdir)/u-boot/a523/bl31.bin
DEFCONFIG    = generic-a523_defconfig
endif

ifeq ($(mm_U-BOOT_BOARD_DEFCONFIG),)
mm_U-BOOT_BOARD_DEFCONFIG = $(DEFCONFIG)
endif
CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_DEFCONFIG)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \

$(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/bl31.bin:
	@echo "Building ATF as dependency ..."
	@$(MAKE) clean install -C ../arm-trusted-firmware
	@#clean current uboot as it depends on just built ATF
	@$(MAKE) clean
	@#for h6 boards also build and install crust scp.bin
	@$(MAKECOOKIE)

pre-everything: $(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/bl31.bin

pre-configure:
ifneq (,$(findstring h6,$(mm_U-BOOT_BOARD_TYPE)))
	@echo "Building crust with $(CRUST_CONFIG) config ..."
	@$(MAKE) clean install -C ../crust
	@if [ -e $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/scp.bin ] ; then \
		echo "Copying [$(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/scp.bin] to u-boot tree ..." ; \
		cp -pd $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/scp.bin \
		       $(WORKSRC)/scp.bin ; \
	fi
endif

configure-custom:
	@echo " "
	@echo "------------------------------------------------------------------"
	@echo "Configuring u-boot with args:$(CONFIGURE_ARGS) ..."
	@echo " "
	@echo "  -mm_U-BOOT_BOARD_TYPE      : $(mm_U-BOOT_BOARD_TYPE)"
	@echo "  -mm_U-BOOT_BOARD_DEFCONFIG : $(mm_U-BOOT_BOARD_DEFCONFIG)"
	@echo "  -BL31                      : $(BL31)"
	@echo "  -building defconfig        : $(mm_U-BOOT_BOARD_DEFCONFIG)"
	@echo "  -Install dir               : [$(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/$(mm_U-BOOT_BOARD_TYPE)]"
	@echo "-----------------------------------------------------------------"
	@echo " "
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot with $(CONFIGURE_ARGS) ..."
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) $(PARALLELMFLAGS) BL31=$(BL31) all
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/u-boot-sunxi-with-spl.bin \
	       $(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin
	@$(MAKECOOKIE)

clean-all: clean
	@rm -f $(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/bl31.bin
	@rm -f $(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin
