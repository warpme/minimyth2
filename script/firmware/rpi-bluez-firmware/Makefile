
GARNAME      = bluez-firmware-rpi
# Git master from 5.05.2022
GARVERSION   = 31ad68831357d2019624004f1f0846475671088f
CATEGORIES   = firmware
MASTER_SITES = https://github.com/RPi-Distro/bluez-firmware/archive/
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

