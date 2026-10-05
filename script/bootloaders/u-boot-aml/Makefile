
# For test builds.
# By default - khadas vim3 is build

ifeq (0,1)
# s905 generic device
SOC_TYPE                  = s905
mm_U-BOOT_BOARD_TYPE      = board-s905w.tx3-mini
mm_U-BOOT_BOARD_DEFCONFIG = tanix-tx3mini_defconfig
FIP_BOARD                 = tanix-tx3-mini
endif

ifeq (0,1)
# s912 based gt1
SOC_TYPE                  = s912
mm_U-BOOT_BOARD_TYPE      = board-s912.beelink_gt1
mm_U-BOOT_BOARD_DEFCONFIG = beelink-gt1_defconfig
# it looks my gt1 needs p212 fip. with beelink_gt1 it fails at dram init...
FIP_BOARD                 = p212
endif

ifeq (0,1)
# s912 based gt1 ultimate
SOC_TYPE                  = s912
mm_U-BOOT_BOARD_TYPE      = board-s912.beelink_gt1
mm_U-BOOT_BOARD_DEFCONFIG = beelink-gt1_defconfig
FIP_BOARD                 = beelink-gt1
endif

ifeq (0,1)
# g12a based radxa zero
SOC_TYPE                  = g12a
mm_U-BOOT_BOARD_TYPE      = board-g12a.radxa_zero
mm_U-BOOT_BOARD_DEFCONFIG = radxa-zero_defconfig
FIP_BOARD                 = radxa-zero
endif

ifeq (0,1)
# sm1 based x96-air
SOC_TYPE                  = sm1
mm_U-BOOT_BOARD_TYPE      = board-sm1.x96_air2g
mm_U-BOOT_BOARD_DEFCONFIG = x96_air_defconfig
FIP_BOARD                 = x96-air
endif

ifeq (0,1)
# sm1 based tanix tx5 plus
SOC_TYPE                  = sm1
mm_U-BOOT_BOARD_TYPE      = board-sm1.tanix_tx5_plus
mm_U-BOOT_BOARD_DEFCONFIG = tanix_tx5plus_defconfig
FIP_BOARD                 = tanix-tx5plus
endif

ifeq (0,1)
# g12b based khadas vim3
SOC_TYPE                  = g12b
mm_U-BOOT_BOARD_TYPE      = board-a311d.vim3
mm_U-BOOT_BOARD_DEFCONFIG = khadas-vim3_defconfig
FIP_BOARD                 = khadas-vim3
endif

ifeq (0,1)
# s905d3 based khadas vim3l
SOC_TYPE                  = sm1
mm_U-BOOT_BOARD_TYPE      = board-s905d3.vim3l
mm_U-BOOT_BOARD_DEFCONFIG = khadas-vim3l_defconfig
FIP_BOARD                 = khadas-vim3l
endif

ifeq (0,1)
# s905y4 based khadas vim1s
SOC_TYPE                  = s4
mm_U-BOOT_BOARD_TYPE      = board-s905y4.vim1s
mm_U-BOOT_BOARD_DEFCONFIG = khadas-vim1s_defconfig
FIP_BOARD                 = khadas-vim1s
endif

ifeq (0,1)
# a311d2 based khadas vim4
SOC_TYPE                  = a311d2
mm_U-BOOT_BOARD_TYPE      = board-a311d2.vim4
mm_U-BOOT_BOARD_DEFCONFIG = t.b.d
FIP_BOARD                 = t.b.d
endif

# Mainline U-boot
GARNAME      = u-boot-aml

# mainline 2026.10-rc5
GARVERSION   = a06e89ab05eaa2b8344d521319399333cd760ae5
# mainline 2026.07 GA
# GARVERSION   = ece349ade2973e220f524ce59e59711cc919263f
# mainline 2026.04 GA - fails with sd/emmc reading
# GARVERSION   = 88dc2788777babfd6322fa655df549a019aa1e69
# mainline 2026.01 GA
# GARVERSION   = 127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3
# mainline 2025.10 GA
# GARVERSION   = e50b1e8715011def8aff1588081a2649a2c6cd47
# mainline 2025.04 GA
# GARVERSION   = 34820924edbc4ec7803eb89d9852f4b870fa760a

