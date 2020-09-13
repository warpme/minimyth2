
GARNAME      = libdvdnav
GARVERSION   = 6.1.0
CATEGORIES   = lib
MASTER_SITES = https://download.videolan.org/pub/videolan/libdvdnav/6.1.0/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libdvdread

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-configure:
	@# hack to fix failed build due double pipe in nm commnds
	@sed -e 's%| \\$$global_symbol_pipe%\\$$global_symbol_pipe%g' -i $(WORKSRC)/libtool
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libdvdnav.la
	@rm -f $(DESTDIR)$(libdir)/libdvdnavmini.la
	@$(MAKECOOKIE)
