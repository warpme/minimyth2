
GARNAME       = exiv2
# commit is for exiv2 v0.27.2
GARVERSION    = 70f9405fafbe19c7bab94b36a1267c4332dc8a8a
CATEGORIES    = lib
MASTER_SITES  = https://github.com/Exiv2/exiv2/archive/
DISTFILES     = $(GARVERSION).zip
LICENSE       = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/expat devel/zlib

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
