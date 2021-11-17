
GARNAME      = u-boot-h6-20210331
GARVERSION   = 62acef239f77583f3083f8c842ea2d28f4a1623c
CATEGORIES   = kernel
MASTER_SITES = https://gitlab.denx.de/u-boot/custodians/u-boot-sunxi/-/archive/$(GARVERSION)/
DISTFILES    = u-boot-sunxi-$(GARVERSION).tar.bz2
WORKSRC      = $(WORKDIR)/u-boot-sunxi-$(GARVERSION)

PATCHFILES   = 0009-tanix-tx6-ethernet-hack.patch
PATCHFILES  += 0011-sunxi-H6-Add-basic-Eachlink-H6-Mini-support.patch
# video: sunxi: Rework DE2 driver
# https://patchwork.ozlabs.org/project/uboot/list/?series=230744
PATCHFILES  += 0012-video-sunxi-Rework-DE2-driver.patch
# fix non-booting H6 on gcc11.2
# https://patchwork.ozlabs.org/project/uboot/list/?series=258132
PATCHFILES  += 0013-ARM-Prevent-the-compiler-from-using-NEON-registers.patch

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c bootloaders/arm-trusted-firmware-h6
BUILDDEPS = devel/swig utils/dtc

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk
include ../../python3/python/package-api.mk

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \
	BL31=$(DESTDIR)$(libdir)/u-boot/h6/bl31.bin \

configure-custom:
	@if [ -e $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/scp.bin ] ; then \
		echo "Copying [$(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/scp.bin] to u-boot tree ..." ; \
		cp -pd $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/scp.bin \
		$(WORKSRC)/scp.bin ; \
	 fi
	@echo "Configuring u-boot for SunXi H6 with $(CONFIGURE_ARGS) ..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot for SunXi H6 with $(CONFIGURE_ARGS) ..."
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/u-boot-sunxi-with-spl.bin \
	       $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
