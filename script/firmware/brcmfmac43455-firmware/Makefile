
GARNAME      = brcmfmac43455-firmware
# Git master from 25.01.2021
GARVERSION   = master
CATEGORIES   = firmware
MASTER_SITES = https://github.com/RPi-Distro/firmware-nonfree/archive/refs/heads/
DISTFILES    = $(GARVERSION).zip
LICENSE      =
DESCRIPTION  =
WORKSRC = $(WORKDIR)/firmware-nonfree-$(GARVERSION)

define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@cp -Rdf $(WORKSRC)/brcm/brcmfmac43455* $(DESTDIR)$(elibdir)/firmware/brcm/
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(elibdir)/firmware/brcm/brcmfmac43455*
