
GARNAME      = SPIRV-LLVM-Translator
# llvm_release_180 head@30.04.2024
GARVERSION   = 04175873d750583878f789f5d2c5e0dc355dc6dc
CATEGORIES   = lib
MASTER_SITES = https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      = GPL2

DEPENDS = devel/llvm lib/SPIRV-tools

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DLLVM_SPIRV_INCLUDE_TESTS=OFF \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR="$(DESTDIR)$(includedir)/spirv"

include ../../gar.mk

post-install:
	@cp -f $(WORKBLD)/tools/llvm-spirv/llvm-spirv $(DESTDIR)$(bindir)/
	@$(MAKECOOKIE)
