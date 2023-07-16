
GARNAME      = stress-ng
GARVERSION   = 0.16.02
CATEGORIES   = utils
MASTER_SITES = https://github.com/ColinIanKing/stress-ng/archive/
DISTFILES    = V$(GARVERSION).tar.gz
PATCHFILES   = stress-ng-01-compile-with-glibc-2.36.patch stress-ng-0001-workaround-cross-compilation-issue.patch
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libattr lib/libaio lib/libcap devel/zlib

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

BUILD_ARGS   = \
    DESTDIR="$(DESTDIR)" \
    PREFIX="$(prefix)" \
    LIBDIR="$(libdir)" \

INSTALL_ARGS = \
    DESTDIR="$(DESTDIR)" \
    PREFIX="$(prefix)" \
    LIBDIR="$(libdir)"

include ../../gar.mk

