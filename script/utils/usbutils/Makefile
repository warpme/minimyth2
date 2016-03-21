GARNAME = usbutils
# 008 requires libudev greater than libudev 182.
GARVERSION = 007
CATEGORIES = utils
MASTER_SITES = https://www.kernel.org/pub/linux/utils/usb/$(GARNAME)/
# usb.ids: <http://www.linux-usb.org/usb-ids.html>
DISTFILES = $(DISTNAME).tar.xz usb.ids
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/libusb

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-zlib

include ../../gar.mk

extract-usb.ids:
	@cp -f $(DOWNLOADDIR)/usb.ids $(WORKSRC)/usb.ids
	@$(MAKECOOKIE)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
