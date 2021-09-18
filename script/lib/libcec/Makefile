
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

CONFIGURE_ARGS = $(DIRPATHS_CMAKE) \
	-DBUILD_SHARED_LIBS=1 \
	-DHAVE_AOCEC_API=0 \
	-DHAVE_LINUX_API=1 \
	-DCMAKE_VERBOSE_MAKEFILE=0 \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(bindir)/cec-client
	@mv -f $(DESTDIR)$(bindir)/cec-client-$(GARVERSION) $(DESTDIR)$(bindir)/cec-client
	@$(MAKECOOKIE)
