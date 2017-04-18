GARNAME = mesa
# GARVERSION_TYPE = git
GARVERSION = $(strip $(if $(filter git,$(GARVERSION_TYPE)) , \
             20160518-877a802, \
             17.0.4 ))
CATEGORIES = $(CATEGORY)
MASTER_SITES = $(strip $(if $(filter git,$(GARVERSION_TYPE)) , \
             git://anongit.freedesktop.org/mesa/mesa/ , \
             ftp://ftp.freedesktop.org/pub/mesa/ ))
#             ftp://ftp.freedesktop.org/pub/mesa/$(GARVERSION)/ ))
DISTFILES = $(DISTNAME).tar.xz
LICENSE = LGPL2/MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c lang/cxx lib/expat X11/libvdpau devel/llvm lib/libelf python/python-mako \
	$(CATEGORY)/dri2proto \
	$(CATEGORY)/dri3proto \
	$(CATEGORY)/xextproto \
	$(CATEGORY)/glproto \
	$(CATEGORY)/libdrm \
	$(CATEGORY)/libX11 \
	$(CATEGORY)/libxcb \
	$(CATEGORY)/libXdamage \
	$(CATEGORY)/libXext \
	$(CATEGORY)/libXfixes \
	$(CATEGORY)/libXxf86vm \
	$(CATEGORY)/libxshmfence \
	$(CATEGORY)/presentproto

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
	--with-dri-driverdir="$(libdir)/dri" \
	--with-vdpau-libdir="$(libdir)" \
	--with-gallium-drivers=r300,r600,radeonsi,svga,swrast \
	--with-dri-drivers=i915,i965,r200,radeon,swrast \
	--with-egl-platforms=x11,drm \
	--enable-llvm-shared-libs \
	--enable-egl \
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
	--enable-dri3 \
	LIBUDEV_CFLAGS="$(DESTDIR)$(includedir)" \
	LIBUDEV_LIBS="$(DESTDIR)$(libdir)/libudev.so"

# Mesa 11+ has bug with honouring vdpau dir durring configure
#	--with-vdpau-libdir="$(libdir)/vdpau" \
#	--with-vdpau-libdir="$(libdir)" \

BUILD_ARGS  = \
	HOST_CC="$(build_CC)" \
	HOST_CFLAGS="$(build_CFLAGS)"

CPPFLAGS += -ffat-lto-objects
CXXFLAGS += -ffat-lto-objects
CFLAGS   += -ffat-lto-objects

include ../../gar.mk

git//%$(DISTNAME).tar.xz:
	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
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
	@rm -f $(DESTDIR)$(libdir)/libGL.la
	@rm -f $(DESTDIR)$(libdir)/libEGL.la
	@rm -f $(DESTDIR)$(libdir)/libglapi.la
	@rm -f $(DESTDIR)$(libdir)/libgbm.la
	@rm -f $(DESTDIR)$(libdir)/libGLESv2.la
	@rm -f $(DESTDIR)$(libdir)/libGLESv1_CM.la
	@rm -f $(DESTDIR)$(libdir)/libxatracker.la
	@rm -f $(DESTDIR)$(libdir)/dri/gallium_drv_video.la
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
	@$(MAKECOOKIE)
