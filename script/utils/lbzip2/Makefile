
GARNAME      = lbzip2
GARVERSION   = 2.5
CATEGORIES   = utils
MASTER_SITES = https://ftp.debian.org/debian/pool/main/l/lbzip2/
DISTFILES    = lbzip2_2.5.orig.tar.bz2
PATCHFILES   = lbzip2-gnulib-build-fix.patch
LICENSE      = GPL2

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk
