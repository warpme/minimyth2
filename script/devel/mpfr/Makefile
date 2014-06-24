GARNAME = mpfr
GARVERSION = $(MPFR_VERSION)
CATEGORIES = devel
MASTER_SITES = http://www.mpfr.org/mpfr-current/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME)-allpatches_20120830.patch
LICENSE = GPL3/LGPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c devel/gmp
BUILDDEPS = devel-tainted/devel-tainted devel/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--with-gmp-include=$(DESTDIR)$(includedir) \
	--with-gmp-lib=$(DESTDIR)$(libdir) \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libmpfr.la
	@$(MAKECOOKIE)
