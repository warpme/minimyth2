
GARNAME      = double-conversion
GARVERSION   = 3.1.5
CATEGORIES   = lib
MASTER_SITES = https://github.com/google/double-conversion/archive/
DISTFILES    = v$(GARVERSION).tar.gz
LICENSE      = BSD

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS = $(DIRPATHS_CMAKE) \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DCMAKE_SYSTEM_NAME="Linux" \
	-DBUILD_SHARED_LIBS=ON \

include ../../gar.mk
