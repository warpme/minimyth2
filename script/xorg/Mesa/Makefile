GARNAME = mesa
GARVERSION = 10.5.5
CATEGORIES = $(CATEGORY)
MASTER_SITES = ftp://ftp.freedesktop.org/pub/mesa/$(GARVERSION)/
DISTFILES = mesa-$(GARVERSION).tar.xz
LICENSE = LGPL2/MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c lang/cxx lib/expat X11/libvdpau devel/llvm lib/libelf python/python-mako \
	$(CATEGORY)/dri2proto \
	$(CATEGORY)/xextproto \
	$(CATEGORY)/glproto \
	$(CATEGORY)/libdrm \
	$(CATEGORY)/libX11 \
	$(CATEGORY)/libxcb \
	$(CATEGORY)/libXdamage \
	$(CATEGORY)/libXext \
	$(CATEGORY)/libXfixes \
	$(CATEGORY)/libXxf86vm \
	$(CATEGORY)/libxshmfence

ifneq ($(DESTIMG),build)
DEPENDS   += system/udev
endif
BUILDDEPS  = lib/libxml2 python/python \
	$(CATEGORY)/makedepend \
	$(CATEGORY)/dri3proto \
	$(CATEGORY)/presentproto \
	$(CATEGORY)/libxshmfence
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
	--disable-static \
	--enable-shared \
	$(if $(filter i386  , $(GARCH_FAMILY)),--enable-32-bit) \
	$(if $(filter x86_64, $(GARCH_FAMILY)),--enable-64-bit) \
	--with-dri-driverdir="$(libdir)/dri" \
	--with-vdpau-libdir="$(libdir)" \
	--with-gallium-drivers=r300,r600,radeonsi,svga,swrast \
	--with-dri-drivers=i915,i965,r200,radeon,swrast \
	--with-egl-platforms=x11,drm \
	--enable-llvm-shared-libs \
	--enable-egl \
	--disable-gallium-egl \
	--disable-gallium-gbm \
	--enable-gbm \
	--enable-gallium-llvm \
	--enable-shared-glapi \
	--enable-glx \
	--enable-glx-tls \
	--enable-dri \
	--disable-gles1 \
	--disable-gles2 \
	--enable-texture-float \
	--enable-xa \
	--enable-vdpau \
	--disable-opencl \
	--disable-opencl-icd \
	LIBUDEV_CFLAGS="$(DESTDIR)$(includedir)" \
	LIBUDEV_LIBS="$(DESTDIR)$(libdir)/libudev.so"

#	--with-vdpau-libdir="$(libdir)/vdpau" \
#	--with-vdpau-libdir="$(libdir)" \

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
	#Hack needed to build Mesa with libxcb1.17
	@ln -sf $(DESTDIR)$(libdir)/libxcb.la-disabled $(DESTDIR)$(libdir)/libxcb.la
	@$(MAKECOOKIE)

install-source:
	@mkdir -p $(DESTDIR)$(sourcedir)
	@rm -f $(DESTDIR)$(sourcedir)/Mesa
	@ln -sf $(PWD)/$(WORKSRC) $(DESTDIR)$(sourcedir)/Mesa
	@$(MAKECOOKIE)

install-cross:
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libGL.la
	@rm -f $(DESTDIR)$(libdir)/libEGL.la
	@rm -f $(DESTDIR)$(libdir)/libglapi.la
	@rm -f $(DESTDIR)$(libdir)/libgbm.la
	@rm -f $(DESTDIR)$(libdir)/libGLESv2.la
	@rm -f $(DESTDIR)$(libdir)/libGLESv1_CM.la
	@rm -f $(DESTDIR)$(libdir)/libxatracker.la
	@rm -f $(DESTDIR)$(libdir)/dri/i915_dri.la
	@rm -f $(DESTDIR)$(libdir)/dri/i965_dri.la
	@rm -f $(DESTDIR)$(libdir)/dri/r200_dri.la
	@rm -f $(DESTDIR)$(libdir)/dri/r300_dri.la
	@rm -f $(DESTDIR)$(libdir)/dri/r600_dri.la
	@rm -f $(DESTDIR)$(libdir)/dri/radeon_dri.la
	@rm -f $(DESTDIR)$(libdir)/dri/radeonsi_dri.la
	@rm -f $(DESTDIR)$(libdir)/dri/swrast_dri.la
	@rm -f $(DESTDIR)$(libdir)/dri/vmwgfx_dri.la
	@rm -f $(DESTDIR)$(libdir)/gallium-pipe/pipe_r600.la
	@rm -f $(DESTDIR)$(libdir)/gallium-pipe/pipe_r300.la
	@rm -f $(DESTDIR)$(libdir)/gallium-pipe/pipe_i915.la
	@rm -f $(DESTDIR)$(libdir)/gallium-pipe/pipe_swrast.la
	@rm -f $(DESTDIR)$(libdir)/gallium-pipe/pipe_radeonsi.la
	@rm -f $(DESTDIR)$(libdir)/gallium-pipe/pipe_vmwgfx.la
	@rm -f $(DESTDIR)$(libdir)/vdpau/libvdpau_r300.la
	@rm -f $(DESTDIR)$(libdir)/vdpau/libvdpau_r600.la
	@rm -f $(DESTDIR)$(libdir)/vdpau/libvdpau_radeonsi.la
	@rm -f $(DESTDIR)$(libdir)/vdpau/libvdpau_softpipe.la
	@rm -f $(DESTDIR)$(libdir)/libvdpau_r300.la
	@rm -f $(DESTDIR)$(libdir)/libvdpau_r600.la
	@rm -f $(DESTDIR)$(libdir)/libvdpau_radeonsi.la
	@rm -f $(DESTDIR)$(libdir)/libvdpau_softpipe.la
	@#Remove Hack needed to build Mesa with libxcb1.17
	@rm -f $(DESTDIR)$(libdir)/libxcb.la
	@$(MAKECOOKIE)
