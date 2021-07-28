
GARNAME      = libzip
GARVERSION   = 1.7.3
CATEGORIES   = lib
MASTER_SITES = https://libzip.org/download/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = BSD

DEPENDS = devel/zlib lib/openssl utils/bzip2

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS = $(DIRPATHS_CMAKE) \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DCMAKE_SYSTEM_NAME="Linux" \

include ../../gar.mk
