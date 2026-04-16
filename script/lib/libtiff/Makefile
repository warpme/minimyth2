
GARNAME       = libtiff
GARVERSION    = v4.7.1
CATEGORIES    = lib
MASTER_SITES  = https://gitlab.com/libtiff/libtiff/-/archive/$(GARVERSION)/
DISTFILES     = $(DISTNAME).tar.bz2
# LICENSE       = LICENSE.md

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx devel/zlib lib/libjpeg utils/xz

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--with-gnu-ld \
	--without-x

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libtiff.la
	@rm -f $(DESTDIR)$(libdir)/libtiffxx.la
	@$(MAKECOOKIE)
