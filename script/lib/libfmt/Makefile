
GARNAME      = fmt
GARVERSION   = 10.2.0
CATEGORIES   = lib
MASTER_SITES = https://github.com/fmtlib/fmt/archive/refs/tags/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = BSD

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE=OFF \
	-DCMAKE_CXX_EXTENSIONS:BOOL=OFF \
	-DFMT_DOC=OFF \
	-DFMT_INSTALL=ON \
	-DFMT_TEST=OFF \
	-DBUILD_SHARED_LIBS=ON \

include ../../gar.mk

post-install:
	@patch -d $(DESTDIR)$(libdir)/cmake/fmt -p1 < $(WORKDIR)/../../files/fmt-fix-installed-cmake-lists.patch
	$(MAKECOOKIE)
