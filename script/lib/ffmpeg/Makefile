
GARNAME = ffmpeg
CATEGORIES = lib

ifeq (1,0)
#--use this for mainline ffmpeg--------------------------
# GARVERSION = 4.1.4
GARVERSION = 4.0.2
MASTER_SITES = http://ffmpeg.org/releases/
DISTFILES = $(DISTNAME).tar.bz2
#--------------------------------------------------------
endif

ifeq (1,1)
#--use this for jernejsk v4l2-request-hwaccel-4.0.4  ----
# https://github.com/FFmpeg/FFmpeg/commits/master
GITHASH = a810e91ff5925da4c1ebce1eddbd7498d733c631
GARVERSION = 20191202-$(GITHASH)
MASTER_SITES = https://github.com/jernejsk/FFmpeg/archive/
DISTFILES = $(GITHASH).zip
WORKSRC   = $(WORKDIR)/FFmpeg-$(GITHASH)
#--------------------------------------------------------
endif

ifeq (1,0)
#--use this for current master ffmpeg--------------------
# https://github.com/FFmpeg/FFmpeg/commits/master
GITHASH = 637742b45dc8df329b8593f6ad8f4e154d609415
GARVERSION = 20191202-$(GITHASH)
MASTER_SITES = https://github.com/FFmpeg/FFmpeg/archive/
DISTFILES = $(GITHASH).zip
WORKSRC   = $(WORKDIR)/FFmpeg-$(GITHASH)

PATCHFILES += 0000-avutil-add-av_buffer_pool_flush.patch
PATCHFILES += 0001-Add-common-V4L2-request-API-code.patch
PATCHFILES += 0002-Add-V4L2-request-API-mpeg2-hwaccel.patch
PATCHFILES += 0003-Add-V4L2-request-API-h264-hwaccel.patch
PATCHFILES += 0004-Add-V4L2-request-API-hevc-hwaccel.patch
PATCHFILES += 0005-Add-V4L2-request-API-vp8-hwaccel.patch
PATCHFILES += 0006-Add-and-use-private-linux-headers-for-V4L2-request-A.patch
PATCHFILES += 0007-hwcontext_drm-do-not-require-drm-device.patch
PATCHFILES += 0008-avcodec-h264-parse-idr_pic_id.patch
PATCHFILES += 0009-avcodec-h264-parse-ref_pic_marking_size_in_bits-and-.patch
PATCHFILES += 0010-HACK-add-dpb-flags-for-reference-usage-and-field-pic.patch
PATCHFILES += 0011-WIP-v4l2-request-rolling-timestamps.patch

#--------------------------------------------------------
endif

ifeq (0,1)
#--use this for kodi ffmpeg------------------------------
# https://github.com/xbmc/FFmpeg/archive/4.0.4-Leia-18.4.tar.gz
GARVERSION = 4.0.4-Leia-18.4
MASTER_SITES = https://github.com/xbmc/FFmpeg/archive/
DISTFILES = $(GARVERSION).tar.gz
WORKSRC   = $(WORKDIR)/FFmpeg-$(GARVERSION)

