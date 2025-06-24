
GARNAME      = json
GARVERSION   = 3.12.0
CATEGORIES   = lib
MASTER_SITES = https://github.com/nlohmann/json/archive/refs/tags/
DISTFILES    = v$(GARVERSION).tar.gz
WORKSRC      = $(WORKDIR)/json-$(GARVERSION)
LICENSE      = GPL

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk
