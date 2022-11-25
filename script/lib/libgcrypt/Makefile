GARNAME = libgcrypt
GARVERSION = 1.6.3
CATEGORIES = lib
MASTER_SITES = ftp://ftp.gnupg.org/gcrypt/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = \
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
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-asm \
	--with-gnu-ld

include ../../gar.mk

#CFLAGS   += -std=gnu89
#CXXFLAGS += -std=gnu89
#LDFLAGS  += -std=gnu89

pre-configure:
	@#$(call RUN_AUTOTOOLS)
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
