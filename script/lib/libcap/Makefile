
GARNAME      = libcap
GARVERSION   = 2.51
CATEGORIES   = lib
MASTER_SITES = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/
DISTFILES    = $(DISTNAME).tar.xz
PATCHFILES   = libcap-2.45-makefile.patch
LICENSE      = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/pam

BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

include ../../gar.mk

BUILD_ARGS   = \
    PREFIX="$(prefix)" \
    CPPFLAGS="$(CPPFLAGS)" \
    CFLAGS="$(CFLAGS) $(LDFLAGS)" \
    CXXFLAGS="$(CXXFLAGS) $(LDFLAGS)" \
    BUILD_CC=$(build_CC) \
    CC=$(CC) \
    AR=$(AR) \
    RANLIB=$(RANLIB) \

INSTALL_ARGS = \
    DESTDIR="$(DESTDIR)" \
    PREFIX="$(prefix)" \
    LIBDIR="$(libdir)" \
