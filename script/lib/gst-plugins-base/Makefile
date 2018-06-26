GARNAME = gst-plugins-base
GARVERSION = 1.10.2
CATEGORIES = system
MASTER_SITES = http://gstreamer.freedesktop.org/src/gst-plugins-base/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/gstreamer lib/alsa-lib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--prefix=/usr \
	--disable-neon

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libgstallocators-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstapp-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstaudio-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstfft-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstpbutils-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstriff-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstrtp-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstrtsp-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstsdp-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgsttag-1.0.la
	@rm -f $(DESTDIR)$(libdir)/libgstvideo-1.0.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstalsa.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstogg.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstpango.la
	@rm -f $(DESTDIR)$(libdir)/gstreamer-1.0/libgstvorbis.la
	@$(MAKECOOKIE)
