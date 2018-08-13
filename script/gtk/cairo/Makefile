GARNAME = cairo
GARVERSION = 1.14.2
CATEGORIES = gtk
MASTER_SITES = http://www.cairographics.org/releases/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = LGPL2_1

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c gtk/glib lib/fontconfig lib/freetype lib/libpng xorg/xorg

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes="$(DESTDIR)$(includedir)" \
	--x-libraries="$(DESTDIR)$(libdir)" \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-gtk-doc \
	--enable-largefile \
	--enable-atomic \
	--disable-gcov \
	--disable-valgrind \
	--enable-xlib \
	--enable-xlib-xrender \
	--disable-xcb \
	--disable-xlib-xcb \
	--disable-xcb-shm \
	--disable-qt \
	--disable-quartz \
	--disable-quartz-font \
	--disable-quartz-image \
	--disable-win32 \
	--disable-win32-font \
	--disable-skia \
	--disable-os2 \
	--disable-beos \
	--disable-drm \
	--disable-drm-xr \
	--disable-gallium \
	--disable-xcb-drm \
	--enable-png \
	--enable-gl \
	--disable-glesv2 \
	--disable-cogl \
	--disable-directfb \
	--disable-vg \
	--disable-egl \
	--enable-glx \
	--disable-wgl \
	--disable-script \
	--enable-ft \
	--enable-fc \
	--enable-ps \
	--enable-pdf \
	--enable-svg \
	--disable-test-surfaces \
	--disable-tee \
	--disable-xml \
	--enable-pthread \
	--enable-gobject \
	--disable-full-testing \
	--disable-trace \
	--enable-interpreter \
	--disable-symbol-lookup \
	--enable-some-floating-point \
	--with-gnu-ld \
	--with-x

include ../../gar.mk

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libcairo.la
	@rm -rf $(DESTDIR)$(libdir)/libcairo-gobject.la
	@rm -rf $(DESTDIR)$(libdir)/libcairo-script-interpreter.la
	@$(MAKECOOKIE)
