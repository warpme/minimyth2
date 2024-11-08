
GARNAME       = exiv2
# commit is for exiv2 v0.28.3 @ 8.07.2024
GARVERSION    = a6a79ef064f131ffd03c110acce2d3edb84ffa2e
CATEGORIES    = lib
MASTER_SITES  = https://github.com/Exiv2/exiv2/archive/
DISTFILES     = $(GARVERSION).zip
LICENSE       = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/expat devel/zlib lib/libinih

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/lib$(GARNAME).la
	@$(MAKECOOKIE)
