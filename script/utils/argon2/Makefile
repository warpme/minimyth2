
GARNAME      = argon2
GARVERSION   = 20190702
CATEGORIES   = lib
MASTER_SITES = https://github.com/P-H-C/phc-winner-argon2/archive/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
WORKSRC      = $(WORKDIR)/phc-winner-$(DISTNAME)
LICENSE      = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c
BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

BUILD_ARGS   = \
    DESTDIR="$(DESTDIR)" \
    PREFIX="$(prefix)" \
    ARGON2_VERSION="$(GARVERSION)" OPTTARGET='none' LIBRARY_REL='lib'
INSTALL_ARGS = \
    DESTDIR="$(DESTDIR)" \
    PREFIX="$(prefix)" \
    ARGON2_VERSION="$(GARVERSION)" OPTTARGET='none' LIBRARY_REL='lib'

include ../../gar.mk
