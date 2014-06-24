GARNAME = taglib
GARVERSION = 1.9.1
CATEGORIES = lib
MASTER_SITES = http://taglib.github.io/releases/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME).patch.gar
LICENSE = LGPL2_1
DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/cxx lib/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/cmake
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	-DCMAKE_INSTALL_PREFIX="$(prefix)" \
	-DCMAKE_FIND_ROOT_PATH="$(DESTDIR)$(prefix)" \
	-DCMAKE_VERBOSE_MAKEFILE="1" \
	\
	-DENABLE_STATIC="OFF" \
	-DBUILD_TESTS="OFF" \
	-DBUILD_EXAMPLES="OFF" \
	-DNO_ITUNES_HACKS="OFF" \
	-DWITH_ASF="ON" \
	-DWITH_MP4="ON"
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	-DCMAKE_SYSTEM_NAME="Linux" \
	-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="NEVER" \
	-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="ONLY" \
	-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="ONLY"
endif


include ../../gar.mk

configure-%/cmake: 
	@echo " ==> Running configure in $*"
	@cd $* && $(CONFIGURE_ENV) cmake $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(bindir)-config/taglib-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)taglib-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/taglib-config $(DESTDIR)$(bindir)-config/taglib-config
	@$(if $(compiler_prefix), ln -s taglib-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)taglib-config)
	@$(MAKECOOKIE)
