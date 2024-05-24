
GARNAME      = libclc
GARVERSION   = 16.0.6
CATEGORIES   = lib
MASTER_SITES = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(GARVERSION)/
DISTNAME     = $(GARNAME)-$(GARVERSION).src
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL

DEPENDS = devel/llvm

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk
