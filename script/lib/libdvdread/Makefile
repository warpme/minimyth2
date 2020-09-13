
GARNAME      = libdvdread
GARVERSION   = 6.1.1
CATEGORIES   = lib
MASTER_SITES = https://code.videolan.org/videolan/libdvdread/-/archive/6.1.1/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

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
	@rm -f $(DESTDIR)$(libdir)/libdvdread.la
	@$(MAKECOOKIE)
