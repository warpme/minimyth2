GARNAME = libgcrypt
GARVERSION = 1.5.0
CATEGORIES = lib
MASTER_SITES = ftp://ftp.gnupg.org/gcrypt/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = \
	$(DISTNAME)-automake_1.13.patch \
	$(DISTNAME)-gpg_error_libs.patch \
	$(DISTNAME).patch.gar
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libgpg-error

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--disable-asm \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@rm -f $(DESTDIR)$(bindir)-config/libgcrypt-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)libgcrypt-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/libgcrypt-config $(DESTDIR)$(bindir)-config/libgcrypt-config
	@$(if $(compiler_prefix), ln -sf libgcrypt-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)libgcrypt-config)
	@$(MAKECOOKIE)
	@$(MAKECOOKIE)
