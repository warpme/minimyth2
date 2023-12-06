
GARNAME      = nvtop
GARVERSION   = 3.0.2
CATEGORIES   = utils
MASTER_SITES = https://github.com/Syllo/nvtop/archive/refs/tags/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = GPL

DEPENDS = lib/ncurses

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DNVIDIA_SUPPORT=OFF \
	-DAMDGPU_SUPPORT=OFF \

include ../../gar.mk
