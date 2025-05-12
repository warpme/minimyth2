
GARNAME      = libptytty
GARVERSION   = 2.0
CATEGORIES   = lib
MASTER_SITES = http://dist.schmorp.de/libptytty/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL2

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DTTY_GID_SUPPORT_EXITCODE="OFF" \

include ../../gar.mk
