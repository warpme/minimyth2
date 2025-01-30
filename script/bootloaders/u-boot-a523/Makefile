
GARNAME      = u-boot-a523
# v30.01.2025
GARVERSION   = b99f4a9e0778f4f402619d70976537d4833d7eab
CATEGORIES   = kernel
MASTER_SITES = https://github.com/apritzel/u-boot/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c bootloaders/arm-trusted-firmware-a523
BUILDDEPS = devel/swig utils/dtc lib/libgnutls

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk
include ../../python3/python/package-api.mk

# For forcing given board (usually for testing)
# mm_U-BOOT_BOARD_TYPE = avaota_a1_defconfig
# mm_U-BOOT_BOARD_TYPE = radxa-a5e_defconfig
# mm_U-BOOT_BOARD_TYPE = x96q_pro_plus_defconfig

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \
	BL31=$(DESTDIR)$(libdir)/u-boot/a523/bl31.bin \

configure-custom:
	@echo "Copying [$(DESTDIR)$(libdir)/u-boot/a523/scp.bin] to u-boot tree ..."
	@cp -pd $(DESTDIR)$(libdir)/u-boot/a523/scp.bin $(WORKSRC)/scp.bin
	@echo "Configuring u-boot for SunXi a523 with $(CONFIGURE_ARGS) ..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot for SunXi a523 with $(CONFIGURE_ARGS) ..."
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/a523/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/u-boot-sunxi-with-spl.bin \
	       $(DESTDIR)$(libdir)/u-boot/a523/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
