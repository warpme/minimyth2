
GARNAME      = fontconfig
GARVERSION   = 2.13.96
CATEGORIES   = lib
MASTER_SITES = http://www.fontconfig.org/release/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = fontconfig
fontconfig_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lib/libxml2 lib/freetype utils/gperf lib/libpng
BUILDDEPS = lib/freetype

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--enable-libxml2 \
	--disable-docs \
	--with-gnu-ld \
	--with-arch=$(GARCH) \
	--with-add-fonts=no

DEFAULT_ENV   = \
	CPP_FOR_BUILD="$(build_CPP)" \
	CC_FOR_BUILD="$(build_CC)" \
	CXX_FOR_BUILD="$(build_CXX)" \
	AR_FOR_BUILD="$(build_AR)" \
	AS_FOR_BUILD="$(build_AS)" \
	CPPFLAGS_FOR_BUILD="$(build_CPPFLAGS)" \
	CFLAGS_FOR_BUILD="$(build_CFLAGS)" \
	CXXFLAGS_FOR_BUILD="$(build_CXXFLAGS)" \
	LDFLAGS_FOR_BUILD="$(build_LDFLAGS)"
CONFIGURE_ENV = $(DEFAULT_ENV) ac_cv_prog_HASDOCBOOK='no'
BUILD_ENV     = $(DEFAULT_ENV)
INSTALL_ENV   = $(DEFAULT_ENV)

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

pre-install:
	@rm -rf $(DESTDIR)$(sysconfdir)/fonts
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libfontconfig.la
	@sed -i 's%-L$(DESTDIR)$(libdir)%-L$${libdir}%g' $(DESTDIR)$(libdir)/pkgconfig/fontconfig.pc
	@# Get rid of symlinks.
	@$(foreach file,$(notdir $(wildcard $(DESTDIR)$(datadir)/fontconfig/conf.avail/*.conf)), \
		rm -f $(DESTDIR)$(sysconfdir)/fonts/conf.d/$(file) ; \
		cp $(DESTDIR)$(datadir)/fontconfig/conf.avail/$(file) $(DESTDIR)$(sysconfdir)/fonts/conf.d/$(file) ; \
	)
	@$(MAKECOOKIE)
