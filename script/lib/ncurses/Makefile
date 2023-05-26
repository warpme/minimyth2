
GARNAME      = ncurses
GARVERSION   = $(NCURSES_VERSION)
CATEGORIES   = lib
MASTER_SITES = https://ftp.gnu.org/pub/gnu/ncurses/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = MIT_Modified

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--without-cxx-binding \
	--without-ada \
	--with-manpages \
	--without-tests \
	--with-build-cc="$(build_CC)" \
	--with-build-cppflags="$(build_CPPFLAGS)" \
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
	--enable-overwrite \
	--disable-widec \
	--enable-termcap \
	--enable-pc-files \
	--with-pkg-config-libdir="$(libdir)/pkgconfig"
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--without-progs
endif

include ../../gar.mk

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@cd $(DESTDIR)$(libdir) && ln -sf libncurses.so libtermcap.so
	@rm -f $(DESTDIR)$(bindir)-config/ncurses6-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)ncurses6-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/ncurses6-config $(DESTDIR)$(bindir)-config/ncurses6-config
	@$(if $(compiler_prefix), ln -s ncurses6-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)ncurses6-config)
	@$(MAKECOOKIE)
