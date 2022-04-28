
GARNAME      = aw859a-firmware
GARVERSION   = 203ac6b3e8e63df01b33f6aa8dd22367ff03485b
CATEGORIES   = firmware
MASTER_SITES = https://github.com/orangepi-xunlong/firmware/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)/firmware-$(GARVERSION)

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/
	@cp -Rdf $(WORKSRC)/wcnmodem.bin           $(DESTDIR)$(elibdir)/firmware/wcnmodem.bin
	@cp -Rdf $(WORKSRC)/wifi_2355b001_1ant.ini $(DESTDIR)$(elibdir)/firmware/wifi_2355b001_1ant.ini
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/wcnmodem.bin
	@rm -rf $(DESTDIR)$(elibdir)/firmware/wifi_2355b001_1ant.ini
