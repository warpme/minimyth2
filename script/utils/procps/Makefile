GARNAME = procps
GARVERSION = 3.2.8
CATEGORIES = utils
MASTER_SITES = http://procps.sourceforge.net/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-make_3.82.patch
LICENSE = GPL2/LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/ncurses

BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

BUILD_ARGS = \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)"
INSTALL_ARGS = \
	ldconfig="true" \
	install="install -D"
BUILD_OVERRIDE_DIRS = \
	usr/bin bin sbin usr/proc/bin man1 man5 man8 lib usr/lib usr/include
INSTALL_OVERRIDE_DIRS = \
	usr/bin bin sbin usr/proc/bin man1 man5 man8 lib usr/lib usr/include

include ../../gar.mk

usr/bin      := $(bindir)/
bin          := $(ebindir)/
sbin         := $(esbindir)/
usr/proc/bin := $(bindir)/
man1         := $(mandir)/man1/
man5         := $(mandir)/man5/
man8         := $(mandir)/man8/
lib          := $(elibdir)/
usr/lib      := $(libdir)/
usr/include  := $(includedir)/
