
GARNAME      = tinyxml
GARVERSION   = 2.6.2_2
CATEGORIES   = lib
MASTER_SITES = http://mirrors.xbmc.org/build-deps/sources/
DISTFILES    = $(DISTNAME).tar.gz tinyxml.pc
LICENSE      = GPL

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libtinyxml.la
	@$(MAKECOOKIE)
