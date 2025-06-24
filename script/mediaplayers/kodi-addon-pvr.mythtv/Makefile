
GARNAME      = pvr.mythtv
# branch v22.2.2 @12.06.2025
GARVERSION   = 373c821d01d1cd2fd7be77123fd7fe2adab4c389
CATEGORIES   = mediaplayers
MASTER_SITES = https://github.com/janbar/pvr.mythtv/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      = GPL2

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=$(datadir)/kodi/addons \
	-DCMAKE_MODULE_PATH=$(DESTDIR)$(datadir)/kodi/cmake \
	-DPACKAGE_ZIP=ON \
	-DKODI_INCLUDE_DIR=$(DESTDIR)$(includedir)/kodi \

include ../../gar.mk

clean-all:
	@rm -rf $(DESTDIR)$(datadir)/kodi/addons/pvr.mythtv
