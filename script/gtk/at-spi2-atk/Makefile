GARNAME      = at-spi2-atk
GARVERSION   = ad3da20b099593520b488e04c11b2eeee2bc39c3
CATEGORIES   = gtk
MASTER_SITES = https://gitlab.gnome.org/GNOME/at-spi2-atk/-/archive/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c gtk/glib gtk/at-spi2-core gtk/atk

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
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libatk-bridge-2.0.la
	@$(MAKECOOKIE)
