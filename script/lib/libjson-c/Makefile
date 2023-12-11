
GARNAME      = json-c-json-c
GARVERSION   = 0.17
CATEGORIES   = lib
MASTER_SITES = https://github.com/json-c/json-c/archive/
DISTFILES    = json-c-$(GARVERSION).tar.gz
PATCHFILES   = dont-check-use-doxygen.patch
LICENSE      = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/cxx

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk
