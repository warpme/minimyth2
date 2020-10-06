
GARNAME      = autoconf-archive
GARVERSION   = 2019.01.06
CATEGORIES   = devel
MASTER_SITES = https://ftpmirror.gnu.org/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c devel/autoconf

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk

x-pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(MAKECOOKIE)
