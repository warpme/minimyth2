
GARNAME      = bluez
GARVERSION   = 5.79
CATEGORIES   = lib
MASTER_SITES = https://www.kernel.org/pub/linux/bluetooth/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS  = lang/c gtk/glib lib/alsa-lib lib/dbus lib/readline
ifneq ($(DESTIMG),build)
DEPENDS += lib/libusb-compat system/eudev
endif

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile pkgconfig

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--disable-static \
	--enable-shared \
	--enable-optimization \
	--disable-pie \
	--disable-nfc \
	--disable-sap \
	--enable-a2dp \
	--enable-avrcp \
	--disable-network \
	--enable-hid \
	--enable-hog \
	--disable-health \
	--enable-tools \
	--enable-library \
	--enable-monitor \
	--disable-udev \
	--disable-mesh \
	--disable-midi \
	--disable-obex \
	--disable-btpclient \
	--enable-client \
	--disable-systemd \
	--disable-datafiles \
	--disable-manpages \
	--disable-testing \
	--enable-experimental \
	--enable-deprecated \
	--disable-sixaxis \
	--disable-logger \
	--disable-android \
	--disable-debug \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

install-pkgconfig:
	@mkdir -p $(DESTDIR)$(libdir)/pkgconfig/
	@cp $(WORKSRC)/lib/bluez.pc $(DESTDIR)$(libdir)/pkgconfig/bluez.pc
	@mkdir -p $(DESTDIR)$(includedir)/bluetooth
	@cp $(WORKSRC)/lib/*.h $(DESTDIR)$(includedir)/bluetooth/
	@mkdir -p $(DESTDIR)$(sysconfdir)/dbus-1/system.d
	@cp $(WORKSRC)/src/bluetooth.conf $(DESTDIR)$(sysconfdir)/dbus-1/system.d/
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/alsa-lib/libasound_module_ctl_bluetooth.la
	@rm -f $(DESTDIR)$(libdir)/alsa-lib/libasound_module_pcm_bluetooth.la
	@rm -f $(DESTDIR)$(libdir)/libbluetooth.la
	@$(MAKECOOKIE)
