
GARNAME = ffmpeg
CATEGORIES = lib

ifeq (1,1)
#--use this for mainline ffmpeg--------------------------
GARVERSION = 4.1.4
#GARVERSION = 4.0.2
MASTER_SITES = http://ffmpeg.org/releases/
DISTFILES = $(DISTNAME).tar.bz2
#PATCHFILES = ffmpeg-pkg_config.patch $(DISTNAME)-lrusak-v4l2.patch

#PATCHFILES += 0002-libavcodec-v4l2m2m-output-AVDRMFrameDescriptor.patch
#PATCHFILES += 0003-libavcodec-v4l2m2m-DRM-export-only-once.patch
#PATCHFILES += 0004-libavcodec-v4l2m2m-DRM-tidy-up-code.patch
#PATCHFILES += 0005-libavcodec-v4l2m2m-DRM-select-with-PIX_FMT.patch
#PATCHFILES += 0006-libavcodec-v4l2m2m-DRM-tidy-up-code.patch
#PATCHFILES += 0007-libavcodec-v4l2m2m-DRM-fix-bufref_drm.patch
#PATCHFILES += 0008-libavcodec-v4l2m2m-DRM-tidy-up-code.patch
#PATCHFILES += 0009-libavcodec-v4l2m2m-DRM-check-error-on-fd-close.patch
#PATCHFILES += 0010-libavcodec-v4l2m2m-dec-declare-HW-config.patch
#PATCHFILES += 0011-libavcodec-v4l2m2m-DRM-debug-information.patch
#PATCHFILES += 0012-libavcodec-v4l2m2m-fix-error-handling-during-buffer-.patch
#PATCHFILES += 0013-libavcodec-v4l2m2m-use-ff_get_format-callback-from-a.patch
#--------------------------------------------------------
endif

ifeq (1,0)
#--use this for current master ffmpeg--------------------
# https://github.com/FFmpeg/FFmpeg/commits/master
GITHASH = 6ca3d34ff8490fb1efa0cc3dc06b6bbb58151c53
GARVERSION = 20190930-$(GITHASH)
MASTER_SITES = https://github.com/FFmpeg/FFmpeg/archive/
DISTFILES = $(GITHASH).zip
WORKSRC   = $(WORKDIR)/FFmpeg-$(GITHASH)
#--------------------------------------------------------
endif

LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lib/fontconfig lib/libbluray lib/SDL devel/zlib net/librtmp utils/bzip2 X11/libva X11/libvdpau
BUILDDEPS = devel/yasm

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	--enable-logging \
	--fatal-warnings \
	--prefix=$(prefix) \
	--bindir=$(bindir) \
	--datadir=$(datadir)/ffmpeg \
	--libdir=$(libdir) \
	--shlibdir=$(libdir) \
	--incdir=$(includedir) \
	--mandir=$(mandir) \
	--enable-gpl \
	--disable-static \
	--enable-shared \
	$(if $(filter -Os,$(CFLAGS)),--enable-small) \
	--enable-runtime-cpudetect \
	--enable-ffmpeg \
	--enable-ffplay \
	--enable-doc \
	--enable-htmlpages \
	--enable-manpages \
	--enable-podpages \
	--enable-txtpages \
	--enable-avdevice \
	--enable-avcodec \
	--enable-avformat \
	--enable-avutil \
	--enable-swresample \
	--enable-swscale \
	--enable-postproc \
	--enable-avfilter \
	--enable-pthreads \
	--enable-network \
	--enable-lzo \
	--enable-mdct \
	--enable-rdft \
	--enable-fft \
	--enable-vaapi \
	--enable-vdpau \
	--enable-hwaccels \
	--enable-demuxers \
	--enable-parsers \
	--enable-bsfs \
	--enable-protocols \
	--enable-indevs \
	--enable-outdevs \
	--enable-filters \
	--enable-bzlib \
	--enable-zlib \
	--cross-prefix=$(compiler_prefix) \
	--enable-cross-compile \
	--sysroot="$(DESTDIR)$(rootdir)" \
	--sysinclude="$(DESTDIR)$(includedir)" \
	--target-os="linux" \
	--nm="$(NM)" \
	--ar="$(AR)" \
	--as="$(CC)" \
	--cc="$(CC)" \
	--cxx="$(CXX)" \
	--ld="$(CC)" \
	--host-cc="$(build_CC)" \
	--host-cflags="$(build_CFLAGS)" \
	--host-ld="$(build_CC)" \
	--host-ldflags="$(build_LDFLAGS)" \
	--host-os="linux" \
	--extra-cflags="$(CFLAGS)" \
	--extra-cxxflags="$(CXXFLAGS)" \
	--extra-ldflags="$(LDFLAGS)" \
	--extra-libs="" \
	--extra-version="" \
	--build-suffix="" \
	--progs-suffix="" \
	--arch=$(GARCH_FAMILY) \
	--enable-pic \
	--enable-safe-bitstream-reader \
	--disable-lto \
	--enable-asm \
	--enable-fast-unaligned \
	--enable-optimizations \
	--pkg-config="pkg-config" \
	--enable-v4l2-m2m \
	--enable-libdrm \

BUILD_ARGS     = \
	V='1'
INSTALL_ARGS   = \
	V='1'

GAR_EXTRA_CONF += mediaplayers/mplayer-svn/package-api.mk
include ../../gar.mk

# ffmpeg2.8.5 don't like gcc5.3.0 link-time optimizations
CFLAGS  := $(filter-out -flto, $(CFLAGS))
LDFLAGS := $(filter-out -flto, $(LDFLAGS))

clean-all:
	@$(MAKE) clean
	@rm -rf $(DESTDIR)$(includedir)/libavcodec
	@rm -rf $(DESTDIR)$(includedir)/libavdevice
	@rm -rf $(DESTDIR)$(includedir)/libavfilter
	@rm -rf $(DESTDIR)$(includedir)/libavformat
	@rm -rf $(DESTDIR)$(includedir)/libavutil
	@rm -rf $(DESTDIR)$(includedir)/libpostproc
	@rm -rf $(DESTDIR)$(includedir)/libswscale
	@rm -rf $(DESTDIR)$(libdir)/libavcodec.*
	@rm -rf $(DESTDIR)$(libdir)/libavdevice.*
	@rm -rf $(DESTDIR)$(libdir)/libavfilter.*
	@rm -rf $(DESTDIR)$(libdir)/libavformat.*
	@rm -rf $(DESTDIR)$(libdir)/libavutil.*
	@rm -rf $(DESTDIR)$(libdir)/libpostproc.*
	@rm -rf $(DESTDIR)$(libdir)/libswscale.*
	@rm -rf $(DESTDIR)$(datadir)/ffmpeg
	@rm -rf $(DESTDIR)$(bin)/ffmpeg
