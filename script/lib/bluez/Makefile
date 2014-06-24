GARNAME = bluez
GARVERSION = 4.101
CATEGORIES = lib
MASTER_SITES = http://www.kernel.org/pub/linux/bluetooth/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = \
	$(DISTNAME)-automake_1.13.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS  = lang/c gtk/glib lib/alsa-lib lib/dbus lib/readline
ifneq ($(DESTIMG),build)
DEPENDS += lib/libusb-compat system/udev
endif

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--enable-optimization \
	--enable-fortify \
	--disable-pie \
	--disable-network \
	--disable-sap \
	--disable-serial \
	--enable-input \
	--disable-audio \
	--enable-service \
	--disable-mcap \
	--disable-pnat \
	--disable-attrib \
	--disable-gstreamer \
	--enable-alsa \
	--enable-tools \
	--enable-bccmd \
	--enable-pcmcia \
	--enable-dfutool \
	--enable-hidd \
	--disable-pand \
	--disable-dund \
	--disable-cups \
	--disable-test \
	--enable-udevrules \
	--enable-configfiles \
	--disable-debug \
	--disable-maemo6 \
	--disable-dbusoob \
	--enable-wiimote \
	--disable-hal \
	--disable-gatt \
	--with-gnu-ld
ifeq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--disable-usb \
	--disable-hid2hci
else
CONFIGURE_ARGS += \
	--enable-usb \
	--enable-hid2hci
endif

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/alsa-lib/libasound_module_ctl_bluetooth.la
	@rm -f $(DESTDIR)$(libdir)/alsa-lib/libasound_module_pcm_bluetooth.la
	@rm -f $(DESTDIR)$(libdir)/libbluetooth.la
	@$(MAKECOOKIE)
