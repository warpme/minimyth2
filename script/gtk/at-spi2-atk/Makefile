GARNAME = at-spi2-atk
GARVERSION = 2.24.1
CATEGORIES = gtk
MASTER_SITES = https://git.gnome.org/browse/at-spi2-atk/snapshot/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c gtk/glib gtk/at-spi2-core

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-static \
	--enable-shared \
	--enable-rebuilds \
	--disable-glibtest \
	--disable-introspection \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-gtk-doc-pdf \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libatk-bridge-2.0.la
	@$(MAKECOOKIE)
