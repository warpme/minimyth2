
GARNAME      = linux-firmware-meson
GARVERSION   = 908a4c034ca77617f77c030d6ee4a6c41cfbf8d6
CATEGORIES   = firmware
MASTER_SITES = https://github.com/chewitt/meson-firmware/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)/meson-firmware-908a4c034ca77617f77c030d6ee4a6c41cfbf8d6/meson/vdec

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/meson/vdec
	@cp -Rdf $(WORKSRC)/*.bin $(DESTDIR)$(elibdir)/firmware/meson/vdec/
	@$(MAKECOOKIE)

clean-all: clean
