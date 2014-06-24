GARNAME = xvattr
GARVERSION = 1.3
CATEGORIES = X11
#MASTER_SITES = http://www.dtek.chalmers.se/groups/dvd/dist/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-cflags.patch $(DISTNAME)-no_gtk.patch $(DISTNAME)-no_pod.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c xorg/xorg lib/libjpeg lib/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes=$(DESTDIR)$(includedir) \
	--x-libraries=$(DESTDIR)$(libdir) \
	--with-x \
	--with-xv-path=$(DESTDIR)$(libdir)

CONFIGURE_ENV = \
	GTK_CONFIG=no

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program
