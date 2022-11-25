
GARNAME      = gtk+
GARVERSION   = 2.24.28
CATEGORIES   = gtk
MASTER_SITES = http://ftp.gnome.org/pub/GNOME/sources/gtk+/2.24/
PATCHFILES   = $(DISTNAME)-disable-icon-cache-gen.patch
PATCHFILES  += $(DISTNAME)-disable-demos-tests.patch
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS    = lang/c lang/cxx gtk/atk gtk/cairo gtk/gdk-pixbuf gtk/glib gtk/pango lib/libjpeg lib/libpng lib/libtiff xorg/xorg
BUILDDEPS  = gtk/gtk-doc

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes="$(DESTDIR)$(includedir)" \
	--x-libraries="$(DESTDIR)$(libdir)" \
	--enable-silent-rules \
	--disable-static \
	--enable-shared \
	--enable-debug=minimal \
	--enable-shm \
	--enable-xkb \
	--enable-xinerama \
	--enable-rebuilds \
	--enable-visibility \
	--enable-explicit-deps=auto \
	--disable-glibtest \
	--enable-modules \
	--disable-cups \
	--disable-papi \
	--disable-test-print-backend \
	--disable-introspection \
	--disable-gtk-doc \
	--disable-man \
	--with-gnu-ld \
	--without-xinput \
	--with-gdktarget=x11 \
	--with-x

CONFIGURE_ENV  = \
	DB2HTML="false"
ifneq ($(DESTIMG),build)
CONFIGURE_ENV += \
	GTK_UPDATE_ICON_CACHE=$(build_DESTDIR)$(build_bindir)/gtk-update-icon-cache
endif

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)

x-install-gdk-pixbuf.loaders:
	@mkdir -p $(DESTDIR)$(sysconfdir)/gtk-2.0
	@rm -f $(DESTDIR)$(sysconfdir)/gtk-2.0/gdk-pixbuf.loaders
	@$(DESTDIR)$(bindir)/gdk-pixbuf-query-loaders > $(DESTDIR)$(sysconfdir)/gtk-2.0/gdk-pixbuf.loaders
	@$(MAKECOOKIE)

install-cross:
	@if test -e $(WORKSRC)/gtk/gtk-update-icon-cache ; then cp -f $(WORKSRC)/gtk/gtk-update-icon-cache $(DESTDIR)$(bindir)/gtk-update-icon-cache ; fi
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/gtk-2.0/modules/*.la
	@rm -rf $(DESTDIR)$(libdir)/gtk-2.0/2.10.0/engines/*.la
	@rm -rf $(DESTDIR)$(libdir)/gtk-2.0/2.10.0/immodules/*.la
	@rm -rf $(DESTDIR)$(libdir)/gtk-2.0/2.10.0/printbackends/*.la
	@rm -rf $(DESTDIR)$(libdir)/libgailutil.la
	@rm -rf $(DESTDIR)$(libdir)/libgdk-x11-2.0.la
	@rm -rf $(DESTDIR)$(libdir)/libgtk-x11-2.0.la
	@$(MAKECOOKIE)
