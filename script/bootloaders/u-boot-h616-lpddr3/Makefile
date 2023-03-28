
# https://github.com/iuncuim/u-boot/commits/h616-dram-lpddr3 01.03.2023
GARNAME      = u-boot-h616-lpddr3-20230301
GARVERSION   = 196f9732e78d7d2717dc6ee6d689537d69385261
CATEGORIES   = kernel
MASTER_SITES = https://github.com/iuncuim/u-boot/archive/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = 01-sunxi-h6-h616-add-emac2.patch
PATCHFILES  += 04-sunxi-H616-GPU-enable-hack.patch
PATCHFILES  += 50-add-h616-tanix-tx6s-defconfig.patch
#PATCHFILES  += 51-add-h616-t95-defconfig.patch
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

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \
	BL31=$(DESTDIR)$(libdir)/u-boot/h616/bl31.bin \

configure-custom:
	@echo "Configuring u-boot for SunXi H616 with $(CONFIGURE_ARGS) ..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot for SunXi H616 with $(CONFIGURE_ARGS) ..."
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
