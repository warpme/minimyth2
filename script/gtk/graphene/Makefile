GARNAME = graphene
GARVERSION = 1.6.0
CATEGORIES = gtk
MASTER_SITES = https://github.com/ebassi/graphene/archive/
DISTFILES = $(GARVERSION).tar.gz
LICENSE = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c gtk/glib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-static \
	--enable-shared \
	--disable-introspection \
	--enable-rebuilds \
	--disable-glibtest \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-gtk-doc-pdf \
	--with-gnu-ld \
	PYTHON3_PATH="/usr/bin/python3"

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libgraphene-1.0.la
	@$(MAKECOOKIE)
