GARNAME = libmng
GARVERSION = $(LIBMNG_VERSION)
CATEGORIES = lib
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/$(GARNAME)-devel/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-automake_1.12.patch
LICENSE = libmng
libmng_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libjpeg lib/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--with-gnu-ld \
	--with-zlib \
	--with-jpeg \
	--without-lcms
	
include ../../gar.mk

pre-configure:
	@cp $(WORKSRC)/makefiles/configure.in $(WORKSRC)
	@cp $(WORKSRC)/makefiles/Makefile.am $(WORKSRC)
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libmng.la
	@$(MAKECOOKIE)
