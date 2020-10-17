GARNAME = intel-vaapi-driver
GARVERSION = 2.4.1
CATEGORIES = X11
MASTER_SITES = https://github.com/01org/intel-vaapi-driver/releases/download/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = GPL2

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
	--disable-silent-rules \
	--with-gnu-ld

include ../../gar.mk

CPPFLAGS += -fcommon
CFLAGS   += -fcommon

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/va/i965_drv_video.la
	@$(MAKECOOKIE)
