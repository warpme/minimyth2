
GARNAME      = graphene
GARVERSION   = 1.10.8
CATEGORIES   = gtk
MASTER_SITES = https://github.com/ebassi/graphene/archive/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c gtk/glib

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D gtk_doc="false" \
	-D tests="false" \
	-D installed_tests="false" \

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libgraphene-1.0.la
	@$(MAKECOOKIE)
