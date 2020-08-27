
GARNAME      = alsa-ucm2
GARVERSION   = ec2d7eba314679e564b051ee497544d7d987b320
CATEGORIES   = utils
MASTER_SITES = https://github.com/alsa-project/alsa-ucm-conf/archive/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = alsa-ucm-conf-add-amlogic-cards.patch
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
