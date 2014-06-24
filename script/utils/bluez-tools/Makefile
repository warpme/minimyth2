GARNAME = bluez-tools
GARVERSION = 0.1.38-662e
CATEGORIES = system
MASTER_SITES = http://bluez-tools.googlecode.com/files/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-bluez_4.96_api.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c gtk/dbus-glib gtk/glib lib/readline

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-obex

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)
