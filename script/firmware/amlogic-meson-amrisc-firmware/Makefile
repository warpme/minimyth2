
GARNAME      = amlogic-meson-amrisc-firmware
# head at 11.11.2026
GARVERSION   = 86dcd831ec9c9beba7368cb3a28c27303697c825
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
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/amrisc
	@cp -Rdf $(WORKSRC)/amrisc/amrisc_vc1.bin $(DESTDIR)$(elibdir)/firmware/amrisc/amrisc_vc1.bin
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/amrisc/amrisc_vc1.bin
