
GARNAME      = test-ffmpeg-drm
GARVERSION   = 402a73ef09096ffbe83a4befd233cd6f12463e88
MASTER_SITES = https://github.com/mark-kendall/ffmpeg-drm/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/ffmpeg-drm-$(GARVERSION)

CATEGORIES = lib
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lib/ffmpeg

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

BUILD_ARGS   = \
	CC="$(CC)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS) $(LDFLAGS)" \
	CXXFLAGS="$(CXXFLAGS) $(LDFLAGS)"

build-custom:
	@echo "Building..."
	@#
	@# For mainline ffmpeg
	@# gcc                        -o ffmpeg-drm main.c                       -I/usr/include/drm            -lavcodec -lz -lm -lpthread -lavcodec -lavformat -lavutil -lswresample -ldrm -L/usr/local/lib
	@#$(CC) $(CXXFLAGS) $(LDFLAGS) -o $(WORKSRC)/ffmpeg-drm $(WORKSRC)/main.c -I$(DESTDIR)$(includedir)/drm -lavcodec -lz -lm -lpthread -lavcodec -lavformat -lavutil -lswresample -ldrm -L$(DESTDIR)$(libdir)
	@#
	@# For mythffmpeg
	@# gcc                        -o ffmpeg-drm main.c                       -I/usr/include/libdrm            -I /usr/local/include/mythtv     -lz -lm -lpthread -lmythavcodec -lmythavformat -lmythavutil -lmythswresample -ldrm -L/usr/local/lib
	@$(CC) $(CXXFLAGS) $(LDFLAGS) -o $(WORKSRC)/ffmpeg-drm $(WORKSRC)/main.c -I$(DESTDIR)$(includedir)/libdrm -I$(DESTDIR)$(includedir)/mythtv -lz -lm -lpthread -lmythavcodec -lmythavformat -lmythavutil -lmythswresample -ldrm -L$(DESTDIR)$(libdir)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -rf $(WORKSRC)/ffmpeg-drm $(DESTDIR)$(bindir)/ffmpeg-drm
	@echo '# echo "0xFF" > /sys/module/drm/parameters/debug' > $(DESTDIR)$(bindir)/test-ffmpeg-drm.sh
	@echo '# ffmpeg-drm --video $$1 --codec h264_v4l2m2m --width $$2 --height $$3' >> $(DESTDIR)$(bindir)/test-ffmpeg-drm.sh
	@echo 'ffmpeg-drm  --video /usr/local/share/h264.FVDO_Freeway_720p.264 --codec h264_v4l2m2m --width 1280 --height 720' >> $(DESTDIR)$(bindir)/test-ffmpeg-drm.sh
	@chmod +x $(DESTDIR)$(bindir)/test-ffmpeg-drm.sh
	@$(MAKECOOKIE)
