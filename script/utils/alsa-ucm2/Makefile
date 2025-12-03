
GARNAME      = alsa-ucm-conf
GARVERSION   = 1.2.14
CATEGORIES   = utils
MASTER_SITES = https://www.alsa-project.org/files/pub/lib/
DISTFILES    = $(DISTNAME).tar.bz2
PATCHFILES   = ucm2-Qualcomm-add-Radxa-Dragon-Q6A.patch

DENENDS      = lib/alsa-lib

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(datadir)/alsa/ucm2
	@cp -rf $(WORKSRC)/ucm2/* $(DESTDIR)$(datadir)/alsa/ucm2/
	@$(MAKECOOKIE)

clean-all:
	@rm -rf  $(DESTDIR)$(datadir)/alsa/ucm2*
