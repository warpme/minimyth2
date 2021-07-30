
GARNAME      = acpitool
GARVERSION   = 0.5.1
CATEGORIES   = utils
MASTER_SITES = http://downloads.sourceforge.net/sourceforge/acpitool/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = GPL

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
