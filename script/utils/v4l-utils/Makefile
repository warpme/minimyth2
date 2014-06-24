GARNAME = v4l-utils
GARVERSION = 0.8.5
CATEGORIES = utils
MASTER_SITES = http://linuxtv.org/downloads/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/sysfsutils qt/qt4

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

BUILD_ARGS   = \
	DESTDIR="$(DESTDIR)" \
	PREFIX="$(prefix)" \
	LIBDIR="$(libdir)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS) $(LDFLAGS)" \
	CXXFLAGS="$(CXXFLAGS) $(LDFLAGS)"
INSTALL_ARGS = \
	DESTDIR="$(DESTDIR)" \
	PREFIX="$(prefix)" \
	LIBDIR="$(libdir)"

include ../../gar.mk
