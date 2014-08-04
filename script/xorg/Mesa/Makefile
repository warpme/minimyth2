GARNAME = Mesa
GARVERSION = 10.2.5
CATEGORIES = $(CATEGORY)
MASTER_SITES = ftp://ftp.freedesktop.org/pub/mesa/$(GARVERSION)/
DISTFILES = MesaLib-$(GARVERSION).tar.bz2
LICENSE = LGPL2/MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c lang/cxx lib/expat X11/libvdpau devel/llvm lib/libelf \
	$(CATEGORY)/dri2proto \
	$(CATEGORY)/xextproto \
	$(CATEGORY)/glproto \
	$(CATEGORY)/libdrm \
	$(CATEGORY)/libX11 \
	$(CATEGORY)/libxcb \
	$(CATEGORY)/libXdamage \
	$(CATEGORY)/libXext \
	$(CATEGORY)/libXfixes \
	$(CATEGORY)/libXxf86vm

ifneq ($(DESTIMG),build)
DEPENDS   += system/udev
endif
BUILDDEPS  = lib/libxml2 python/python \
	$(CATEGORY)/makedepend
ifneq ($(DESTIMG),build)
BUILDDEPS += $(CATEGORY)/Mesa
endif

PWD := $(shell pwd)
CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile source
ifeq ($(DESTIMG),build)
INSTALL_SCRIPTS   += cross
endif

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	$(if $(filter i386  , $(GARCH_FAMILY)),--enable-32-bit) \
	$(if $(filter x86_64, $(GARCH_FAMILY)),--enable-64-bit) \
	--disable-static \
	--enable-shared \
	--disable-debug \
	--disable-mangling \
	--disable-texture-float \
	--enable-asm \
	--disable-selinux \
	--enable-opengl \
	--disable-gles1 \
	--disable-gles2 \
	--disable-openvg \
	--enable-dri \
	--enable-glx \
	--disable-osmesa \
	--disable-gallium-osmesa \
	--disable-egl \
	--enable-xa \
	--disable-gbm \
	--disable-xvmc \
	--enable-vdpau \
	--disable-opencl \
	--disable-opencl-icd \
	--disable-xlib-glx \
	--disable-gallium-egl \
	--disable-gallium-gbm \
	--disable-r600-llvm-compiler \
	--disable-gallium-tests \
	--disable-shared-glapi \
	--disable-dri3 \
	--enable-driglx-direct \
	--disable-glx-tls \
	--enable-gallium-llvm \
	--with-llvm-shared-libs \
	--with-gallium-drivers="i915,r300,r600,radeonsi,svga,swrast" \
	--with-dri-driverdir="$(libdir)/dri" \
	--with-dri-drivers="i915,i965,r200,radeon,swrast" \
	--with-vdpau-libdir="$(libdir)/vdpau" \
	PKG_CONFIG_PATH="$(DESTDIR)$(libdir)/pkgconfig" \
	LIBUDEV_CFLAGS="$(DESTDIR)$(includedir)" \
	LIBUDEV_LIBS="$(DESTDIR)$(libdir)/libudev.so"

BUILD_ARGS  = \
	HOST_CC="$(build_CC)" \
	HOST_CFLAGS="$(build_CFLAGS)"

include ../../gar.mk

CFLAGS   := $(filter-out -O%, $(CFLAGS)) -Os
CXXFLAGS := $(filter-out -O%, $(CXXFLAGS)) -Os

git//%MesaLib-$(GARVERSION).tar.bz2:
	@$(call FETCH_GIT, $*, $(word 3,$(subst -, ,$(GARVERSION))), MesaLib-$(GARVERSION))
	@cd $(PARTIALDIR) ; tar -jxf MesaLib-$(GARVERSION).tar.bz2
	@cd $(PARTIALDIR) ; mv MesaLib-$(GARVERSION) $(DISTNAME)
	@cd $(PARTIALDIR) ; rm -rf   $(DISTNAME).tar.bz2
	@cd $(PARTIALDIR) ; tar -jcf MesaLib-$(GARVERSION).tar.bz2 $(DISTNAME)
	@cd $(PARTIALDIR) ; rm -rf                                 $(DISTNAME)
	@$(MAKECOOKIE)

x-checksum-MesaLib-$(GARVERSION).tar.bz2:
	@$(MAKECOOKIE) 

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(MAKECOOKIE)

install-source:
	@mkdir -p $(DESTDIR)$(sourcedir)
	@rm -f $(DESTDIR)$(sourcedir)/Mesa
	@ln -sf $(PWD)/$(WORKSRC) $(DESTDIR)$(sourcedir)/Mesa
	@$(MAKECOOKIE)

install-cross:
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/dri/i915_dri.la
	@rm -f $(DESTDIR)$(libdir)/dri/i965_dri.la
	@rm -f $(DESTDIR)$(libdir)/dri/r200_dri.la
	@rm -f $(DESTDIR)$(libdir)/dri/r300_dri.la
	@rm -f $(DESTDIR)$(libdir)/dri/r600_dri.la
	@rm -f $(DESTDIR)$(libdir)/dri/radeon_dri.la
	@rm -f $(DESTDIR)$(libdir)/dri/radeonsi_dri.la
	@rm -f $(DESTDIR)$(libdir)/dri/swrast_dri.la
	@rm -f $(DESTDIR)$(libdir)/dri/vmwgfx_dri.la
	@rm -f $(DESTDIR)$(libdir)/vdpau/libvdpau_r300.la
	@rm -f $(DESTDIR)$(libdir)/vdpau/libvdpau_r600.la
	@rm -f $(DESTDIR)$(libdir)/vdpau/libvdpau_radeonsi.la
	@rm -f $(DESTDIR)$(libdir)/vdpau/libvdpau_softpipe.la
	@$(MAKECOOKIE)
