
GARNAME      = libshout
GARVERSION   = 2.4.5
CATEGORIES   = lib
MASTER_SITES = https://downloads.xiph.org/releases/libshout/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.gz
LICENSE      = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libvorbis lib/libtheora lib/openssl

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	LIBS=$(DESTDIR)$(elibdir64)/libmvec.so.1 \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libshout.la
	$(MAKECOOKIE)
