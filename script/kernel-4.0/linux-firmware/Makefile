GARNAME = linux-firmware
GARVERSION = 20150321-f465ac8
CATEGORIES = kernel-4.0
MASTER_SITES = git://git.kernel.org/pub/scm/linux/kernel/git/firmware/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE =

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c kernel-4.0/linux

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
