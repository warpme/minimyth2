
GARNAME      = re2
GARVERSION   = 2025-11-05
CATEGORIES   = lib
MASTER_SITES = https://github.com/google/re2/releases/download/2025-11-05/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = BSD

DEPENDS = lang/c lib/abseil-cpp

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DCMAKE_POSITION_INDEPENDENT_CODE=ON \

include ../../gar.mk

CXXFLAGS += -ftls-model=global-dynamic

post-install:
	@sed -e "s|/usr|\$${CMAKE_SYSROOT}/usr|g" \
	  -i $(DESTDIR)/usr/lib/cmake/re2/re2*.cmake
	@$(MAKECOOKIE)
