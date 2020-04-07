
GARNAME      = alsa-ucm
GARVERSION   = 145869c590d8fd1db9dc7ebeb1d4143879f3ff2b
CATEGORIES   = bootloaders
MASTER_SITES = https://github.com/plbossart/UCM/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/UCM-$(GARVERSION)/

DENENDS      = lib/alsa-lib

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(datadir)/alsa/ucm
	@cp -rf $(WORKSRC)/* $(DESTDIR)$(datadir)/alsa/ucm/
	@$(MAKECOOKIE)

clean-all:
	@rm -rf  $(DESTDIR)$(datadir)/alsa/ucm/
