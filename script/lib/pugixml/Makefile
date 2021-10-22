
GARNAME      = pugixml
GARVERSION   = 1.11.4
CATEGORIES   = lib
MASTER_SITES = https://github.com/zeux/pugixml/releases/download/v$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = MIT

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk
