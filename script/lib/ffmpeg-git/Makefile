
GARNAME      = ffmpeg
CATEGORIES   = lib

# git hash ffmpeg v4.3.1 @21-07-2020
GITHASH      = 6b6b9e593dd4d3aaf75f48d40a13ef03bdef9fdb
GARVERSION   = 20200721-$(GITHASH)
MASTER_SITES = https://github.com/FFmpeg/FFmpeg/archive/
DISTFILES    = $(GITHASH).zip
WORKSRC      = $(WORKDIR)/FFmpeg-$(GITHASH)

ifeq (0,1)
# https://github.com/Kwiboo/FFmpeg/commits/v4l2-request-hwaccel-4.3.1 @19.08.2020
PATCHFILES += 0001-avutil-add-av_buffer_pool_flush.patch
PATCHFILES += 0002-Add-common-V4L2-request-API-code.patch
PATCHFILES += 0003-Add-V4L2-request-API-mpeg2-hwaccel.patch
PATCHFILES += 0004-Add-V4L2-request-API-h264-hwaccel.patch
PATCHFILES += 0005-Add-V4L2-request-API-hevc-hwaccel.patch
PATCHFILES += 0006-Add-V4L2-request-API-vp8-hwaccel.patch
PATCHFILES += 0007-avcodec-h264-parse-idr_pic_id.patch
PATCHFILES += 0008-avcodec-h264-parse-ref_pic_marking_size_in_bits-and-.patch
PATCHFILES += 0009-Add-and-use-private-linux-headers-for-V4L2-request-A.patch
PATCHFILES += 0010-Update-to-v5.7-private-linux-headers.patch
PATCHFILES += 0011-Update-to-v5.8-private-linux-headers.patch
PATCHFILES += 0012-HACK-hwcontext_drm-do-not-require-drm-device.patch
PATCHFILES += 0013-WIP-h264-field-reference.patch
PATCHFILES += 0014-WIP-hevc-scaling-matrix.patch
PATCHFILES += 0015-WIP-hevc-segment-address.patch
PATCHFILES += 0016-WIP-hevc-entry-point-offsets.patch
PATCHFILES += 0017-WIP-Add-V4L2-request-API-vp9-hwaccel.patch
PATCHFILES += 0018-WIP-Add-and-use-vp9-private-linux-header.patch
PATCHFILES += 0019-WIP-add-NV15-and-NV20-support.patch
PATCHFILES += 0020-HACK-define-drm-NV15-and-NV20-format.patch
PATCHFILES += 0021-Revert-WIP-h264-field-reference.patch
PATCHFILES += 0022-WIP-update-to-latest-h264-uapi.patch
endif

ifeq (1,1)
# https://github.com/LibreELEC/LibreELEC.tv/commits/master/packages/multimedia/ffmpeg/patches 9.07.2020
PATCHFILES += ffmpeg-001-v4l2-drmprime.patch
PATCHFILES += ffmpeg-001-v4l2-request.patch
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
