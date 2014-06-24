GARNAME = libpng
GARVERSION = 1.6.10
CATEGORIES = lib
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/$(GARNAME)16/$(GARVERSION)/
#http://sourceforge.net/projects/libpng/files/libpng16/1.6.10/libpng-1.6.10.tar.xz/download
DISTFILES  = $(DISTNAME).tar.xz
DISTFILES += config.cache.$(GARCH_FAMILY)
PATCHFILES = \
	$(DISTNAME).patch.gar
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--enable-shared \
	--disable-static \
	--disable-arm-neon \
	--with-gnu-ld

include ../../gar.mk

extract-config.cache.$(GARCH_FAMILY):
	@cp $(DOWNLOADDIR)/config.cache.$(GARCH_FAMILY) $(WORKSRC)/config.cache
	@$(MAKECOOKIE)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libpng16.la
	@rm -f $(DESTDIR)$(libdir)/libpng.la
	@rm -f $(DESTDIR)$(bindir)-config/libpng16-config
	@rm -f $(DESTDIR)$(bindir)-config/libpng-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)libpng16-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)libpng-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/libpng16-config $(DESTDIR)$(bindir)-config/libpng16-config
	@mv $(DESTDIR)$(bindir)/libpng-config $(DESTDIR)$(bindir)-config/libpng-config
	@$(if $(compiler_prefix), ln -s libpng16-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)libpng16-config)
	@$(if $(compiler_prefix), ln -s libpng-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)libpng-config)
	@$(MAKECOOKIE)
