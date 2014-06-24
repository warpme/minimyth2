GARNAME = a52dec
GARVERSION = 0.7.4
CATEGORIES = lib
MASTER_SITES = http://liba52.sourceforge.net/files/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = \
	$(DISTNAME)-automake_1.13.patch \
	$(DISTNAME)-fpic.patch
LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile a52_internal_h

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--disable-double \
	--disable-djbfft \
	--disable-oss \
	--disable-solaris-audio \
	--disable-al-audio \
	--disable-win \
	--disable-warnings \
	--disable-gprof \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

# Needed by xine-lib.
install-a52_internal_h:
	@mkdir -p $(DESTDIR)$(includedir)/a52dec
	@rm -f $(DESTDIR)$(includedir)/a52dec/a52_internal.h
	@cp -f $(WORKSRC)/liba52/a52_internal.h $(DESTDIR)$(includedir)/a52dec
	@$(MAKECOOKIE)


post-install:
	@rm -f $(DESTDIR)$(libdir)/liba52.la
	@$(MAKECOOKIE)
