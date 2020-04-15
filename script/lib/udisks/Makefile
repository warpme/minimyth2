GARNAME = udisks
GARVERSION = 1.0.4
CATEGORIES = lib
MASTER_SITES = http://hal.freedesktop.org/releases/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = \
    $(DISTNAME)-automake_1.13.patch \
    $(DISTNAME)-fix-gcc9.3-building.patch \

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/sg3_utils gtk/dbus-glib lib/polkit lib/pam lib/parted lib/LVM2 lib/libatasmart
BUILDDEP = gtk/dbus-glib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--disable-lvm2 \
	--disable-man-pages \
	--disable-remote-access \
	DEVMAPPER_CFLAGS="$(DESTDIR)$(includedir)" \
	DEVMAPPER_LIBS="$(DESTDIR)$(libdir)/libdevmapper.so"

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@rm -f $(WORKSRC)/config.cache
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libdbus-1.la
	@$(MAKECOOKIE)
