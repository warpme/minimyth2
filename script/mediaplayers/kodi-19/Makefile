
GARNAME       = xbmc
GARVERSION    = $(KODI_VERSION)
CATEGORIES    = mediaplayers
MASTER_SITES  = \
		$(KODI_MASTER_SITES) \
		https://download.videolan.org/pub/libdvdcss/1.4.3/ \
		https://download.videolan.org/pub/videolan/libdvdnav/6.1.1/ \
		https://download.videolan.org/pub/videolan/libdvdread/6.1.2/ \
		http://mirrors.kodi.tv/build-deps/sources/
DISTFILES     = \
		$(GARVERSION).tar.gz \
		libdvdcss-1.4.3.tar.bz2 \
		libdvdnav-6.1.1.tar.bz2 \
		libdvdread-6.1.2.tar.bz2 \
		libudfread-1.1.0.tar.gz
WORKSRC       = $(WORKDIR)/xbmc-$(GARVERSION)
LICENSE       = GPL

DEPENDS = \
	db/sqlite \
	devel/nasm \
	devel/zlib \
	opengl/opengl \
	utils/gperf \
	lib/bluez \
	lib/flatbuffers \
	lib/ffmpeg4 \
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
	net/curl \
	net/libnfs \
	python3/python \
	python3/python-simplejson \
	system/lirc \
	X11/libva \
	xorg/libdrm \
	xorg/xrandr \
	wayland/wayland-protocols \
	wayland/waylandpp \
	xorg/libxkbcommon \

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
	-DPC_WAYLANDPP_SCANNER_FOUND=ON \
	-DPC_WAYLANDPP_SCANNER=$(build_DESTDIR)$(build_bindir)/wayland-scanner++ \
	-DWAYLANDPP_PROTOCOLS_DIR=$(build_DESTDIR)$(build_sharedstatedir)/waylandpp/protocols \
	-DWITH_TEXTUREPACKER=$(build_DESTDIR)$(build_bindir)/TexturePacker \
	-DWITH_JSONSCHEMABUILDER=$(build_DESTDIR)$(build_bindir)/JsonSchemaBuilder \
	-DFLATBUFFERS_FLATC_EXECUTABLE=$(build_DESTDIR)$(build_bindir)/flatc \
	-DSWIG_EXECUTABLE=$(build_DESTDIR)$(build_bindir)/swig \
	-DUSE_LTO=ON \
	-DENABLE_LDGOLD=OFF \
	-DENABLE_AIRTUNES=OFF \
	-DENABLE_ALSA=ON \
	-DENABLE_AVAHI=ON \
	-DENABLE_BLURAY=OFF \
	-DENABLE_CEC=ON \
	-DENABLE_DBUS=OFF \
	-DENABLE_DVDCSS=ON \
	-DENABLE_EGL=ON \
	-DENABLE_EVENTCLIENTS=OFF \
	-DENABLE_MICROHTTPD=ON \
	-DENABLE_MYSQLCLIENT=ON \
	-DENABLE_NFS=OFF \
	-DENABLE_OPTICAL=ON \
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
	-DLIBDVDCSS_URL=../../../download/libdvdcss-1.4.3.tar.bz2 \
	-DLIBDVDNAV_URL=../../../download/libdvdnav-6.1.1.tar.bz2 \
	-DLIBDVDREAD_URL=../../../download/libdvdread-6.1.2.tar.bz2 \
	-DUDFREAD_URL=../../../download/libudfread-1.1.0.tar.gz \
	$(if $(filter i386 x86_64, $(GARCH_FAMILY)),-DCORE_PLATFORM_NAME=x11 -DAPP_RENDER_SYSTEM=gl) \
	$(if $(filter arm arm64,   $(GARCH_FAMILY)),-DCORE_PLATFORM_NAME=gbm -DAPP_RENDER_SYSTEM=gles) \

ifeq (0,1)
# enable to use mythtv ffmpeg (i.e. for testing API of mythtv ffmpeg)
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

BUILD_ARGS   = \
	DESTDIR="" \

include ../../gar.mk
GAR_EXTRA_CONF += mediaplayers/kodi/package-api.mk

clean-all:
	@rm -rf $(DESTDIR)$(libdir)/kodi*
	@rm -rf $(DESTDIR)$(bindir)/kodi*
	@rm -rf $(DESTDIR)$(datadir)/kodi*
	@rm -rf $(DESTDIR)$(includedir)/kodi*
	@$(foreach dir, $(wildcard ../kodi-* ), $(MAKE) clean clean-all -C $(dir) ;)
