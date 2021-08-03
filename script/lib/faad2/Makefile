
GARNAME      = faad2
GARVERSION   = 2_10_0
CATEGORIES   = lib
MASTER_SITES = https://github.com/knik0/faad2/archive/refs/tags/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libfaad.la
	@rm -f $(DESTDIR)$(libdir)/libmp4ff.a
	@rm -f $(DESTDIR)$(libdir)/libmp4ff.la
	@$(MAKECOOKIE)
