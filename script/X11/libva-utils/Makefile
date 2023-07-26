
GARNAME      = libva-utils
GARVERSION   = 2.19.0
CATEGORIES   = X11
MASTER_SITES = https://github.com/01org/libva-utils/archive/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/cxx X11/libva

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

include ../../gar.mk

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-drm \
	--enable-x11 \
	--disable-wayland \
	--disable-static \
	--enable-shared \
	--with-gnu-ld

pre-configure:
	@mkdir -p $(WORKSRC)/m4
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@#rm -rf $(DESTDIR)$(libdir)/libgio-2.0.la
	@$(MAKECOOKIE)
