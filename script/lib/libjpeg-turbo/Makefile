
GARNAME      = libjpeg-turbo
GARVERSION   = 3.1.4.1
CATEGORIES   = lib
MASTER_SITES = https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/
DISTFILES    = $(GARVERSION).tar.gz

LICENSE = jpeg
jpeg_LICENSE_TEXT = $(WORKSRC)/LICENSE.md
DESCRIPTION = 

define BLURB
endef

DEPENDS = lang/c devel/yasm

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libjpeg.la
	@rm -f $(DESTDIR)$(libdir)/libturbojpeg.la
	@$(MAKECOOKIE)