# git@ 03.10.2026
FIPVERSION   = 7c2070c20f69ecd832f2ec1e9d242dbbf39ab64a
MASTER_SITES = https://github.com/u-boot/u-boot/archive/ \
               https://github.com/LibreELEC/amlogic-boot-fip/archive/
DISTFILES    = $(GARVERSION).zip $(FIPVERSION).zip
PATCHFILES   = 0001-g12b-khadas-vim3-add-http-netboot-support.patch
PATCHFILES  += 0003-sm1-khadas-vim3l-add-http-netboot-support.patch
PATCHFILES  += 0004-sm1-add-tanix-tx5plus_defconfig.patch
PATCHFILES  += 0005-sm1-add-x96-air_defconfig.patch
PATCHFILES  += 0006-gxm-add-beelink-gt1_defconfig.patch
PATCHFILES  += 0007-gxl-add-tanix-tx3mini_defconfig.patch
# s4 support https://github.com/brivolabs/u-boot/commits/meson_s4/ g4f79a80629 30.09.2026
PATCHFILES  += 0016-pinctrl-meson-a1-Use-gpio-regs-for-ds.patch
PATCHFILES  += 0017-net-mdio-mux-Don-t-crash-if-our-parent-never-shows-u.patch
PATCHFILES  += 0018-mmc-meson-Parse-devicetree-properties.patch
PATCHFILES  += 0019-watchdog-meson_gxbb-Add-support-for-s4-t7-SoCs.patch
PATCHFILES  += 0020-reset-meson-Add-s4-support.patch
PATCHFILES  += 0021-serial-meson-Add-s4-support.patch
PATCHFILES  += 0022-pinctrl-meson-Add-s4-pin-controller.patch
PATCHFILES  += 0023-arm64-meson-Add-s4-SoC-support.patch
PATCHFILES  += 0024-clk-meson-a1-Eliminate-separate-id-parameter.patch
PATCHFILES  += 0025-clk-meson-a1-Use-clk_set_rate-from-meson_mux_set_rat.patch
PATCHFILES  += 0026-clk-meson-Use-soc-specific-naming-for-common-functio.patch
PATCHFILES  += 0027-clk-meson-Export-a1-functions-to-common-file.patch
PATCHFILES  += 0028-clk-meson-Support-fractional-fixed-factor-clocks.patch
PATCHFILES  += 0029-clk-meson-Support-power-of-two-dividers.patch
PATCHFILES  += 0030-clk-meson-Add-s4-clock-driver.patch
PATCHFILES  += 0031-pwm-meson-Add-s4-support.patch
PATCHFILES  += 0032-meson-Add-Khadas-VIM1S-support.patch
PATCHFILES  += 0033-net-mdio-mux-Remove-ourselves-when-our-parent-is-rem.patch
PATCHFILES  += 0034-net-designware-Use-if-instead-of-if-for-DM_MDIO.patch
PATCHFILES  += 0035-net-designware-Fix-MDIO-bus-getting-bound-multiple-t.patch
# s4 additions from https://github.com/chewitt/u-boot/commits/amlogic-2026.10
PATCHFILES  += 0050-WIP-configs-meson64-move-S4-load-addresses-out-of-th.patch
PATCHFILES  += 0051-WIP-ARM-meson-s4-reserve-the-secure-firmware-memory-.patch
PATCHFILES  += 0052-WIP-power-domain-meson-secure-pwrc-add-S4-power-doma.patch
PATCHFILES  += 0053-WIP-phy-meson-g12a-usb2-add-support-for-Meson-S4.patch
PATCHFILES  += 0054-WIP-board-amlogic-vim1s-pick-the-env-MMC-and-set-ser.patch
PATCHFILES  += 0055-WIP-ARM-dts-meson-s4-s905y4-khadas-vim1s-add-USB-hos.patch
PATCHFILES  += 0056-WIP-configs-khadas-vim1s-enable-USB-host-power-domai.patch
PATCHFILES  += 0057-WIP-power-regulator-pwm-support-pwm-dutycycle-range.patch
PATCHFILES  += 0058-WIP-ARM-dts-meson-s4-s905y4-khadas-vim1s-set-the-VDD.patch
PATCHFILES  += 0059-WIP-power-regulator-pwm-use-the-channel-from-the-pwm.patch
PATCHFILES  += 0060-WIP-ARM-dts-meson-s4-s905y4-khadas-vim1s-let-the-SD-.patch
PATCHFILES  += 0061-WIP-mmc-meson-gx-reset-the-delay-and-resampling-regi.patch
# fip additions
PATCHFILES  += 0100-amlogic-boot-fip-add-enc-bins-support.patch
PATCHFILES  += 0101-amlogic-boot-fip-add-x96-air-support.patch
PATCHFILES  += 0102-amlogic-boot-fip-add-tanix-tx5plus-support.patch
PATCHFILES  += 0103-amlogic-boot-fip-add-tanix-tx3mini-support.patch

WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
FIPSRC       = $(WORKSRC)/amlogic-boot-fip

CATEGORIES   = bootloaders
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c lib/libgnutls
BUILDDEPS = devel/swig utils/dtc bootloaders/gxlimg utils/tinyxxd

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

# set to default value when package build is called without any defined board....
SOC_TYPE                  ?= g12b
mm_U-BOOT_BOARD_TYPE      ?= board-a311d.vim3
mm_U-BOOT_BOARD_DEFCONFIG ?= khadas-vim3_defconfig
FIP_BOARD                 ?= khadas-vim3

include ../../gar.mk
include ../../python3/python/package-api.mk

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_DEFCONFIG)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \

post-extract:
	@mkdir -p $(WORKSRC)/amlogic-boot-fip
	@cp -rf $(WORKDIR)/amlogic-boot-fip-$(FIPVERSION)/* $(WORKSRC)/amlogic-boot-fip/
	@$(MAKECOOKIE)

configure-custom:
	@echo " "
	@echo "------------------------------------------------------------------"
	@echo "Configuring  u-boot for: $(SOC_TYPE) with defconfig: $(CONFIGURE_ARGS) ..."
	@echo " "
	@echo "  -mm_U-BOOT_BOARD_TYPE      : $(mm_U-BOOT_BOARD_TYPE)"
	@echo "  -mm_U-BOOT_BOARD_DEFCONFIG : $(mm_U-BOOT_BOARD_DEFCONFIG)"
	@echo "  -FIP                       : $(FIP_BOARD)"
	@echo "  -Install dir               : [$(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)]"
	@echo "-----------------------------------------------------------------"
	@echo " "
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo " Now building u-boot for: $(SOC_TYPE) with defconfig: $(CONFIGURE_ARGS) ..."
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@mkdir -p $(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)
	@echo " Storing built u-boot.bin as bl33.bin in [$(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)]"
	@cp $(WORKSRC)/u-boot.bin $(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)/bl33.bin
	@$(MAKECOOKIE)

install-custom:
	@echo "Cleanup +x rights on FIP sources ..."
	@find $(FIPSRC) -type f -name "aml_encrypt_*" -exec chmod +x {} +
	@find $(FIPSRC) -type f -name "*.py" -exec chmod +x {} +
	@find $(FIPSRC) -type f -name "*.sh" -exec chmod +x {} +
	@echo "----- FIP start ----------------------------------------------------------------"
	@echo "Running FIP in $(FIPSRC) for $(FIP_BOARD) ..."
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)"
	@cd $(FIPSRC) && ./build-fip.sh $(FIP_BOARD) $(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)/bl33.bin $(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)
	@echo "------FIP end ------------------------------------------------------------------"
	@echo "Built: u-boot files are in [$(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)]"
	@$(MAKECOOKIE)

clean-all: clean
