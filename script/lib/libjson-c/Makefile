
GARNAME      = json-c-json-c
GARVERSION   = 0.15-20200726
CATEGORIES   = lib
MASTER_SITES = https://github.com/json-c/json-c/archive/
DISTFILES    = json-c-$(GARVERSION).tar.gz
LICENSE      = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/cxx

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS = $(DIRPATHS_CMAKE) \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk
