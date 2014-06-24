GARNAME = xine-lib
GARVERSION = 1.2.2
CATEGORIES = mediaplayers
MASTER_SITES = http://downloads.sourceforge.net/project/xine/$(GARNAME)/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2/LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/alsa-lib lib/faad2 lib/ffmpeg lib/freetype lib/libbluray lib/libcdio lib/libdca lib/libdvdnav lib/libmad lib/libmng lib/libpng lib/vcdimager lib/zlib X11/libvdpau xorg/xorg

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

# Linux is only used for dha-kmod, which is disabled.
# Therefore, --with-linux-path is set to '/dev/null'.
CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes="$(DESTDIR)$(includedir)" \
	--x-libraries="$(DESTDIR)$(libdir)" \
	--disable-silent-rules \
	--disable-debug \
	--disable-profiling \
	--disable-ipv6 \
	--enable-antialiasing \
	--disable-macosx-universal \
	--disable-static \
	--enable-shared \
	--disable-rpath \
	--enable-iconvtest \
	--enable-nls \
	--disable-altivec \
	--disable-vis \
	--enable-optimizations \
	--disable-mmap \
	--enable-largefile \
	--disable-coreaudio \
	--disable-irixal \
	--disable-oss \
	--disable-sunaudio \
	--disable-sndio \
	--disable-aalib \
	--disable-dha-kmod \
	--disable-directfb \
	--disable-dxr3 \
	--disable-fb \
	--disable-macosx-video \
	--enable-opengl \
	--enable-glu \
	--disable-vidix \
	--enable-xinerama \
	--disable-static-xv \
	--enable-xvmc \
	--enable-vdpau \
	--disable-dvb \
	--disable-gnomevfs \
	--disable-samba \
	--disable-v4l \
	--disable-v4l2 \
	--disable-libv4l \
	--enable-vcd \
	--disable-vdr \
	--enable-bluray \
	--enable-a52dec \
	--enable-asf \
	--enable-nosefart \
	--enable-faad \
	--disable-gdkpixbuf \
	--enable-dts \
	--enable-mad \
	--disable-modplug \
	--disable-libmpeg2new \
	--disable-musepack \
	--disable-mlib \
	--disable-mlib-lazyload \
	--enable-mng \
	--enable-real-codecs \
	$(if $(filter i386,$(GARCH_FAMILY)),--enable-w32dll,--disable-w32dll) \
	--with-gnu-ld \
	--without-libiconv-prefix \
	--without-libintl-prefix \
	--without-external-libxdg-basedir \
	--without-zlib-prefix \
	--with-freetype \
	--with-fontconfig \
	--with-x \
	--with-alsa \
	--without-esound \
	--without-fusionsound \
	--without-jack \
	--without-pulseaudio \
	--with-aalib-prefix="$(DESTDIR)$(prefix)" \
	--with-aalib-exec-prefix="$(DESTDIR)$(exec_prefix)" \
	--without-caca \
	--with-linux-path="/dev/null" \
	--without-dxheaders \
	--with-libfame-prefix="$(DESTDIR)$(prefix)" \
	--with-libfame-exec-prefix="$(DESTDIR)$(exec_prefix)" \
	--without-libstk \
	--without-sdl \
	--with-xcb \
	--with-xv-path="$(DESTDIR)$(libdir)" \
	--with-xvmc-path="$(DESTDIR)$(libdir)" \
	--with-external-dvdnav \
	--without-imagemagick \
	--without-libflac \
	--without-speex \
	--without-theora \
	--without-vorbis \
	--with-real-codecs-path="$(libdir)/codecs" \
	--with-w32-path="$(libdir)/codecs" \
	--without-wavpack

CONFIGURE_ENV = \
	MAGIC_CMD="$(build_DESTDIR)$(build_bindir)/file"
BUILD_ENV     = \
	V="1"
INSTALL_ENV   = \
	V="1"

include ../../gar.mk

# xine-lib 1.2.2 fails to compile with -Os.
CFLAGS  := $(if $(filter -Os, $(CFLAGS)), $(filter-out -Os, $(CFLAGS)) -O1)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libxine.la
	@rm -f $(DESTDIR)$(libdir)/libxine-interface.la
	@rm -f $(DESTDIR)$(bindir)-config/xine-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)xine-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/xine-config $(DESTDIR)$(bindir)-config/xine-config
	@$(if $(compiler_prefix), ln -s xine-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)xine-config)
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) -C ../xine-ui clean-all
