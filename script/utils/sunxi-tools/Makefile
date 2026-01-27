
GARNAME      = sunxi-tools
# 29.03.2025
GARVERSION   = 7540cb235691be94ac5ef0181a73dd929949fc4e
MASTER_SITES = https://github.com/linux-sunxi/sunxi-tools/archive/
DISTFILES    = $(GARVERSION).zip
CATEGORIES   = util
LICENSE      = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lib/libusb

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@echo "Installing..."
	@cp -rf $(WORKSRC)/{sunxi-bootinfo,sunxi-fel,sunxi-fexc,sunxi-nand-part,sunxi-pio} $(DESTDIR)$(bindir)/
	@chmod +x $(DESTDIR)$(bindir)/{sunxi-bootinfo,sunxi-fel,sunxi-fexc,sunxi-nand-part,sunxi-pio}
	@$(MAKECOOKIE)
