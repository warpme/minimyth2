
GARNAME      = gmmlib-intel-gmmlib
GARVERSION   = 22.3.10
CATEGORIES   = X11
MASTER_SITES = https://github.com/intel/gmmlib/archive/refs/tags/
DISTFILES    = $(DISTNAME).tar.gz
DISTFILES    = intel-gmmlib-$(GARVERSION).tar.gz
LICENSE      = GPL

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DRUN_TEST_SUITE="OFF" \

include ../../gar.mk
