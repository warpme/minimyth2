GARNAME = pango
GARVERSION = 1.32.6
CATEGORIES = gtk
MASTER_SITES = http://ftp.gnome.org/pub/GNOME/sources/pango/1.32/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c lang/cxx gtk/cairo gtk/glib gtk/harfbuzz lib/freetype lib/fontconfig xorg/xorg
BUILDDEPS = gtk/gtk-doc

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--config-cache \
	--disable-static \
	--enable-shared \
	--disable-debug \
	--enable-rebuilds \
	--disable-gtk-doc \
	--disable-man \
	--disable-doc-cross-references \
	--enable-explicit-deps=auto \
	--with-gnu-ld \
	--with-xft

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libpango-1.0.la
	@rm -rf $(DESTDIR)$(libdir)/libpangocairo-1.0.la
	@rm -rf $(DESTDIR)$(libdir)/libpangoft2-1.0.la
	@rm -rf $(DESTDIR)$(libdir)/libpangoxft-1.0.la
	@rm -rf $(DESTDIR)$(libdir)/pango/1.8.0/modules/pango-arabic-lang.la
	@rm -rf $(DESTDIR)$(libdir)/pango/1.8.0/modules/pango-basic-fc.la
	@rm -rf $(DESTDIR)$(libdir)/pango/1.8.0/modules/pango-indic-lang.la
	@$(MAKECOOKIE)
