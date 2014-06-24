GARNAME = libxcb
GARVERSION = 1.9
CATEGORIES = $(CATEGORY)
MASTER_SITES = http://xcb.freedesktop.org/dist/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	$(CATEGORY)/libpthread-stubs \
	$(CATEGORY)/libXau \
	$(CATEGORY)/xcb-proto
BUILDDEPS = \
	lib/libxslt

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-build-docs \
	--enable-composite \
	--enable-damage \
	--enable-dpms \
	--enable-dri2 \
	--enable-glx \
	--enable-randr \
	--enable-record \
	--enable-render \
	--enable-resource \
	--enable-screensaver \
	--enable-shape \
	--enable-shm \
	--enable-sync \
	--enable-xevie \
	--enable-xfixes \
	--enable-xfree86-dri \
	--enable-xinerama \
	--disable-xinput \
	--disable-xprint \
	--disable-selinux \
	--enable-xtest \
	--enable-xv \
	--enable-xvmc \
	--with-gnu-ld

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@rm -f $(DESTDIR)$(libdir)/libxcb-composite.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-damage.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-dpms.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-dri2.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-glx.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-randr.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-record.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-render.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-res.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-screensaver.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-shape.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-shm.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-sync.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-xevie.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-xf86dri.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-xfixes.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-xinerama.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-xtest.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-xv.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-xvmc.la
	@$(MAKECOOKIE)
