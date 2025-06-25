
GARNAME       = exiv2
# commit is for exiv2 v0.28.5 @ 21.02.2025
GARVERSION    = 907169fa643c2c74c14fd4106e55eaeee3634d9f
CATEGORIES    = lib
MASTER_SITES  = https://github.com/Exiv2/exiv2/archive/
DISTFILES     = $(GARVERSION).zip
LICENSE       = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/expat devel/zlib lib/libinih lib/libbrotlidec

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk

post-install:
	@patch -d $(DESTDIR)$(libdir)/cmake/exiv2 -p1 < $(WORKDIR)/../../files/exiv2-fix-installed-cmake-lists.patch
	@rm -f $(DESTDIR)$(libdir)/lib$(GARNAME).la
	@$(MAKECOOKIE)
