
GARNAME      = bluez-firmware-rpi
# Git master from 20.03.2021
GARVERSION   = master
CATEGORIES   = firmware
MASTER_SITES = https://github.com/RPi-Distro/bluez-firmware/archive/refs/heads/
DISTFILES    = $(GARVERSION).zip
LICENSE      =
DESCRIPTION  =
WORKSRC = $(WORKDIR)/bluez-firmware-$(GARVERSION)

define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@cp -Rdf $(WORKSRC)/broadcom/*.{txt,bin,hex,hcd} $(DESTDIR)$(elibdir)/firmware/brcm/
	@$(MAKECOOKIE)

clean-all: clean

