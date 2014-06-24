GARNAME = libelf
GARVERSION = 0.8.13
CATEGORIES = lib
MASTER_SITES = http://www.mr511.de/software/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS = devel-tainted/devel-tainted devel/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--libdir=$(DESTDIR)$(libdir) \
	--includedir=$(DESTDIR)$(includedir) \
	--disable-nls \
	--enable-shared

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

#post-install:
#	@rm -f $(DESTDIR)$(libdir)/libelf.a
#	@$(MAKECOOKIE)
