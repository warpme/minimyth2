
GARNAME      = double-conversion
GARVERSION   = 3.3.0
CATEGORIES   = lib
MASTER_SITES = https://github.com/google/double-conversion/archive/
DISTFILES    = v$(GARVERSION).tar.gz
LICENSE      = BSD

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DBUILD_SHARED_LIBS=ON \

include ../../gar.mk
