
GARNAME      = libogg
GARVERSION   = 1.3.5
CATEGORIES   = lib
MASTER_SITES = http://downloads.xiph.org/releases/ogg/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = xiph
xiph_LICENSE_TEXT = $(WORKSRC)/COPYING

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
	@rm -f $(DESTDIR)$(libdir)/libogg.la
	@$(MAKECOOKIE)
