
GARNAME      = gst-plugins-ugly
GARVERSION   = $(GST_VERSION)
CATEGORIES   = gst
MASTER_SITES = $(GST_MASTER_SITES)
PATCHFILES   = $(DISTNAME)-make43.patch
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	lang/c \
	net/curl \
	opengl/glu \
	gstreamer/gst-plugins-base \

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--prefix=/usr \
	--disable-qt

GAR_EXTRA_CONF += gstreamer/meta/package-api.mk
include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libgstadaptivedemux-1.0.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstyadif.la
	@$(MAKECOOKIE)

clean-all:
