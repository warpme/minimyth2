
GARNAME      = fakechroot
GARVERSION   = 2.20.1
CATEGORIES   = devel
MASTER_SITES = https://github.com/dex4er/fakechroot/archive/refs/tags/
DISTFILES    = $(GARVERSION).tar.gz
PATCHFILES   = statx.patch fakechroot-2.patch fakechroot-3.patch fakechroot-4.patch fakechroot-5.patch
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
