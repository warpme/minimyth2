
GARNAME      = polkit
GARVERSION   = 0.102
CATEGORIES   = lib
MASTER_SITES =  http://www.freedesktop.org/software/polkit/releases/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = $(DISTNAME)-cross_compile.patch
PATCHFILES  += add_aarch64_detection.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/pam

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--disable-man-pages \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-gtk-doc-pdf \
	--disable-introspection \
	--disable-examples \
	--disable-nls

include ../../gar.mk

post-configure:
	@# hack to fix failed build due double pipe in nm commnds
	@sed -e 's%| \\$$global_symbol_pipe%\\$$global_symbol_pipe%g' -i $(WORKSRC)/libtool
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libpolkit-gobject-1.la
	@rm -f $(DESTDIR)$(libdir)/libpolkit-agent-1.la
	@rm -f $(DESTDIR)$(libdir)/libpolkit-backend-1.la
	@rm -f $(DESTDIR)$(libdir)/polkit-1/extensions/libnullbackend.la
	@$(MAKECOOKIE)
