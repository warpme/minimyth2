
GARNAME      = pvr.mythtv
# branch v22.2.2 @15.12.2025
GARVERSION   = 013c6976331e160cb9110d329bb52515f4f09321
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
