
GARNAME      = libclc
GARVERSION   = $(LLVM_VERSION)
CATEGORIES   = lib
MASTER_SITES = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(GARVERSION)/
DISTNAME     = $(GARNAME)-$(GARVERSION).src
DISTFILES    = $(DISTNAME).tar.xz
PATCHFILES   = fix-standalone-build.patch
LICENSE      = GPL

DEPENDS = devel/llvm lib/SPIRV-LLVM-Translator

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DCMAKE_C_COMPILER_FORCED=ON \
	-DCMAKE_CXX_COMPILER_FORCED=ON \
	-DCMAKE_CLC_COMPILER_FORCED=ON \
	-DCMAKE_LLAsm_COMPILER_FORCED=ON \

GAR_EXTRA_CONF += devel/llvm/package-api.mk
include ../../gar.mk
