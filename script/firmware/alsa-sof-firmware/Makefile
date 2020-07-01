GARNAME = sof-firmware
GARVERSION = 1.4.2
CATEGORIES = firmware
MASTER_SITES = https://www.alsa-project.org/files/pub/misc/sof/
DISTFILES = $(DISTNAME).tar.bz2
WORKSRC = $(WORKDIR)/usr/lib/firmware/
LICENSE =

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

git//%/$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*/$(GARNAME).git, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/
	@cp -Rdf $(WORKSRC)/* $(DESTDIR)$(elibdir)/firmware/
	@$(MAKECOOKIE)

clean-all:

