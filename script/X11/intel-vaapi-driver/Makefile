
# git master @ 28.09.2021
GARNAME      = intel-vaapi-driver
GARVERSION   = 3ed3f6a783fdfff3fa1b567888518dcbda7eb2a3
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
