
# URL https://github.com/CoreELEC/smartchip/tree/master/trunk_driver
GARNAME      = sci9083h
# 25.12.2023
GARVERSION   = 5d41ac040ecd2072498da88100305c1b444c12c7
CATEGORIES   = firmware
MASTER_SITES = https://github.com/CoreELEC/smartchip/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/smartchip-$(GARVERSION)

LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = 

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = 
INSTALL_SCRIPTS   = custom

include ../../gar.mk

install-custom:
	@echo "Installing s9083s firmware ..."
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/s9083s
	@cp -f $(WORKSRC)/trunk_driver/fw/ram-fw-908x-old-r1549.bin $(DESTDIR)$(elibdir)/firmware/s9083s/ram-fw-908x-old-r1549.bin
	@cp -f $(WORKSRC)/trunk_driver/wifi.cfg $(DESTDIR)$(elibdir)/firmware/s9083s/wifi.cfg
	@#$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(elibdir)/firmware/s9083s*
	@$(MAKECOOKIE)

