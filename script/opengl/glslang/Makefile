
GARNAME      = glslang
GARVERSION   = 14.1.0
CATEGORIES   = opengl
MASTER_SITES = https://github.com/KhronosGroup/glslang/archive/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = BSD

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS_BUILD =

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DBUILD_SHARED_LIBS=ON \
	-DENABLE_OPT="OFF" \

include ../../gar.mk
