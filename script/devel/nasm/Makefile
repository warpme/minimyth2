
GARNAME      = nasm
GARVERSION   = 2.15.05
CATEGORIES   = devel
MASTER_SITES = http://www.nasm.us/pub/nasm/releasebuilds/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = BSD_2_Clause

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile
CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

INSTALL_ENV = INSTALLROOT="$(DESTDIR)"

include ../../gar.mk
