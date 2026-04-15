
GARNAME      = abseil-cpp
GARVERSION   = 20260107.1
CATEGORIES   = lib
MASTER_SITES = https://github.com/abseil/abseil-cpp/releases/download/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk

post-install:
	@sed -e "s|/usr|\$${CMAKE_SYSROOT}/usr|g" \
	  -i $(DESTDIR)/usr/lib/cmake/absl/absl*.cmake
	@$(MAKECOOKIE)
