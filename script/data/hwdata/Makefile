
GARNAME      = hwdata
GARVERSION   = 0.394
CATEGORIES   = data
MASTER_SITES = https://github.com/vcrhonek/hwdata/archive/refs/tags/
DISTFILES    = v$(GARVERSION).tar.gz
LICENSE      = GPL2

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

post-install:
	@mv $(DESTDIR)$(datadir)/pkgconfig/hwdata.pc $(DESTDIR)$(libdir)/pkgconfig/hwdata.pc
	@$(MAKECOOKIE)
