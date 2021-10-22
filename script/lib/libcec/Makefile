
GARNAME      = libcec-libcec
GARVERSION   = 6.0.2
CATEGORIES   = lib
MASTER_SITES = https://github.com/Pulse-Eight/libcec/archive/
DISTFILES    = libcec-$(GARVERSION).tar.gz
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/cxx lib/lockdev lib/platform lib/p8-platform system/eudev xorg/xorg

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DBUILD_SHARED_LIBS=ON \
	-DHAVE_AOCEC_API=OFF \
	-DHAVE_LINUX_API=ON \
	-DCMAKE_VERBOSE_MAKEFILE=OFF \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(bindir)/cec-client
	@mv -f $(DESTDIR)$(bindir)/cec-client-$(GARVERSION) $(DESTDIR)$(bindir)/cec-client
	@$(MAKECOOKIE)