PATCHFILES += kodi_18.4-95.0001-avutil-add-av_buffer_pool_flush.patch
PATCHFILES += kodi_18.4-95.0002-Add-common-V4L2-request-API-code.patch
PATCHFILES += kodi_18.4-95.0003-Add-V4L2-request-API-mpeg2-hwaccel.patch
PATCHFILES += kodi_18.4-95.0004-Add-V4L2-request-API-h264-hwaccel.patch
PATCHFILES += kodi_18.4-95.0005-Add-V4L2-request-API-hevc-hwaccel.patch
PATCHFILES += kodi_18.4-95.0006-Add-V4L2-request-API-vp8-hwaccel.patch
PATCHFILES += kodi_18.4-95.0007-Add-and-use-private-linux-headers-for-V4L2-request-A.patch
PATCHFILES += kodi_18.4-95.0008-hwcontext_drm-do-not-require-drm-device.patch
PATCHFILES += kodi_18.4-95.0009-avcodec-h264-parse-idr_pic_id.patch
PATCHFILES += kodi_18.4-95.0010-avcodec-h264-parse-ref_pic_marking_size_in_bits-and-.patch
PATCHFILES += kodi_18.4-95.0011-HACK-add-dpb-flags-for-reference-usage-and-field-pic.patch
PATCHFILES += kodi_18.4-99.1001-Call-get_format-to-fix-an-issue-with-MMAL-ren.patch
PATCHFILES += kodi_18.4-99.1002-mpeg4video-Signal-unsupported-GMC-with-more-than-one.patch
PATCHFILES += kodi_18.4-99.1003-pfcd_hevc_optimisations.patch
PATCHFILES += kodi_18.4-99.1004-added_upstream_mvc_patches.patch
PATCHFILES += kodi_18.4-99.1005-rkmppdec-Kodi-need-more-buffers.patch
PATCHFILES += kodi_18.4-99.1006-rkmppdec-continue-on-errinfo-frame.patch
PATCHFILES += kodi_18.4-99.1007-rkmppdec-enable-mpeg2.patch
PATCHFILES += kodi_18.4-99.1008-dav1d-enable-av1.patch
PATCHFILES += kodi_18.4-99.1009-dav1d-fix-multithreaded-av1-sw-decoding.patch
PATCHFILES += kodi_18.4-99.1010-rkmppdec-set-mastering-display-and-content-light-sid.patch
PATCHFILES += kodi_18.4-99.1010-yuv2rgb-logspam.patch
PATCHFILES += kodi_18.4-999-aspect-ratio.patch
PATCHFILES += kodi_18.4-999-lrusak-v4l2.patch
PATCHFILES += kodi_18.4-999-min-buffers.patch
PATCHFILES += kodi_18.4-999-z-fixes.patch
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
	--enable-libudev \
	--enable-v4l2-request \

BUILD_ARGS     = \
	V='1'
INSTALL_ARGS   = \
	V='1'

GAR_EXTRA_CONF += mediaplayers/mplayer-svn/package-api.mk
include ../../gar.mk

# ffmpeg2.8.5 don't like gcc5.3.0 link-time optimizations
CFLAGS  := $(filter-out -flto, $(CFLAGS))
LDFLAGS := $(filter-out -flto, $(LDFLAGS))

CFLAGS  += -Wno-all
LDFLAGS += -Wno-all

clean-all:
	@$(MAKE) clean
	@rm -rf $(DESTDIR)$(includedir)/libavcodec
	@rm -rf $(DESTDIR)$(includedir)/libavdevice
	@rm -rf $(DESTDIR)$(includedir)/libavfilter
	@rm -rf $(DESTDIR)$(includedir)/libavformat
	@rm -rf $(DESTDIR)$(includedir)/libavutil
	@rm -rf $(DESTDIR)$(includedir)/libpostproc
	@rm -rf $(DESTDIR)$(includedir)/libswscale
	@rm -rf $(DESTDIR)$(includedir)/libswresample
	@rm -rf $(DESTDIR)$(libdir)/libavcodec.*
	@rm -rf $(DESTDIR)$(libdir)/libavdevice.*
	@rm -rf $(DESTDIR)$(libdir)/libavfilter.*
	@rm -rf $(DESTDIR)$(libdir)/libavformat.*
	@rm -rf $(DESTDIR)$(libdir)/libavutil.*
	@rm -rf $(DESTDIR)$(libdir)/libpostproc.*
	@rm -rf $(DESTDIR)$(libdir)/libswscale.*
	@rm -rf $(DESTDIR)$(libdir)/libswresample.*
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libswscale.pc
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libswresample.pc
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libpostproc.pc
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libavutil.pc
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libavformat.pc
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libavfilter.pc
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libavdevice.pc
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libavcodec.pc
	@rm -rf $(DESTDIR)$(datadir)/ffmpeg
	@rm -rf $(DESTDIR)$(bin)/ffmpeg
	@rm -rf $(DESTDIR)$(bin)/ffprobe
	@rm -rf $(DESTDIR)$(bin)/ffplay
