
GARNAME      = aw859a-firmware
GARVERSION   = 612bc7cc0e3539ea89c659049b7d8432e2de8ed7
CATEGORIES   = firmware
MASTER_SITES = https://github.com/armbian/firmware/archive/
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
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/uwe5622
	@cp -Rdf $(WORKSRC)/uwe5622/wcnmodem.bin           $(DESTDIR)$(elibdir)/firmware/uwe5622/wcnmodem.bin
	@cp -Rdf $(WORKSRC)/uwe5622/wifi_2355b001_1ant.ini $(DESTDIR)$(elibdir)/firmware/uwe5622/wifi_2355b001_1ant.ini
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/uwe5622/wcnmodem.bin
	@rm -rf $(DESTDIR)$(elibdir)/firmware/uwe5622/wifi_2355b001_1ant.ini
