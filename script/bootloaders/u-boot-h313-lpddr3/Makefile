
# https://github.com/iuncuim/u-boot/commits/h616-dram-lpddr3 29.03.2023
GARNAME      = u-boot-h313-lpddr3-20230329
GARVERSION   = b5be74120d4aee645c63aea40c91f315e9513d68
CATEGORIES   = kernel
MASTER_SITES = https://github.com/iuncuim/u-boot/archive/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = 01-hack-add-h313-int.emac.phy-support.patch
PATCHFILES  += 04-sunxi-H616-GPU-enable-hack.patch
PATCHFILES  += 50-add-x96-q-lpddr3-defconfig.patch
#PATCHFILES  += 99-enable-debug.patch
#PATCHFILES  += 99-dump-dram-controller-regs.patch
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
# mm_U-BOOT_BOARD_TYPE = tanix_tx6s_defconfig
# mm_U-BOOT_BOARD_TYPE = tanix_tx6s_lpddr3_defconfig
# mm_U-BOOT_BOARD_TYPE = h616_lpddr3_tvbox_defconfig
mm_U-BOOT_BOARD_TYPE = x96_q_lpddr3_defconfig

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \
	BL31=$(DESTDIR)$(libdir)/u-boot/h616/bl31.bin \

configure-custom:
	@echo "Configuring u-boot for SunXi H313 with $(CONFIGURE_ARGS) ..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot for SunXi H313 with $(CONFIGURE_ARGS) ..."
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/h313/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/u-boot-sunxi-with-spl.bin \
	       $(DESTDIR)$(libdir)/u-boot/h313/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
