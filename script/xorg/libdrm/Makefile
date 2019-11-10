CATEGORIES = $(CATEGORY)

ifeq (1,1)
GARNAME = libdrm
GARVERSION = 2.4.100
MASTER_SITES = http://dri.freedesktop.org/libdrm/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = Import-sun4i-drm-header-for-MB32-tiled-NV12-support.patch
endif

ifeq (0,1)
# https://github.com/bootlin/libdrm-sun4i/commits/master
GARNAME = libdrm-sun4i
GARVERSION = f833c88eaa19f1904e757dd4f26f03819a68421b
MASTER_SITES = https://github.com/bootlin/libdrm-sun4i/archive/
DISTFILES = $(GARVERSION).zip
endif

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
	--enable-vc4 \
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
	@cp -f $(WORKSRC)/tests/modetest/.libs/modetest $(DESTDIR)$(bindir)/modetest
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)_intel.la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)_nouveau.la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)_radeon.la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)_amdgpu.la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)_freedreno.la
	@rm -f $(DESTDIR)$(libdir)/libkms.la
	@$(MAKECOOKIE)
