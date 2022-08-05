
ifeq (1,1)
GARNAME      = stress-ng
GARVERSION   = 0.14.03
CATEGORIES   = utils
MASTER_SITES = https://github.com/ColinIanKing/stress-ng/archive/
DISTFILES    = V$(GARVERSION).tar.gz
PATCHFILES   = stress-ng-01-compile-with-glibc-2.36.patch
LICENSE      = GPL2
endif

ifeq (0,1)
GARNAME      = stress-ng
GARVERSION   = cd27d266cdd66aff62e129d91c098ceda1aa53aa
CATEGORIES   = utils
MASTER_SITES = https://github.com/ColinIanKing/stress-ng/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      = GPL2
endif

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
    CPPFLAGS="$(CPPFLAGS)" \
    CFLAGS="$(CFLAGS) $(LDFLAGS)" \
    CXXFLAGS="$(CXXFLAGS) $(LDFLAGS)"
INSTALL_ARGS = \
    DESTDIR="$(DESTDIR)" \
    PREFIX="$(prefix)" \
    LIBDIR="$(libdir)"

include ../../gar.mk

