GARNAME = linux-amlogic-firmware
GARVERSION = 9cb39a43dcb2cc19253816b0fef8f3698e344f4f
CATEGORIES = kernel-amlogic-4.19
MASTER_SITES = https://github.com/chewitt/meson-firmware/archive/
DISTFILES = $(GARVERSION).tar.gz
LICENSE =
DESCRIPTION =
define BLURB
endef

WORKSRC = $(WORKDIR)/meson-firmware-$(GARVERSION)

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
	@rm -rf $(DESTDIR)$(elibdir)/firmware*
