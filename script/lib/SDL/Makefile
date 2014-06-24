GARNAME = SDL
GARVERSION = 1.2.15
CATEGORIES = lib
MASTER_SITES = http://www.libsdl.org/release/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-configure.patch $(DISTNAME).patch.gar
LICENSE = LGPL2_1

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c lib/alsa-lib xorg/xorg
BUILDDEPS = devel/nasm

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes=$(DESTDIR)$(includedir) \
	--x-libraries=$(DESTDIR)$(libdir) \
	--enable-shared \
	--disable-static \
	--enable-libc \
	--enable-audio \
	--enable-video \
	--enable-events \
	--enable-joystick \
	--disable-cdrom \
	--enable-threads \
	--enable-timers \
	--enable-file \
	--enable-loadso \
	--enable-cpuinfo \
	--enable-assembly \
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
	--disable-diskaudio \
	--disable-dummyaudio \
	--disable-mintaudio \
	--enable-nasm \
	--disable-altivec \
	--disable-ipod \
	--disable-video-nanox \
	--disable-nanox-debug \
	--disable-nanox-share-memory \
	--disable-nanox-direct-fb \
	--enable-video-x11 \
	--enable-x11-shared \
	--disable-dga \
	--disable-video-dga \
	--disable-video-x11-dgamouse \
	--enable-video-x11-vm \
	--enable-video-x11-xv \
	--enable-video-x11-xinerama \
	--disable-video-x11-xme \
	--enable-video-x11-xrandr \
	--disable-video-photon \
	--disable-video-carbon \
	--disable-video-cocoa \
	--disable-video-fbcon \
	--disable-video-directfb \
	--disable-video-ps2gs \
	--disable-video-ps3 \
	--disable-video-ggi \
	--disable-video-svga \
	--disable-video-vgl \
	--enable-video-wscons \
	--disable-video-aalib \
	--disable-video-caca \
	--disable-video-qtopia \
	--disable-video-picogui \
	--disable-xbios \
	--disable-gem \
	--disable-video-dummy \
	--enable-video-opengl \
	--enable-osmesa-shared \
	--enable-screensaver \
	--enable-input-events \
	--disable-input-tslib \
	--enable-pth \
	--enable-pthreads \
	--enable-pthread-sem \
	--disable-stdio-redirect \
	--disable-directx \
	--enable-sdl-dlopen \
	--disable-atari-ldg \
	--disable-clock_gettime \
	--disable-rpath \
	--with-gnu-ld \
	--with-x

include ../../gar.mk

pre-configure:
	@cd $(WORKSRC) ; rm -f acinclude/alsa.m4
	@# Skip autoheader because there is a problem with AC_DEFINE's in the configure.in of SDL 1.2.15.
	@# Add include directory 'acinclude' because SDL 1.2.15 has no Makefile.am in which to specify it.
	@$(call RUN_AUTOTOOLS, \
		cd $(WORKSRC) ; \
		AUTOHEADER="true" autoreconf --verbose --install --force -I $(DESTDIR)$(datadir)/aclocal -I acinclude)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libSDLmain.la
	@rm -f $(DESTDIR)$(libdir)/libSDL.la
	@rm -f $(DESTDIR)$(bindir)-config/sdl-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)sdl-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/sdl-config $(DESTDIR)$(bindir)-config/sdl-config
	@$(if $(compiler_prefix), ln -s sdl-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)sdl-config)
	@$(MAKECOOKIE)
