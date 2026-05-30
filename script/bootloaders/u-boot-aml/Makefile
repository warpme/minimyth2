
# For test builds.
# By default - khadas vim3 is build

ifeq (0,1)
# s905 generic device
SOC_TYPE                  = s905
mm_U-BOOT_BOARD_TYPE      = board-xxx
mm_U-BOOT_BOARD_DEFCONFIG = p201_defconfig
FIP_BOARD                 = p201
endif

ifeq (0,1)
# s912 generic device
SOC_TYPE                  = s912
mm_U-BOOT_BOARD_TYPE      = board-xxx
mm_U-BOOT_BOARD_DEFCONFIG = sei610_defconfig
FIP_BOARD                 = q200
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
SOC_TYPE                  = s905y4
mm_U-BOOT_BOARD_TYPE      = board-s905y4.vim1s
mm_U-BOOT_BOARD_DEFCONFIG = khadas-vim1s_defconfig
FIP_BOARD                 = vim1s
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

# mainline 2026.07-rc2 - fails with sd/emmc reading
# GARVERSION   = 5732bd0f457b4c671e46574d64d4acb099c0f0a5
# mainline 2026.04 GA - fails with sd/emmc reading
# GARVERSION   = 88dc2788777babfd6322fa655df549a019aa1e69
# mainline 2026.01 GA
GARVERSION   = 127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3
# mainline 2025.10 GA
# GARVERSION   = e50b1e8715011def8aff1588081a2649a2c6cd47
# mainline 2025.04 GA
# GARVERSION   = 34820924edbc4ec7803eb89d9852f4b870fa760a

# git@ 15.03.2026
FIPVERSION   = 42d372123631066fb77fbcbb612dc3eb41a3f6f9
MASTER_SITES = https://github.com/u-boot/u-boot/archive/ \
               https://github.com/LibreELEC/amlogic-boot-fip/archive/
DISTFILES    = $(GARVERSION).zip $(FIPVERSION).zip
PATCHFILES   = 01-g12b-khadas-vim3-add-http-netboot-support.patch \
               03-sm1-khadas-vim3l-add-http-netboot-support.patch \
               04-sm1-add-tanix-tx5plus_defconfig.patch \
               05-sm1-add-x96-air_defconfig.patch \
               50-amlogic-boot-fip-add-enc-bins-support.patch \
               51-amlogic-boot-fip-add-x96-air-support.patch \
               52-amlogic-boot-fip-add-tanix-tx5plus-support.patch
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
FIPSRC       = $(WORKSRC)/amlogic-boot-fip

CATEGORIES   = bootloaders
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c lib/libgnutls
BUILDDEPS = devel/swig utils/dtc bootloaders/gxlimg

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
	@echo "Patching FIP ..."
	@echo "----- FIP start ----------------------------------------------------------------"
	@echo "Running FIP in $(FIPSRC) for $(FIP_BOARD) ..."
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)"
	@cd $(FIPSRC) && ./build-fip.sh $(FIP_BOARD) $(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)/bl33.bin $(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)
	@echo "------FIP end ------------------------------------------------------------------"
	@echo "Built: u-boot files are in [$(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)]"
	@$(MAKECOOKIE)

clean-all: clean
