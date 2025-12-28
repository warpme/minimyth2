
GARNAME      = xscreensaver
GARVERSION   = 6.13
CATEGORIES   = X11
MASTER_SITES = http://www.jwz.org/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = 01-do-not-build-po.patch
PATCHFILES  += 02-stop-installing-xscreensaver-settings.patch
LICENSE      = MIT

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c xorg/xorg lib/libjpeg devel/zlib
BUILDDEPS = gtk/glib utils/bc

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes=$(DESTDIR)$(includedir) \
	--x-libraries=$(DESTDIR)$(libdir) \
	--disable-locking \
	--with-x \
	--with-hackdir=$(libexecdir)/xscreensaver \
	--with-configdir=$(datadir)/xscreensaver/config \
	--with-app-defaults=$(datadir)/xscreensaver/app-defaults \
	--without-gtk \
	--without-motif \
	--with-gl \
	--without-gle \
	--without-pixbuf \
	--with-jpeg \

INSTALL_ARGS   = \
	install_prefix=$(DESTDIR)

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(MAKECOOKIE)

configure-custom:
	@# by some reason configure returns always error so ignore it and return always no error....
	@cd $(WORKSRC); ./configure $(CONFIGURE_ARGS) || true
	@$(MAKECOOKIE)
