GARNAME = mpfr
GARVERSION = $(MPFR_VERSION)
CATEGORIES = devel-tainted
SOURCEPKG = devel/mpfr
LICENSE = GPL3/LGPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS   = devel-tainted/gmp
BUILDDEPS = devel-tainted/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--with-gmp-include=$(DESTDIR)$(includedir) \
	--with-gmp-lib=$(DESTDIR)$(libdir) \
	--with-gnu-ld

GAR_EXTRA_CONF += devel/mpfr/package-api.mk
include ../../gar.mk

CPPFLAGS :=
CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libmpfr.la
	@$(MAKECOOKIE)
