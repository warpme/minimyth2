
GARNAME      = dbus-python
GARVERSION   = 1.3.2
CATEGORIES   = lib
MASTER_SITES = https://dbus.freedesktop.org/releases/dbus-python/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.gz

LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/dbus gtk/glib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk
