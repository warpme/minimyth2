
GARNAME      = libcap
GARVERSION   = 2.64
CATEGORIES   = lib
MASTER_SITES = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/
DISTFILES    = $(DISTNAME).tar.xz
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
    BUILD_CC=$(build_CC) \
    CC=$(CC) \
    OBJCOPY=$(OBJCOPY) \

INSTALL_ARGS = \
    DESTDIR="$(DESTDIR)" \
    PREFIX="$(prefix)" \
    LIBDIR="$(libdir)" \
    sbindir=$(bindir) \
