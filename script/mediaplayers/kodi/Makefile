
# this package requires pacman -S jre17-openjdk on host
# (note: jre21 is NOT compatible)

GARNAME       = xbmc
GARVERSION    = $(KODI_VERSION)
CATEGORIES    = mediaplayers
MASTER_SITES  = \
		$(KODI_MASTER_SITES) \
		https://download.videolan.org/pub/libdvdcss/1.4.3/ \
		https://download.videolan.org/pub/videolan/libdvdnav/6.1.1/ \
		https://download.videolan.org/pub/videolan/libdvdread/6.1.3/ \
		https://download.videolan.org/pub/videolan/libudfread/1.1.2/ \
		http://mirrors.kodi.tv/build-deps/sources/ \

DISTFILES     = \
		$(GARVERSION).zip \
		libdvdcss-1.4.3.tar.bz2 \
		libdvdnav-6.1.1.tar.bz2 \
		libdvdread-6.1.3.tar.bz2 \
		libudfread-1.1.2.tar.gz \

PATCHFILES   += 0001-WIP-DVDVideoCodecDRMPRIME-add-support-for-filters.patch
PATCHFILES   += 0002-WIP-DRMPRIME-deinterlace-filter.patch
PATCHFILES   += 0003-DVDVideoCodecDRMPRIME-Avoid-exception-with-AV_PIX_FM.patch
PATCHFILES   += 0004-DVDVideoCodecDRMPRIME-Leave-deinterlace-filter-activ.patch
PATCHFILES   += 0005-SetVideoInterlaced-Set-and-unset-deinterlace-method-.patch
PATCHFILES   += 0006-DVDVideoCodecDRMPRIME-Close-deinterlace-filter-on-er.patch
PATCHFILES   += 0007-DVDVideoCodecDRMPRIME-Fix-missing-flush-after-eof.patch
PATCHFILES   += 0050-configure-stop-finding-doxygen.patch
PATCHFILES   += 0051-update-libdvdread-sha.patch
PATCHFILES   += 0052-update-libdvdnav-sha.patch
PATCHFILES   += 0053-stop-uncoditionally-building-udfread.patch
PATCHFILES   += 0054-stop-detecting-clang.patch
PATCHFILES   += 0055-stop-using-10bitRGB-for-gui-plane.patch
WORKSRC       = $(WORKDIR)/xbmc-$(GARVERSION)

LICENSE       = GPL

DEPENDS = \
	db/sqlite \
	devel/nasm \
	devel/zlib \
	opengl/opengl \
	utils/gperf \
	lib/bluez \
	lib/exiv2 \
	lib/flatbuffers \
	lib/ffmpeg \
	lib/libfmt \
	lib/fontconfig \
	lib/freetype \
	lib/giflib \
	lib/libiconv \
	lib/libaacs \
	lib/libass \
	lib/libbluray \
	lib/libcdio \
	lib/libcec \
	lib/libdisplay-info \
	lib/fribidi \
	lib/libinput \
	lib/libmicrohttpd \
	lib/libcrossguid \
	lib/libfstrcmp \
	lib/libxslt \
	lib/lzo \
	lib/rapidjson \
	lib/spdlog \
	lib/taglib \
	lib/tinyxml \
	lib/tinyxml2 \
	net/curl \
	net/libnfs \
	python3/python \
	python3/python-simplejson \
	system/lirc \
	X11/libva \
	xorg/libdrm \
	xorg/xrandr \
	xorg/libxkbcommon \
	wayland/wayland-protocols \
	wayland/waylandpp \

BUILDDEPS = \
	lib/flatbuffers \
	utils/gawk \
	devel/gettext \
	mediaplayers/kodi-jsonschemabuilder \
	mediaplayers/kodi-texturepacker \
	devel/nasm \
	devel/swig \
	lib/xmlstarlet \

WORKBLD = $(WORKSRC)_build

