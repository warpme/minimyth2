
GARNAME      = ffmpeg
CATEGORIES   = lib
GARVERSION   = 4.4
MASTER_SITES = http://ffmpeg.org/releases/
DISTFILES    = $(DISTNAME).tar.bz2

include ../../minimyth.conf.mk

PATCHFILES  = ffmpeg-fix-building-with-lto.patch
PATCHFILES += 0001-avutil-add-av_buffer_pool_flush.patch
PATCHFILES += 0002-Add-common-V4L2-request-API-code.patch
PATCHFILES += 0003-h264dec-add-idr_pic_id-to-slice-context.patch
PATCHFILES += 0004-h264dec-add-ref_pic_marking-and-pic_order_cnt-bit_si.patch
PATCHFILES += 0005-Add-V4L2-request-API-h264-hwaccel.patch
PATCHFILES += 0006-Add-V4L2-request-API-mpeg2-hwaccel.patch
PATCHFILES += 0007-Add-V4L2-request-API-vp8-hwaccel.patch
PATCHFILES += 0008-Add-V4L2-request-API-hevc-hwaccel.patch
PATCHFILES += 0009-Add-and-use-private-linux-v5.14-headers-for-V4L2-req.patch
PATCHFILES += 0010-HACK-hwcontext_drm-do-not-require-drm-device.patch
PATCHFILES += 0011-WIP-hevc-scaling-matrix.patch
PATCHFILES += 0012-WIP-hevc-segment-address.patch
PATCHFILES += 0013-WIP-hevc-entry-point-offsets.patch
PATCHFILES += 0014-WIP-Add-V4L2-request-API-vp9-hwaccel.patch
PATCHFILES += 0015-WIP-Add-and-use-vp9-private-linux-header.patch
PATCHFILES += 0016-WIP-add-NV15-and-NV20-support.patch
PATCHFILES += 0017-HACK-define-drm-NV15-and-NV20-format.patch
PATCHFILES += 0018-WIP-hevc-rkvdec-fields.patch
PATCHFILES += 0019-v4l2_request-validate-supported-framesizes.patch

LICENSE      = GPL2/LGPL2_1

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
	--enable-lto \
	--enable-asm \
	$(if $(filter arm,$(GARCH_FAMILY)), --disable-inline-asm, --enable-inline-asm) \
	--enable-fast-unaligned \
	--enable-optimizations \
	--pkg-config="pkg-config" \
	--enable-libdrm \
	--enable-libudev \
	--enable-v4l2-m2m \
	--enable-v4l2_request \

BUILD_ARGS     = \
	V='0'
INSTALL_ARGS   = \
	V='0'

GAR_EXTRA_CONF += mediaplayers/mplayer-svn/package-api.mk
include ../../gar.mk

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
