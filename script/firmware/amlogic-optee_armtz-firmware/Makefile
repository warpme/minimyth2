
GARNAME      = amlogic-optee_armtz-firmware
GARVERSION   = 662b843714ac18e92b19887fadc8d8b3d94fc814
CATEGORIES   = firmware
MASTER_SITES = https://github.com/LibreELEC/meson-firmware/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)/meson-firmware-$(GARVERSION)

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/optee_armtz
	@cp -Rdf $(WORKSRC)/optee_armtz/526fc4fc-7ee6-4a12-96e3-83da9565bce8.ta $(DESTDIR)$(elibdir)/firmware/optee_armtz/VideoFW-TA.KhadasVIM1S
	@cp -Rdf $(WORKDIR)/../../files/* $(DESTDIR)$(elibdir)/firmware/optee_armtz/
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/optee_armtz/VideoFW-TA.KhadasVIM1S
	@rm -rf $(DESTDIR)$(elibdir)/firmware/optee_armtz/VideoFW-TA.TanixW2TVBox
	@rm -rf $(DESTDIR)$(elibdir)/firmware/optee_armtz/VideoFW-TA.TV98TVBox
	@rm -rf $(DESTDIR)$(elibdir)/firmware/optee_armtz/VideoFW-TA.X96MaxPlusUltra
