
GARNAME = ffmpeg
CATEGORIES = lib

ifeq (1,0)
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
# git hash ffmpeg master @16-12-2019
GITHASH = e6891d1b7ccd93bea5c94cf3a766130216bd53c6
GARVERSION = 20200205-$(GITHASH)
MASTER_SITES = https://github.com/FFmpeg/FFmpeg/archive/
DISTFILES = $(GITHASH).zip
WORKSRC   = $(WORKDIR)/FFmpeg-$(GITHASH)

# https://github.com/Kwiboo/FFmpeg/commits/v4l2-request-hwaccel-master
PATCHFILES += 0001-ffmpeg-d5274f8-avutil-add-av_buffer_pool_flush.patch
PATCHFILES += 0002-ffmpeg-d5274f8-Add-common-V4L2-request-API-code.patch
PATCHFILES += 0003-ffmpeg-d5274f8-Add-V4L2-request-API-mpeg2-hwaccel.patch
PATCHFILES += 0004-ffmpeg-d5274f8-Add-V4L2-request-API-h264-hwaccel.patch
PATCHFILES += 0005-ffmpeg-d5274f8-Add-V4L2-request-API-hevc-hwaccel.patch
PATCHFILES += 0006-ffmpeg-d5274f8-Add-V4L2-request-API-vp8-hwaccel.patch
PATCHFILES += 0007-ffmpeg-d5274f8-Add-and-use-private-linux-headers-for-V4L2-request-A.patch
PATCHFILES += 0008-ffmpeg-d5274f8-hwcontext_drm-do-not-require-drm-device.patch
PATCHFILES += 0009-ffmpeg-d5274f8-avcodec-h264-parse-idr_pic_id.patch
PATCHFILES += 0010-ffmpeg-d5274f8-avcodec-h264-parse-ref_pic_marking_size_in_bits-and-.patch
PATCHFILES += 0011-ffmpeg-d5274f8-HACK-add-dpb-flags-for-reference-usage-and-field-pic.patch
PATCHFILES += 0012-ffmpeg-d5274f8-WIP-v4l2-request-rolling-timestamps.patch
# Aman patches related to v4l2_m2m
#PATCHFILES += 0164-ffmpeg-avcodec-v4l2_context-Use-AVERROR-macro.patch
PATCHFILES += 0165-ffmpeg-avcodec-v4l2m2m-clean-up-buffer-options-and-pick-sane-defaults.patch
PATCHFILES += 0166-ffmpeg-avcodec-v4l2_m2m_dec-remove-temporary-avpkt-and-read-directyl-to-buffer.patch
PATCHFILES += 0167-ffmpeg-avcodec-handle-errors-more-explicitly.patch
PATCHFILES += 0168-avcodec-v4l2_m2m-Avoid-using-intermediate-buffer.patch
#PATCHFILES += 0169-ffmpeg-libavdevice-produce-0byte-if-dequeued-size-unexpected.patch
PATCHFILES += 0170-ffmpeg-libavcodec-log-requested-pixfmt.patch
#--------------------------------------------------------
endif


ifeq (1,1)
#--use this for current master ffmpeg--------------------
# https://github.com/FFmpeg/FFmpeg/commits/release/4.2
GITHASH = 19bfd7212695b456352e258c9ee50882583ce12f
GARVERSION = 20200322-$(GITHASH)
MASTER_SITES = https://github.com/FFmpeg/FFmpeg/archive/
DISTFILES = $(GITHASH).zip
WORKSRC   = $(WORKDIR)/FFmpeg-$(GITHASH)

# v4l2-m2m KODI patches
PATCHFILES += 0001-libavcodec-v4l2m2m-fix-indentation-and-add-M2MDEC_CL.patch
PATCHFILES += 0002-libavcodec-v4l2m2m-output-AVDRMFrameDescriptor.patch
PATCHFILES += 0003-libavcodec-v4l2m2m-adjust-formatting.patch
PATCHFILES += 0004-libavcodec-v4l2m2m-fix-error-handling-during-buffer-.patch
PATCHFILES += 0005-libavcodec-v4l2m2m-depends-on-libdrm.patch
PATCHFILES += 0006-libavcodec-v4l2m2m-set-format_modifier-to-DRM_FORMAT.patch
PATCHFILES += 0007-libavcodec-v4l2m2m-only-mmap-the-buffer-when-it-is-o.patch
PATCHFILES += 0008-libavcodec-v4l2m2m-allow-using-software-pixel-format.patch
PATCHFILES += 0009-libavcodec-v4l2m2m-fix-decoder-capabilities.patch
PATCHFILES += 0010-libavcodec-v4l2m2m-implement-hwcontext.patch
PATCHFILES += 0011-libavcodec-v4l2m2m-implement-flush.patch
PATCHFILES += 0012-libavcodec-v4l2m2m-aspect-ratio.patch
PATCHFILES += 0013-libavcodec-v4l2m2m-save-pkt.patch
PATCHFILES += 0014-libavcodec-v4l2m2m-only-use-a-few-output-buffers.patch
# v4l2_request patches
PATCHFILES += 0201-avutil-add-av_buffer_pool_flush.patch
PATCHFILES += 0202-Add-common-V4L2-request-API-code.patch
PATCHFILES += 0203-Add-V4L2-request-API-mpeg2-hwaccel.patch
PATCHFILES += 0204-Add-V4L2-request-API-h264-hwaccel.patch
PATCHFILES += 0205-Add-V4L2-request-API-hevc-hwaccel.patch
PATCHFILES += 0206-Add-V4L2-request-API-vp8-hwaccel.patch
PATCHFILES += 0207-Add-and-use-private-linux-headers-for-V4L2-request-A.patch
PATCHFILES += 0208-hwcontext_drm-do-not-require-drm-device.patch
PATCHFILES += 0209-avcodec-h264-parse-idr_pic_id.patch
PATCHFILES += 0210-avcodec-h264-parse-ref_pic_marking_size_in_bits-and-.patch
PATCHFILES += 0211-HACK-add-dpb-flags-for-reference-usage-and-field-pic.patch
PATCHFILES += 0212-WIP-v4l2-request-rolling-timestamps.patch
PATCHFILES += 0213-v4l2-request-hevc-Set-SPS-control-at-initialization.patch
#--------------------------------------------------------
endif


LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lib/fontconfig lib/libbluray lib/SDL devel/zlib utils/bzip2 X11/libva X11/libvdpau
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

CFLAGS  += -Wno-all
LDFLAGS += -Wno-all

# FFmpeg failts to build with gcc9.3.0 LTO
CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

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
