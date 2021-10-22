
GARNAME      = apitrace
GARVERSION   = 9.0
CATEGORIES   = devel
MASTER_SITES = https://github.com/apitrace/apitrace/archive/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = GPL2/LGPL2

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
	-DENABLE_GUI="OFF" \

include ../../gar.mk
