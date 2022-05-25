
GARNAME    = ncursesw
GARVERSION = $(NCURSES_VERSION)
CATEGORIES = lib
SOURCEPKG  = lib/ncurses
LICENSE    = MIT_Modified

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

WORKSRC = $(WORKDIR)/ncurses-$(GARVERSION)

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--without-cxx-binding \
	--without-ada \
	--with-manpages \
	--without-tests \
	--with-build-cc="$(build_CC)" \
	--with-build-cppflags="$(build_CPPFLAGS) -include wchar.h" \
	--with-build-cflags="$(build_CFLAGS)" \
	--with-build-ldflags="$(build_LDFLAGS)" \
	--with-build-libs="" \
	--with-shared \
	--without-normal \
	--without-debug \
	--without-profile \
	--disable-rpath \
	--disable-relink \
	--disable-rpath-hack \
	--disable-overwrite \
	--enable-widec \
	--with-tic-path="$(build_DESTDIR)$(build_bindir)/tic" \
	--disable-stripping \
	--with-versioned-syms \

GAR_EXTRA_CONF += lib/ncurses/package-api.mk
include ../../gar.mk

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(bindir)-config/ncursesw6-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)ncursesw6-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/ncursesw6-config $(DESTDIR)$(bindir)-config/ncursesw6-config
	@$(if $(compiler_prefix), ln -s ncursesw6-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)ncursesw6-config)
	@mkdir -p $(DESTDIR)$(includedir)/ncursesw/ncursesw
	@cp -rf $(DESTDIR)$(includedir)/ncursesw/*.h $(DESTDIR)$(includedir)/ncursesw/ncursesw/
	@$(MAKECOOKIE)
