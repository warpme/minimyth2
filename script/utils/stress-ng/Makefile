
GARNAME      = stress-ng
GARVERSION   = cd27d266cdd66aff62e129d91c098ceda1aa53aa
CATEGORIES   = utils
MASTER_SITES = https://github.com/ColinIanKing/stress-ng/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

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

