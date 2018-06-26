GARNAME = libffi
GARVERSION = 3.2.1
CATEGORIES = lib
MASTER_SITES = ftp://sourceware.org/pub/$(GARNAME)/
DISTFILES  = $(DISTNAME).tar.gz
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--disable-debug \
	--enable-structs \
	--enable-raw-api \
	--disable-purify-safety \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@if [ -e $(DESTDIR)/usr/lib64/libffi.so.6 ] ; then    \
	 rm $(DESTDIR)$(libdir)/libffi.so.6 ; \
	 ln -sr $(DESTDIR)/usr/lib64/libffi.so.6 $(DESTDIR)$(libdir)/libffi.so.6 ; \
	 fi
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@#rm -f $(DESTDIR)$(libdir64)/$(GARNAME).la
	@rm -f $(DESTDIR)/usr/lib64/$(GARNAME).la
	@$(MAKECOOKIE)
