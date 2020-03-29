
GARNAME      = at-spi2-core
# v2.25.1
GARVERSION   = 8013941fa9c22a9deeef22bb7feb2f2a081c8a2b
CATEGORIES   = gtk
MASTER_SITES = https://gitlab.gnome.org/GNOME/at-spi2-core/-/archive/$(GARVERSION)/
PATCHFILES   = $(DISTNAME)-hack-to-compile.patch
DISTFILES    = $(DISTNAME).tar.bz2

LICENSE = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c gtk/glib gtk/dbus-glib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-static \
	--enable-shared \
	--disable-introspection \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-gtk-doc-pdf \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libatspi.la
	@$(MAKECOOKIE)
