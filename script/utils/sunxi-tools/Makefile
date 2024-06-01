
GARNAME      = sunxi-tools
# 11.01.2024
GARVERSION   = df60a46e38a840b5758c02433d7d85ad08361930
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
