
GARNAME      = xorg-server
GARVERSION   = 21.1.5
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://xorg.freedesktop.org/releases/individual/xserver/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS  = lang/c lib/openssl \
	$(CATEGORY)/xorgproto \
	$(CATEGORY)/font-util \
	$(CATEGORY)/libdrm \
	$(CATEGORY)/libxcvt \
	$(CATEGORY)/libpciaccess \
	$(CATEGORY)/libX11 \
	$(CATEGORY)/libXau \
	$(CATEGORY)/libXfont \
	$(CATEGORY)/libXfont2 \
	$(CATEGORY)/libxkbfile \
	$(CATEGORY)/libepoxy \
	$(CATEGORY)/pixman \
	$(CATEGORY)/util-macros \
	$(CATEGORY)/xtrans \
	opengl/opengl \

ifneq ($(DESTIMG),build)
DEPENDS += system/eudev
endif

BUILDDEPS = \
	$(CATEGORY)/xorg-sgml-doctools

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-strict-compilation \
	--enable-silent-rules \
	--disable-static \
	--enable-shared \
	--disable-debug \
	--disable-unit-tests \
	$(if $(filter mesa%,$(mm_OPENGL_PROVIDER)), \
		--enable-glx \
		--enable-dri \
		--enable-dri2 \
		--enable-dri3 \
		--enable-glamor \
		--enable-xwayland \
		, \
		--disable-glx \
		--disable-dri \
		--disable-dri2 \
		--disable-dri3 \
		--disable-glamor \
		--disable-xwayland) \
	--disable-xselinux \
	--disable-xcsecurity \
	--disable-tslib \
	$(if $(filter build, $(DESTIMG)), --disable-config-udev, --enable-config-udev) \
	$(if $(filter build, $(DESTIMG)), --disable-config-udev-kms, --enable-config-udev-kms) \
	--disable-devel-docs \
	--with-gnu-ld \
	--with-default-font-path="$(datadir)/fonts/X11/TTF,$(datadir)/fonts/X11/misc" \
	--with-xkb-path="$(datadir)/X11/xkb" \
	--with-xkb-output="$(datadir)/X11/xkb/compiled" \
	--with-serverconfig-path="$(libdir)/xserver" \
	--enable-xorg \

CONFIGURE_ENV = \
	XORG_SGML_PATH="$(DESTDIR)$(includedir)/xorg"

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

CFLAGS   += -Wno-array-bounds
CPPFLAGS += -Wno-array-bounds
LDFLAGS  += -Wno-array-bounds

post-install:
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/drivers/modesetting_drv.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/extensions/libdbe.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/extensions/libdri.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/extensions/libdri2.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/extensions/libextmod.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/extensions/libglx.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/extensions/librecord.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libglamoregl.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libexa.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libfb.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libfbdevhw.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libint10.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libshadow.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libshadowfb.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libvbe.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libvgahw.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libwfb.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/multimedia/bt829_drv.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/multimedia/fi1236_drv.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/multimedia/msp3430_drv.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/multimedia/tda8425_drv.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/multimedia/tda9850_drv.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/multimedia/tda9885_drv.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/multimedia/uda1380_drv.la
	@cp $(WORKSRC)/composite/compositeext.h $(DESTDIR)$(includedir)/xorg/compositeext.h
	@$(MAKECOOKIE)
