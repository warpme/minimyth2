GARNAME = cloog
GARVERSION = 0.18.5
CATEGORIES = devel
MASTER_SITES = https://github.com/periscop/cloog/releases/download/cloog-0.18.5/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/cxx devel/gmp
BUILDDEPS = devel-tainted/devel-tainted devel/make

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--with-gnu-ld \
	--with-isl=bundle \
	--with-gmp=system \
	--with-gmp-prefix=$(DESTDIR)$(prefix)

include ../../gar.mk

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libcloog-isl.la
	@rm -f $(DESTDIR)$(libdir)/libisl.la
	@$(MAKECOOKIE)
