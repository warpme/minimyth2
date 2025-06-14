
GARNAME      = ffmpeg
CATEGORIES   = lib
GARVERSION   = 7.1
MASTER_SITES = http://ffmpeg.org/releases/
DISTFILES    = $(DISTNAME).tar.xz

PATCHFILES  += 0001-avutil-hwcontext-Add-hwdevice-type-for-V4L2-Request-.patch
PATCHFILES  += 0002-avcodec-Add-common-V4L2-Request-API-code.patch
PATCHFILES  += 0003-avcodec-v4l2request-Probe-for-a-capable-media-and-vi.patch
PATCHFILES  += 0004-avcodec-v4l2request-Add-common-decode-support-for-hw.patch
PATCHFILES  += 0005-avcodec-Add-V4L2-Request-API-mpeg2-hwaccel.patch
PATCHFILES  += 0006-avcodec-h264dec-add-ref_pic_marking-and-pic_order_cn.patch
PATCHFILES  += 0007-avcodec-Add-V4L2-Request-API-h264-hwaccel.patch
PATCHFILES  += 0008-avcodec-Add-V4L2-Request-API-hevc-hwaccel.patch
PATCHFILES  += 0009-avcodec-Add-V4L2-Request-API-vp8-hwaccel.patch
PATCHFILES  += 0010-avcodec-vp9-Store-update_data-field.patch
PATCHFILES  += 0011-avcodec-vp9-split-out-delta-probabilities.patch
PATCHFILES  += 0012-avcodec-Add-V4L2-Request-API-vp9-hwaccel.patch
PATCHFILES  += 0013-vfilters-deinterlace-v4l2m2m.patch

LICENSE      = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lib/fontconfig lib/libbluray devel/zlib utils/bzip2 X11/libva X11/libvdpau
BUILDDEPS = devel/yasm

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = clean-other-versions $(WORKSRC)/Makefile

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
	--disable-doc \
	--disable-htmlpages \
	--disable-manpages \
	--disable-podpages \
	--disable-txtpages \
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

install-clean-other-versions:
	@echo "Purging other versions of ffmpeg libs/bins ..."
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

clean-all: install-clean-other-versions
	@$(MAKE) clean
