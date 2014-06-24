GARNAME = freetype
GARVERSION = 2.4.11
CATEGORIES = lib
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/$(GARNAME)2/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME).patch.gar
LICENSE = FTL/GPL2
FTL_LICENSE_TEXT = $(WORKSRC)/docs/FTL.TXT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/zlib utils/bzip2

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-biarch-config \
	--enable-mmap \
	--enable-shared \
	--disable-static \
	--with-zlib \
	--with-bzip2 \
	--without-old-mac-fonts \
	--without-fsspec \
	--without-fsref \
	--without-quickdraw-toolbox \
	--without-quickdraw-carbon \
	--without-ats \
	--with-gnu-ld

CONFIGURE_ENV  = \
	CC_BUILD="$(build_CC) $(build_CFLAGS)"

include ../../gar.mk

pre-configure:
	@cd $(WORKSRC)/builds/unix ; aclocal -I . --force
	@cd $(WORKSRC)/builds/unix ; libtoolize --force --copy --install
	@cd $(WORKSRC)/builds/unix ; autoconf --force
	@$(call FIX_LIBTOOL,$(WORKSRC)/builds/unix/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libfreetype.la
	@ln -sf freetype2/freetype $(DESTDIR)$(includedir)/freetype
	@rm -f $(DESTDIR)$(bindir)-config/freetype-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)freetype-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/freetype-config $(DESTDIR)$(bindir)-config/freetype-config
	@$(if $(compiler_prefix), ln -s freetype-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)freetype-config)
	@$(MAKECOOKIE)
