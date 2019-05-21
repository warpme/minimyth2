
GARNAME      = test-ffmpeg-drm
GARVERSION   = 1e98f0d811400bea763d99c424e52e12c94b5900
MASTER_SITES = https://github.com/Elyotna/ffmpeg-drm/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/ffmpeg-drm-$(GARVERSION)

CATEGORIES = lib
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lib/ffmpeg

BUILD_SCRIPTS   = libXNVCtrl
INSTALL_SCRIPTS = libXNVCtrl

include ../../gar.mk

BUILD_ARGS   = \
	CC="$(CC)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS) $(LDFLAGS)" \
	CXXFLAGS="$(CXXFLAGS) $(LDFLAGS)"

build-libXNVCtrl:
	@echo "Building..."
	@# gcc -o ffmpeg-drm main.c -I/usr/include/drm -lavcodec -lz -lm -lpthread -lavcodec -lavformat -lavutil -lswresample -ldrm -L/usr/local/lib
	@$(CC) $(CXXFLAGS) $(LDFLAGS) -o $(WORKSRC)/ffmpeg-drm $(WORKSRC)/main.c -I$(DESTDIR)$(includedir)/drm -lavcodec -lz -lm -lpthread -lavcodec -lavformat -lavutil -lswresample -ldrm -L$(DESTDIR)$(libdir)
	@$(MAKECOOKIE)

install-libXNVCtrl:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -rf $(WORKSRC)/ffmpeg-drm $(DESTDIR)$(bindir)/ffmpeg-drm
	@# cp -rf $(WORKSRC)/run.sh $(DESTDIR)$(bindir)/test-ffmpeg-drm.sh
	@echo "echo 0xFF > /sys/module/drm/parameters/debug" > $(DESTDIR)$(bindir)/test-ffmpeg-drm.sh
	@echo "ffmpeg-drm --video /usr/local/share/h264.FVDO_Freeway_720p.264 --codec h264_v4l2m2m --width 1280 --height 720" >> $(DESTDIR)$(bindir)/test-ffmpeg-drm.sh
	@$(MAKECOOKIE)
