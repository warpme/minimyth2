
GARNAME      = mmc-utils
GARVERSION   = 20251230-8f41ccbb
CATEGORIES   = utils
MASTER_SITES = git://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = GPL

DEPENDS = lang/c

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = custom

include ../../gar.mk

BUILD_ARGS = "C=0"

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

install-custom:
	@cp -f $(WORKSRC)/mmc $(DESTDIR)$(bindir)/mmc
	@$(MAKECOOKIE)
