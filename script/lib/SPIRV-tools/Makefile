
GARNAME      = SPIRV-Tools
GARVERSION   = 9fa14b91414994e2bf4d9509b8efc8071f154991
CATEGORIES   = lib
MASTER_SITES = https://github.com/KhronosGroup/SPIRV-Tools/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      = GPL2

DEPENDS = lang/c lib/SPIRV-Headers

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DSPIRV_SKIP_TESTS="ON" \
	-DSPIRV-Headers_SOURCE_DIR="$(DESTDIR)$(prefix)" \

include ../../gar.mk
