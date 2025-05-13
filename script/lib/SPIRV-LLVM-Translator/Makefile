
GARNAME      = SPIRV-LLVM-Translator
# v20.1.2 @10.04.2025
GARVERSION   = 6dd8f2a1681a27f16c53d932d2765920f312aeb2
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
