
CATEGORIES = $(CATEGORY)
GARNAME      = libdrm
GARVERSION   = 2.4.122
MASTER_SITES = http://dri.freedesktop.org/libdrm/
DISTFILES    = $(DISTNAME).tar.xz

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
	-D cairo-tests="disabled" \
	-D man-pages="disabled" \
	-D valgrind="disabled" \
	-D intel="enabled" \
	-D amdgpu="enabled" \
	-D vmwgfx="enabled" \
	-D nouveau="enabled" \
	-D vc4="enabled" \

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
