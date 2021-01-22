CATEGORIES = $(CATEGORY)

ifeq (1,1)
GARNAME      = libdrm
GARVERSION   = 2.4.104
MASTER_SITES = http://dri.freedesktop.org/libdrm/
DISTFILES    = $(DISTNAME).tar.xz
PATCHFILES   = Import-sun4i-drm-header-for-MB32-tiled-NV12-support.patch
endif

ifeq (0,1)
# https://github.com/bootlin/libdrm-sun4i/commits/master
GARNAME      = libdrm-sun4i
GARVERSION   = f833c88eaa19f1904e757dd4f26f03819a68421b
MASTER_SITES = https://github.com/bootlin/libdrm-sun4i/archive/
DISTFILES    = $(GARVERSION).zip
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

CONFIGURE_SCRIPTS  = custom
BUILD_SCRIPTS      = custom
INSTALL_SCRIPTS    = custom

CONFIGURE_ARGS = \
	--prefix="$(DESTDIR)" \
	--buildtype=release \
	--optimization=s \
	-D cairo-tests="false" \
	-D man-pages="false" \
	-D valgrind="false" \
	-D intel="true" \
	-D nouveau="false" \

ifeq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--bindir="$(bindir)" \
	--libdir="$(libdir)" \
	--datadir="$(datadir)" \
	--includedir="$(includedir)" \
	-D install-test-programs="false" \
	-D udev="false"
else
CONFIGURE_ARGS += \
	--bindir="$(DESTDIR)$(bindir)" \
	--libdir="$(DESTDIR)$(libdir)" \
	--datadir="$(DESTDIR)$(datadir)" \
	--includedir="$(DESTDIR)$(includedir)" \
	--cross-file=$(build_DESTDIR)$(build_datadir)/meson/cross/$(GARHOST).conf \
	-D install-test-programs="true" \
	-D udev="true"
endif

include ../../gar.mk

configure-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/meson build $(CONFIGURE_ARGS)
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/meson configure build
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/ninja -C build
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/ninja -C build install
	@$(MAKECOOKIE)

post-install:
	@files=`ls -1 $(DESTDIR)$(libdir)/pkgconfig/libdrm*.pc` ; \
	 for file in $${files} ; do \
		 sed -e 's%^prefix=.*%prefix=%g' -i $${file} ; \
	 done
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)_intel.la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)_nouveau.la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)_radeon.la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)_amdgpu.la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)_freedreno.la
	@rm -f $(DESTDIR)$(libdir)/libkms.la
	@$(MAKECOOKIE)
