
GARNAME      = u-boot-h618-orangepi-zero3
GARVERSION   = 2023.07
CATEGORIES   = kernel
MASTER_SITES = https://github.com/leeboby/opizero3-uboot-dtb/raw/main/
DISTFILES    = u-boot-sunxi-with-spl-opizero3-4gb.bin
WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

CONFIGURE_SCRIPTS   = 
BUILD_SCRIPTS       = 
INSTALL_SCRIPTS     = custom

include ../../gar.mk
include ../../python3/python/package-api.mk

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/h616/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/u-boot-sunxi-with-spl-opizero3-4gb.bin \
	       $(DESTDIR)$(libdir)/u-boot/h616/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
