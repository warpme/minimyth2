
GARNAME      = x11vnc
GARVERSION   = c88bf5af79a1abc40d82cdc76d8ea50a8cfc4cfd
CATEGORIES   = X11
MASTER_SITES = https://github.com/LibVNC/x11vnc/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c xorg/xorg lib/libjpeg devel/zlib xorg/libvncserver

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes=$(DESTDIR)$(includedir) \
	--x-libraries=$(DESTDIR)$(libdir) \
	--with-tightvnc-filetransfer \
	--with-24bpp \
	--without-ffmpeg \
	--with-x \
	--without-system-libvncserver \
	--with-x11vnc \
	--with-xkeyboard \
	--with-xinerama \
	--with-xrandr \
	--with-xfixes \
	--without-xdamage \
	--without-xtrap \
	--with-xrecord \
	--without-fbpm \
	--with-dpms \
	--without-v4l \
	--without-fbdev \
	--with-uinput \
	--without-macosx-native \
	--without-crypt \
	--without-crypto \
	--without-ssl \
	--without-avahi \
	--with-jpeg \
	--with-jpeg=$(DESTDIR)$(prefix) \
	--with-zlib \
	--with-zlib=$(DESTDIR)$(prefix) \
	--without-gnutls \
	--without-client-tls \
	--without-ipv6

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
