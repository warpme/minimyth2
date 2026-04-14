
GARNAME      = libwebp
GARVERSION   = 1.6.0
CATEGORIES   = lib
MASTER_SITES = https://storage.googleapis.com/downloads.webmproject.org/releases/webp/
DISTFILES    = $(DISTNAME).tar.gz

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk

post-install:
	@sed -e "s|/usr|\$${CMAKE_SYSROOT}/usr|g" \
	  -i $(DESTDIR)/usr/share/WebP/cmake/WebPTargets*.cmake
	@$(MAKECOOKIE)
