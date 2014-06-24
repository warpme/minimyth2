GARNAME = cloog
GARVERSION = 0.16.3
CATEGORIES = devel
MASTER_SITES = http://www.bastoul.net/cloog/pages/download/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/cxx devel/gmp devel/isl
BUILDDEPS = devel-tainted/devel-tainted devel/make

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--with-gnu-ld \
	--with-isl=system \
	--with-isl-prefix=$(DESTDIR)$(prefix) \
 	--with-gmp=system \
	--with-gmp-prefix=$(DESTDIR)$(prefix)

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libcloog-isl.la
	@$(MAKECOOKIE)
