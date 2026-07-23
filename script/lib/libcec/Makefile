
GARNAME      = libcec-libcec
GARVERSION   = 8.0.0
CATEGORIES   = lib
MASTER_SITES = https://github.com/Pulse-Eight/libcec/archive/
DISTFILES    = libcec-$(GARVERSION).tar.gz
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/cxx system/eudev

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DBUILD_SHARED_LIBS=ON \
	-DHAVE_AOCEC_API=OFF \
	-DHAVE_LINUX_API=ON \
	-DCMAKE_VERBOSE_MAKEFILE=OFF \
	-DCMAKE_INSTALL_LIBDIR=$(libdir) \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(bindir)/cec-client
	@mv -f $(DESTDIR)$(bindir)/cec-client-$(GARVERSION) $(DESTDIR)$(bindir)/cec-client
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(bindir)/cec-client
	@rm -rf $(DESTDIR)$(bindir)/cecc-client
	@rm -rf $(DESTDIR)$(libdir)/libcec.so*
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libcec.pc
	@rm -rf $(DESTDIR)$(includedir)/libcec*
