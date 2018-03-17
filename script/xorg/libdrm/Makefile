GARNAME = libdrm
GARVERSION = 2.4.91
CATEGORIES = $(CATEGORY)
MASTER_SITES = http://dri.freedesktop.org/libdrm/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS  = lang/c \
	$(CATEGORY)/libpciaccess \
	$(CATEGORY)/libpthread-stubs
ifneq ($(DESTIMG),build)
DEPENDS += system/eudev
endif

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--enable-libkms \
	--enable-intel \
	--enable-radeon \
	--disable-nouveau \
	--enable-vmwgfx \
	--disable-omap-experimental-api \
	--disable-exynos-experimental-api \
	--disable-cairo-tests \
	--with-gnu-ld \
	--disable-valgrind
ifeq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--disable-udev
else
CONFIGURE_ARGS += \
	--enable-udev
endif

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
#	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)_intel.la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)_nouveau.la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)_radeon.la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)_amdgpu.la
	@rm -f $(DESTDIR)$(libdir)/libkms.la
	# Hack needed to build with Mesa 11.0.x
	@mv $(DESTDIR)$(libdir)/libdrm.la $(DESTDIR)$(libdir)/libdrm.la-disabled
	@$(MAKECOOKIE)
