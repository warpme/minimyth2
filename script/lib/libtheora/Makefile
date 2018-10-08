GARNAME = libtheora
GARVERSION = 1.1.1
CATEGORIES = lib
MASTER_SITES = https://downloads.xiph.org/releases/theora/
DISTFILES = $(GARNAME)-$(GARVERSION).tar.bz2

LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libogg

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--disable-examples

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libtheoradec.la
	@rm -f $(DESTDIR)$(libdir)/libtheoraenc.la
	@rm -f $(DESTDIR)$(libdir)/libtheora.la
	$(MAKECOOKIE)
