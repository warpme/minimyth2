
GARNAME      = fmt
GARVERSION   = 8.0.1
CATEGORIES   = lib
MASTER_SITES = https://github.com/fmtlib/fmt/archive/refs/tags/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = BSD

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk
