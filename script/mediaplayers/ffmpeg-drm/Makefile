
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
	@# gcc -o ffmpeg-drm main.c -I/usr/include/drm -lavcodec -lz -lm -lpthread -lavcodec -lavformat -lavutil -lswresample -ldrm -L/usr/local/lib
	@$(CC) $(CXXFLAGS) $(LDFLAGS) -o $(WORKSRC)/ffmpeg-drm $(WORKSRC)/main.c -I$(DESTDIR)$(includedir)/drm -lavcodec -lz -lm -lpthread -lavcodec -lavformat -lavutil -lswresample -ldrm -L$(DESTDIR)$(libdir)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -rf $(WORKSRC)/ffmpeg-drm $(DESTDIR)$(bindir)/ffmpeg-drm
	@echo 'echo "0xFF" > /sys/module/drm/parameters/debug' > $(DESTDIR)$(bindir)/test-ffmpeg-drm.sh
	@echo 'ffmpeg-drm --video $$1 --codec h264_v4l2m2m --width $$2 --height $$3' >> $(DESTDIR)$(bindir)/test-ffmpeg-drm.sh
	@chmod +x $(DESTDIR)$(bindir)/test-ffmpeg-drm.sh
	@$(MAKECOOKIE)
