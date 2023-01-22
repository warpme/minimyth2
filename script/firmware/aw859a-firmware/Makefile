
GARNAME      = aw859a-firmware
# git@6.09.2022
GARVERSION   = 70accf15b75b9a603920f0a8fda45d1739fd410c
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
