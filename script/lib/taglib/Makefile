
GARNAME      = taglib
GARVERSION   = 1.12
CATEGORIES   = lib
MASTER_SITES = http://taglib.github.io/releases/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = $(DISTNAME).patch.gar
LICENSE      = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/cxx devel/zlib

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DBUILD_SHARED_LIBS="ON" \
	-DBUILD_TESTS="OFF" \
	-DBUILD_EXAMPLES="OFF" \
	-DNO_ITUNES_HACKS="OFF" \
	-DWITH_ASF="ON" \
	-DWITH_MP4="ON"

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(bindir)-config/taglib-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)taglib-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/taglib-config $(DESTDIR)$(bindir)-config/taglib-config
	@$(if $(compiler_prefix), ln -s taglib-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)taglib-config)
	@$(MAKECOOKIE)
