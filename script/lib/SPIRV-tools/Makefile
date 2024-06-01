
GARNAME      = SPIRV-Tools
GARVERSION   = 2024.1
CATEGORIES   = lib
MASTER_SITES = https://github.com/KhronosGroup/SPIRV-Tools/archive/refs/tags/
DISTFILES    = v$(GARVERSION).tar.gz
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
