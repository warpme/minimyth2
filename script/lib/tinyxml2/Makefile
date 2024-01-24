
GARNAME      = tinyxml2
GARVERSION   = 10.0.0
CATEGORIES   = lib
MASTER_SITES = https://github.com/leethomason/tinyxml2/archive/refs/tags/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.txt

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DBUILD_SHARED_LIBS=ON \

include ../../gar.mk

post-install:
	@patch -d $(DESTDIR)$(libdir)/cmake/tinyxml2 -p1 < $(WORKDIR)/../../files/tinyxml2-fix-installed-cmake-lists.patch
	$(MAKECOOKIE)