TTT = -Wl,-z,pack-relative-relocs
BUILDFLAGS = $(subst $(TTT),, $(LDFLAGS))

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE=ON \
	$(if $(filter i386,  $(GARCH_FAMILY)),-DCMAKE_SYSTEM_PROCESSOR="i386") \
	$(if $(filter x86_64,$(GARCH_FAMILY)),-DCMAKE_SYSTEM_PROCESSOR="x86_64") \
	$(if $(filter arm,   $(GARCH_FAMILY)),-DCMAKE_SYSTEM_PROCESSOR="arm") \
	$(if $(filter arm64, $(GARCH_FAMILY)),-DCMAKE_SYSTEM_PROCESSOR="aarch64") \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=/usr/lib \
	-DENABLE_INTERNAL_FFMPEG=OFF \
	-DFFMPEG_PATH=$(DESTDIR)$(prefix) \
	-DPYTHON_PATH=$(DESTDIR)$(prefix) \
	-DWITH_TEXTUREPACKER=$(build_DESTDIR)$(build_bindir)/TexturePacker \
	-DWITH_JSONSCHEMABUILDER=$(build_DESTDIR)$(build_bindir)/JsonSchemaBuilder \
	-DFLATBUFFERS_FLATC_EXECUTABLE=$(build_DESTDIR)$(build_bindir)/flatc \
	-DSWIG_EXECUTABLE=$(build_DESTDIR)$(build_bindir)/swig \
	-DUSE_LTO=ON \
	-DENABLE_AIRTUNES=OFF \
	-DENABLE_ALSA=ON \
	-DENABLE_AVAHI=ON \
	-DENABLE_BLURAY=OFF \
	-DENABLE_CEC=ON \
	-DENABLE_DBUS=OFF \
	-DENABLE_DVDCSS=OFF \
	-DENABLE_EGL=ON \
	-DENABLE_EVENTCLIENTS=OFF \
	-DENABLE_MICROHTTPD=ON \
	-DENABLE_MYSQLCLIENT=ON \
	-DENABLE_NFS=OFF \
	-DENABLE_OPTICAL=OFF \
	-DENABLE_PULSEAUDIO=OFF \
	-DENABLE_SMBCLIENT=OFF \
	-DENABLE_TESTING=OFF \
	-DENABLE_UDEV=ON \
	-DENABLE_UPNP=OFF \
	-DENABLE_VAAPI=ON \
	-DENABLE_VDPAU=ON \
	-DENABLE_XSLT=ON \
	-DENABLE_LIRCCLIENT=ON \
	-DENABLE_INTERNAL_FMT=OFF \
	-DENABLE_INTERNAL_SPDLOG=OFF \
	-DENABLE_INTERNAL_CROSSGUID=OFF \
	-DENABLE_INTERNAL_FSTRCMP=OFF \
	-DENABLE_INTERNAL_FLATBUFFERS=OFF \
	-DENABLE_INTERNAL_UDFREAD=OFF \
	-DENABLE_INTERNAL_EXIV2=ON \
	-DLIBDVDCSS_URL=../../../download/libdvdcss-1.4.3.tar.bz2 \
	-DLIBDVDNAV_URL=../../../download/libdvdnav-6.1.1.tar.bz2 \
	-DLIBDVDREAD_URL=../../../download/libdvdread-6.1.3.tar.bz2 \
	-DUDFREAD_URL=../../../download/libudfread-1.1.2.tar.gz \
	$(if $(filter i386 x86_64, $(GARCH_FAMILY)),-DCORE_PLATFORM_NAME=x11 -DAPP_RENDER_SYSTEM=gl) \
	$(if $(filter arm arm64,   $(GARCH_FAMILY)),-DCORE_PLATFORM_NAME=gbm -DAPP_RENDER_SYSTEM=gles) \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DCMAKE_C_FLAGS="$(BUILDFLAGS)" \
	-DCMAKE_CXX_FLAGS="$(BUILDFLAGS)" \
	-DCMAKE_EXE_LINKER_FLAGS="$(BUILDFLAGS)" \

BUILD_ARGS   = \
	DESTDIR="" \

ifeq (0,1)
# enable to direct use of mythtv ffmpeg (i.e. for testing API of mythtv ffmpeg)
CMAKE_CONFIGURE_ARGS += \
	-DFFMPEG_INCLUDE_DIRS=$(DESTDIR)$(includedir)/mythtv \
	-DFFMPEG_LDFLAGS="-lmythavcodec;-lmythavfilter;-lmythavformat;-lmythavutil;-lmythswscale;-lmythswresample;-lmythpostproc" \
	-DFFMPEG_LIBAVCODEC=$(DESTDIR)$(libdir)/libmythavcodec.so \
	-DFFMPEG_LIBAVFILTER=$(DESTDIR)$(libdir)/libmythavfilter.so \
	-DFFMPEG_LIBAVFORMAT=$(DESTDIR)$(libdir)/libmythavformat.so \
	-DFFMPEG_LIBAVUTIL=$(DESTDIR)$(libdir)/libmythavutil.so \
	-DFFMPEG_LIBPOSTPROC=$(DESTDIR)$(libdir)/libmythpostproc.so \
	-DFFMPEG_LIBSWRESAMPLE=$(DESTDIR)$(libdir)/libmythswresample.so \
	-DFFMPEG_LIBSWSCALE=$(DESTDIR)$(libdir)/libmythswscale.so
endif

include ../../gar.mk
GAR_EXTRA_CONF += mediaplayers/kodi/package-api.mk

clean-all:
	@rm -rf $(DESTDIR)$(libdir)/kodi*
	@rm -rf $(DESTDIR)$(bindir)/kodi*
	@rm -rf $(DESTDIR)$(datadir)/kodi*
	@rm -rf $(DESTDIR)$(includedir)/kodi*
	@$(foreach dir, $(wildcard ../kodi-* ), $(MAKE) clean clean-all -C $(dir) ;)
