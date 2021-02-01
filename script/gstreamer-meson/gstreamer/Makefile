
GARNAME      = gstreamer
GARVERSION   = $(GST_VERSION)
CATEGORIES   = gst
MASTER_SITES = $(GST_MASTER_SITES)
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	lang/c \
	lib/libxml2 \
	devel/libelf \

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

CONFIGURE_ARGS = $(DIRPATHS_MESON) \
	--buildtype=release \
	-D gst-debug=false \
	-D examples=disabled \
	-D tests=disabled \
	-D failing-tests=false \
	-D benchmarks=disabled \
	-D tools=disabled \
	-D introspection=disabled \
	-D gtk-doc=false \
	-D gtk-doc-html=false \
	-D gtk-doc-pdf=false \
	-D gobject-cast-checks=disabled \
	-D glib-asserts=disabled \
	-D check=disabled \
	-D Bsymbolic=false \

GAR_EXTRA_CONF += gstreamer/meta/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libgstbase-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstcontroller-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstnet-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstreamer-1.0.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcoretracers.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcoreelements.la
	@# Fix for bug in gst meson config(?): it looks like include prefix declared.
	@# in configure is wrongly prepended with configure {prefix}
	@files=`ls -1 $(DESTDIR)$(libdir)/pkgconfig/gstreamer-*` ; \
	 for file in $${files} ; do \
		sed  \
		 -e 's%^includedir=$${prefix}%includedir=%g' \
		 -i $${file} ; \
	 done
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)$(libdir)/libgstbase*.so*
	@rm -f $(DESTDIR)$(libdir)/libgstcontroller*.so*
	@rm -f $(DESTDIR)$(libdir)/libgstnet*.so*
	@rm -f $(DESTDIR)$(libdir)/libgstreamer*.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcoretracers.so*
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstcoreelements.so*
