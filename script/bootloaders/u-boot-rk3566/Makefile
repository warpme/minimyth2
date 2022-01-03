
GARNAME      = u-boot-rk3566-bins
GARVERSION   = 2021.12.27
CATEGORIES   = kernel
MASTER_SITES = 
DISTFILES    = idblock.bin uboot.img
WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS = devel/swig utils/dtc

CONFIGURE_SCRIPTS   = 
BUILD_SCRIPTS       = 
INSTALL_SCRIPTS     = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(libdir)/u-boot/rk3566/$(mm_U-BOOT_BOARD_TYPE)
	@cp -f  $(WORKSRC)/idblock.bin \
		$(DESTDIR)$(libdir)/u-boot/rk3566/$(mm_U-BOOT_BOARD_TYPE)/idblock.bin
	@echo "Instaling u-boot ..."
	@cp -f  $(WORKSRC)/uboot.img \
		$(DESTDIR)$(libdir)/u-boot/rk3566/$(mm_U-BOOT_BOARD_TYPE)/uboot.img
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
