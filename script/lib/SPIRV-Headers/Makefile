
GARNAME      = SPIRV-Headers-vulkan-sdk
GARVERSION   = 1.3.283.0
CATEGORIES   = lib
MASTER_SITES = https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/
DISTFILES    = vulkan-sdk-$(GARVERSION).tar.gz
LICENSE      = GPL2

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk
