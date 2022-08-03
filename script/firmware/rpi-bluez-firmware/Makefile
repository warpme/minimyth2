
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
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/BCM43430A1.hcd $(DESTDIR)$(elibdir)/firmware/brcm/BCM43430A1.raspberrypi,3-model-b.hcd
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/BCM43430A1.hcd $(DESTDIR)$(elibdir)/firmware/brcm/BCM43430A1.raspberrypi,3-model-b-plus.hcd
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/BCM4345C0.hcd  $(DESTDIR)$(elibdir)/firmware/brcm/BCM4345C0.pine64,quartz64-b.hcd
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/BCM4345C0.hcd  $(DESTDIR)$(elibdir)/firmware/brcm/BCM4345C0.raspberrypi,4-model-b.hcd
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/BCM4345C5.hcd  $(DESTDIR)$(elibdir)/firmware/brcm/BCM4345C5.radxa,rockpi4b.hcd
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/BCM4345C5.hcd  $(DESTDIR)$(elibdir)/firmware/brcm/BCM4345C5.radxa,rockpi4c.hcd
	@ln -srf $(DESTDIR)$(elibdir)/firmware/brcm/BCM4345C5.hcd  $(DESTDIR)$(elibdir)/firmware/brcm/BCM4345C5.radxa,zero.hcd
	@$(MAKECOOKIE)

clean-all: clean
