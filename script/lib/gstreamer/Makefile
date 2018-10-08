GARNAME = gstreamer
GARVERSION = 1.10.2
CATEGORIES = system
MASTER_SITES = http://gstreamer.freedesktop.org/src/gstreamer/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2

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
	--disable-trace \
	--disable-gst-debug \
	--disable-examples \
	--disable-tests \
	--disable-failing-tests \
	--disable-benchmarks \
	--enable-tools \
	--enable-introspection=no \
        --disable-docbook \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-gtk-doc-pdf \
	--enable-gobject-cast-checks=no \
	--enable-glib-asserts=no \
	--disable-check \
	--disable-Bsymbolic

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libgstbase-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstcontroller-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstnet-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstreamer-1.0.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcoretracers.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcoreelements.la
	@$(MAKECOOKIE)
