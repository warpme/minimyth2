
# GIT URL: https://github.com/bootlin/libva-v4l2-request

# Uncomment for downloading current master from 18.2-rc5 branch
# GARNAME      = libva-v4l2-request
# GARVERSION   = master
# MASTER_SITES = https://github.com/bootlin/libva-v4l2-request/archive/
# DISTFILES    = $(DISTNAME).tar.bz2
# WORKSRC      = $(WORKDIR)/mesa-lima-$(GARVERSION)

# Uncomment for downloading at given GIT commit
GARNAME      = test-ffmpeg-drm
GARVERSION   = 6fcfdf5c20a586ec6e8b002bcc44034243c55abf
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
	@cp -rf $(WORKSRC)/run.sh $(DESTDIR)$(bindir)/test-ffmpeg-drm.sh
	@$(MAKECOOKIE)
