
GARNAME      = isl
GARVERSION   = 0.24
CATEGORIES   = devel
MASTER_SITES = https://libisl.sourceforge.io/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c devel/gmp
BUILDDEPS = devel-tainted/devel-tainted devel/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--with-gnu-ld \
	--with-gmp=system \
	--with-gmp-prefix=$(DESTDIR)$(prefix)

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libisl.la
	@$(MAKECOOKIE)
