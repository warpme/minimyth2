
GARNAME      = crossguid
GARVERSION   = ca1bf4b810e2d188d04cb6286f957008ee1b7681
CATEGORIES   = lib
MASTER_SITES = https://github.com/graeme-hill/crossguid/archive/
DISTFILES    = $(GARVERSION).tar.gz
PATCHFILES   = fix-gcc15-compilation.patch
WORKSRC      = $(WORKDIR)/crossguid-$(GARVERSION)
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk

post-install:
	@sed -e "s|/usr/lib/libcrossguid.a|\$${CMAKE_SYSROOT}/usr/lib/libcrossguid.a|g" \
	  -i $(DESTDIR)/usr/share/crossguid/cmake/crossguid-config-release.cmake
	@$(MAKECOOKIE)
