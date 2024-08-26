
# git master @ 07.05.2024
GARNAME      = intel-vaapi-driver
GARVERSION   = 06c9a893581c975c365c2281a1e597197b558085
CATEGORIES   = X11
MASTER_SITES = https://github.com/intel/intel-vaapi-driver/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c X11/libva xorg/xorg

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-glx \
	--disable-debug \
	--disable-tracer \
	--disable-static \
	--enable-shared \
	--enable-silent-rules \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/i965_drv_video.la
	@$(MAKECOOKIE)
