
GARNAME      = aw859a-firmware
GARVERSION   = 12.06.2022
CATEGORIES   = firmware
MASTER_SITES = https://github.com/armbian/firmware/raw/master/uwe5622/
DISTFILES    = wcnmodem-38222.bin wifi_2355b001_1ant.ini
LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/uwe5622
	@cp -Rdf $(WORKSRC)/wcnmodem-38222.bin     $(DESTDIR)$(elibdir)/firmware/uwe5622/wcnmodem.bin
	@cp -Rdf $(WORKSRC)/wifi_2355b001_1ant.ini $(DESTDIR)$(elibdir)/firmware/uwe5622/wifi_2355b001_1ant.ini
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/uwe5622/wcnmodem.bin
	@rm -rf $(DESTDIR)$(elibdir)/firmware/uwe5622/wifi_2355b001_1ant.ini
