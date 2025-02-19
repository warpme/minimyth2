
GARNAME      = SPIRV-Headers
GARVERSION   = 54a521dd130ae1b2f38fef79b09515702d135bdd
CATEGORIES   = lib
MASTER_SITES = https://github.com/KhronosGroup/SPIRV-Headers/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      = GPL2

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk
