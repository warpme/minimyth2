GARNAME = xosd
GARVERSION = 2.2.14
CATEGORIES = X11
MASTER_SITES = http://ignavus.net/
MASTER_SITES = http://downloads.sourceforge.net/project/libxosd/libxosd/$(DISTNAME)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-destdir.patch $(DISTNAME)-dash.patch $(DISTNAME)-libxosd_m4.patch $(DISTNAME)-defaults.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c xorg/xorg

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes=$(DESTDIR)$(includedir) \
	--x-libraries=$(DESTDIR)$(libdir) \
	--enable-shared \
	--disable-static \
	--disable-gtktest \
	--enable-xinerama \
	--disable-gdk_pixbuftest \
	--disable-new-plugin \
	--disable-beep_media_player_plugin \
	--disable-old-plugin \
	--with-gnu-ld \
	--with-x

CONFIGURE_ENV = \
	GTK_CONFIG="no"

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

post-install:
	@rm -f $(DESTDIR)$(libdir)/libxosd.la
	@rm -f $(DESTDIR)$(bindir)-config/xosd-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)xosd-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/xosd-config $(DESTDIR)$(bindir)-config/xosd-config
	@$(if $(compiler_prefix), ln -s xosd-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)xosd-config)
	@$(MAKECOOKIE)
