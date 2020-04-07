
GARNAME      = alsa-ucm2
GARVERSION   = 907c8309b2ee671e1b36630b0d29db1bc3124990
CATEGORIES   = utils
MASTER_SITES = https://github.com/alsa-project/alsa-ucm-conf/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/alsa-ucm-conf-$(GARVERSION)/

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
