GARNAME = SDL2
GARVERSION = 2.0.7
CATEGORIES = lib
MASTER_SITES = http://www.libsdl.org/release/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME).patch.gar

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c lib/alsa-lib xorg/xorg
BUILDDEPS = devel/nasm

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

# Compile with static libraries enabled because SDL 2.0.3 fails to compile without static libraries enabled.
CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes=$(DESTDIR)$(includedir) \
	--x-libraries=$(DESTDIR)$(libdir) \
	--enable-shared \
	--enable-static \
	--enable-assertions="auto" \
	--enable-libc \
	--enable-gcc-atomics \
	--enable-atomic \
	--enable-audio \
	--enable-video \
	--enable-render \
	--enable-events \
	--enable-joystick \
	--enable-haptic \
	--enable-power \
	--enable-filesystem \
	--enable-threads \
	--enable-timers \
	--enable-file \
	--enable-loadso \
	--enable-cpuinfo \
	--enable-assembly \
	--disable-ssemath \
	--enable-mmx \
	--enable-3dnow \
	--enable-sse \
	--disable-sse2 \
	--disable-altivec \
	--disable-oss \
	--enable-alsa \
	--enable-alsatest \
	--enable-alsa-shared \
	--disable-esd \
	--disable-esdtest \
	--disable-esd-shared \
	--disable-pulseaudio \
	--disable-pulseaudio-shared \
	--disable-arts \
	--disable-arts-shared \
	--disable-nas \
	--disable-nas-shared \
	--disable-sndio \
	--disable-sndio-shared \
	--disable-diskaudio \
	--disable-dummyaudio \
	--disable-video-wayland \
	--disable-video-wayland-qt-touch \
	--disable-wayland-shared \
	--disable-video-mir \
	--disable-mir-shared \
	--enable-video-x11 \
	--enable-x11-shared \
	--enable-video-x11-xcursor \
	--enable-video-x11-xinerama \
	--enable-video-x11-xinput \
	--enable-video-x11-xrandr \
	--disable-video-x11-scrnsaver \
	--enable-video-x11-xshape \
	--enable-video-x11-vm \
	--disable-video-cocoa \
	--disable-video-directfb \
	--disable-directfb-shared \
	--disable-fusionsound \
	--disable-fusionsound-shared \
	--enable-video-dummy \
	--enable-video-opengl \
	--disable-video-opengles \
	--disable-libudev \
  	--disable-dbus \
	--disable-input-tslib \
	--enable-pthreads \
	--enable-pthread-sem \
	--disable-directx \
	--enable-sdl-dlopen \
	--disable-clock_gettime \
	--disable-rpath \
	--with-gnu-ld \
	--with-x

include ../../gar.mk

pre-configure:
	@cd $(WORKSRC) ; rm -rf acinclude~
	@cd $(WORKSRC) ; mkdir -p acinclude~
	@cd $(WORKSRC) ; mv acinclude/esd.m4 acinclude~
	@cd $(WORKSRC) ; rm -rf acinclude
	@cd $(WORKSRC) ; mv acinclude~ acinclude
	@cd $(WORKSRC) ; rm -f aclocal.m4
	@cd $(WORKSRC) ; touch AUTHORS
	@cd $(WORKSRC) ; touch ChangeLog
	@cd $(WORKSRC) ; touch COPYING
	@cd $(WORKSRC) ; touch INSTALL
	@cd $(WORKSRC) ; touch NEWS
	@cd $(WORKSRC) ; touch README
	@# Skip autoheader because there is a problem with AC_DEFINE's in the configure.in of SDL 2.0.3.
	@# Add include directory 'acinclude' because SDL 2.0.3 has no Makefile.am in which to specify it.
	@$(call RUN_AUTOTOOLS, \
		cd $(WORKSRC) ; \
		AUTOHEADER="true" autoreconf --verbose --install --force -I $(DESTDIR)$(datadir)/aclocal -I acinclude)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libSDL2.la
	@rm -f $(DESTDIR)$(libdir)/libSDL2.a
	@rm -f $(DESTDIR)$(libdir)/libSDL2main.a
	@rm -f $(DESTDIR)$(libdir)/libSDL2_test.a
	@rm -f $(DESTDIR)$(bindir)-config/sdl2-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)sdl2-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/sdl2-config $(DESTDIR)$(bindir)-config/sdl2-config
	@$(if $(compiler_prefix), ln -s sdl2-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)sdl2-config)
	@$(MAKECOOKIE)
