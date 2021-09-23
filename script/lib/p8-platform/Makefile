
GARNAME      = platform-p8-platform
GARVERSION   = 2.1.0.1
CATEGORIES   = lib
MASTER_SITES = https://github.com/Pulse-Eight/platform/archive/
DISTFILES    = p8-platform-$(GARVERSION).tar.gz
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/cxx

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS = $(DIRPATHS_CMAKE) \
	-DBUILD_SHARED_LIBS="1" \
	-DCMAKE_VERBOSE_MAKEFILE="1" \

ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	-DCMAKE_SYSTEM_NAME="Linux"
endif

include ../../gar.mk

post-install:
	@sed -e 's%/usr/%$(DESTDIR)/usr/%g' -i $(DESTDIR)/usr/lib/p8-platform/p8-platform-config.cmake
	@$(MAKECOOKIE)
