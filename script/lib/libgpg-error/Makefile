GARNAME = libgpg-error
GARVERSION = 1.10
CATEGORIES = lib
MASTER_SITES = ftp://ftp.gnupg.org/gcrypt/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME).patch.gar
LICENSE = GPL2/LGPL2_1

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
	--enable-nls \
	--disable-rpath \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@rm -f $(DESTDIR)$(bindir)-config/gpg-error-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)gpg-error-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/gpg-error-config $(DESTDIR)$(bindir)-config/gpg-error-config
	@$(if $(compiler_prefix), ln -sf gpg-error-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)gpg-error-config)
	@$(MAKECOOKIE)
	@$(MAKECOOKIE)
