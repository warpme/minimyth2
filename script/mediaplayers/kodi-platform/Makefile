
GARNAME      = kodi-platform
GARVERSION   = 809c5e9d711e378561440a896fcb7dbcd009eb3d
CATEGORIES   = mediaplayers
MASTER_SITES = https://github.com/xbmc/kodi-platform/archive/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = GPL

DEPENDS = lang/c lib/tinyxml

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DCMAKE_INSTALL_LIBDIR:STRING=lib \
	-DCMAKE_INSTALL_LIBDIR_NOARCH:STRING=lib \
	-DBUILD_SHARED_LIBS="OFF" \
	-DCMAKE_MODULE_PATH=$(DESTDIR)$(datadir)/kodi/cmake \

include ../../gar.mk

clean-all:
	@rm -f $(DESTDIR)$(libdir)/libkodiplatform.a
	@rm -f $(DESTDIR)$(includedir)/kodi/util/XMLUtils.h
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/kodiplatform.pc
	@rm -f $(DESTDIR)$(libdir)/kodiplatform/kodiplatform-config.cmake
