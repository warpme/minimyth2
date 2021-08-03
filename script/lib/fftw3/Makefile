
GARNAME      = fftw
GARVERSION   = $(FFTW_VERSION)
CATEGORIES   = lib
MASTER_SITES = http://www.fftw.org/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--enable-portable-binary \
	--enable-threads \
	--with-gnu-ld \
	--with-gcc-arch=$(GARCH)

GAR_EXTRA_CONF += lib/fftw3/package-api.mk
include ../../gar.mk

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libfftw3.la
	@rm -f $(DESTDIR)$(libdir)/libfftw3_threads.la
	@$(MAKECOOKIE)
