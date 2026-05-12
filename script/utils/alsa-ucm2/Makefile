
GARNAME      = alsa-ucm-conf
# git@8.05.2026
GARVERSION   = e8737afe38dc6e87578cb28256427ee53a183f53
CATEGORIES   = utils
MASTER_SITES = https://github.com/alsa-project/alsa-ucm-conf/archive/
DISTFILES    = $(GARVERSION).zip

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
