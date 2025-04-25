
GARNAME      = stress-ng
GARVERSION   = 0.18.12
CATEGORIES   = utils
MASTER_SITES = https://github.com/ColinIanKing/stress-ng/archive/
DISTFILES    = V$(GARVERSION).tar.gz
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

