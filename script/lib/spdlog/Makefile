
GARNAME      = spdlog
GARVERSION   = 1.15.3
CATEGORIES   = lib
MASTER_SITES = https://github.com/gabime/spdlog/archive/
DISTFILES    = v$(GARVERSION).tar.gz
LICENSE      = MIT

DEPENDS = lib/libfmt

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE=OFF \
	-DCMAKE_CXX_EXTENSIONS:BOOL=OFF \
	-DSPDLOG_BUILD_BENCH=OFF \
	-DSPDLOG_FMT_EXTERNAL=ON \
	-DSPDLOG_BUILD_SHARED=ON \
	-DSPDLOG_BUILD_TESTS=OFF \
	-DCMAKE_BUILD_TYPE=Release \

include ../../gar.mk

post-install:
	@patch -d $(DESTDIR)$(libdir)/cmake/spdlog -p1 < $(WORKDIR)/../../files/spdlog-fix-installed-cmake-lists.patch
	$(MAKECOOKIE)
