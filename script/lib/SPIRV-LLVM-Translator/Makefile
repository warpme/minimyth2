
GARNAME      = SPIRV-LLVM-Translator
# v18.1.0
GARVERSION   = ad99707fd80189dca0ca76ed89946ae383e9a030
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

include ../../gar.mk

post-install:
	@cp -f $(WORKBLD)/tools/llvm-spirv/llvm-spirv $(DESTDIR)$(bindir)/
	@$(MAKECOOKIE)
