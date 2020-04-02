
GARNAME      = gstreamer
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
	lib/libxml2 \
	devel/libelf \

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--prefix=/usr \
	--disable-gst-debug \
	--disable-gst-debug \
	--disable-examples \
	--disable-tests \
	--disable-failing-tests \
	--disable-benchmarks \
	--enable-tools \
	--enable-introspection=no \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-gtk-doc-pdf \
	--enable-gobject-cast-checks=no \
	--enable-glib-asserts=no \
	--disable-check \
	--disable-Bsymbolic \

GAR_EXTRA_CONF += gstreamer/meta/package-api.mk
include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libgstbase-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstcontroller-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstnet-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstreamer-1.0.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcoretracers.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcoreelements.la
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)$(libdir)/libgstbase*.so*
	@rm -f $(DESTDIR)$(libdir)/libgstcontroller*.so*
	@rm -f $(DESTDIR)$(libdir)/libgstnet*.so*
	@rm -f $(DESTDIR)$(libdir)/libgstreamer*.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcoretracers.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcoreelements.so*
