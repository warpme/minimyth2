
GARNAME      = libgpiod
GARVERSION   = 1.6.3
CATEGORIES   = system
MASTER_SITES = https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/snapshot/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \
	--enable-tools=yes \
	--enable-bindings-cxx \
	--disable-bindings-python \
	ac_cv_func_malloc_0_nonnull=yes \
	ac_cv_func_realloc_0_nonnull=yes \

include ../../gar.mk

pre-configure:
	@mkdir -p $(WORKSRC)/m4
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libgpiodcxx.la
	@rm -f $(DESTDIR)$(libdir)/libgpiodcxx.a
	@rm -f $(DESTDIR)$(libdir)/libgpiod.la
	@rm -f $(DESTDIR)$(libdir)/libgpiod.a
	@$(MAKECOOKIE)

clean-all: clean
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/libgpiodcxx.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/libgpiod.pc
	@rm -f $(DESTDIR)$(bindir)/gpioset
	@rm -f $(DESTDIR)$(bindir)/gpiomon
	@rm -f $(DESTDIR)$(bindir)/gpioinfo
	@rm -f $(DESTDIR)$(bindir)/gpioget
	@rm -f $(DESTDIR)$(bindir)/gpiofind
	@rm -f $(DESTDIR)$(bindir)/gpiodetect
