GARNAME = mesa
# GARVERSION_TYPE = git
GARVERSION = $(strip $(if $(filter git,$(GARVERSION_TYPE)) , \
             20160518-877a802, \
             18.1.5 ))
CATEGORIES = $(CATEGORY)
MASTER_SITES = $(strip $(if $(filter git,$(GARVERSION_TYPE)) , \
             git://anongit.freedesktop.org/mesa/mesa/ , \
             ftp://ftp.freedesktop.org/pub/mesa/ ))
DISTFILES = $(DISTNAME).tar.xz
LICENSE = LGPL2/MIT

DESCRIPTION = 
define BLURB
endef

# automatic variables cannot be used in conditional directives, as automatic variables are not set until the recipe for that rule is invoked.
# We must use shell to get conditional variable :-(((((
CPU_ARCH = $(shell cat ~/.minimyth/minimyth.conf.mk | grep "^mm_GARCH\s*?=" | sed -e "s/\s*//g" | sed -e "s/mm_GARCH?=//")
# $(warning GARCH from minimyth.conf:$(CPU_ARCH))


DEPENDS    = lang/c lang/cxx lib/expat X11/libvdpau devel/llvm devel/libelf python/python-mako \
	$(CATEGORY)/xorgproto \
	$(CATEGORY)/libdrm \
	$(CATEGORY)/libX11 \
	$(CATEGORY)/libxcb \
	$(CATEGORY)/libXdamage \
	$(CATEGORY)/libXext \
	$(CATEGORY)/libXfixes \
	$(CATEGORY)/libXxf86vm \
	$(CATEGORY)/libxshmfence \
	$(CATEGORY)/wayland-protocols \
	$(CATEGORY)/wayland

ifneq ($(DESTIMG),build)
DEPENDS   += system/eudev
endif
BUILDDEPS  = lib/libxml2 python/python \
	$(CATEGORY)/makedepend \
	$(CATEGORY)/xorgproto \
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
	--with-platforms=x11,wayland,drm \
	--enable-llvm \
	--enable-llvm-shared-libs \
	--enable-texture-float \
	--enable-gbm \
	--enable-shared-glapi \
	--enable-glx \
	--enable-glx-tls \
	--enable-egl \
	--enable-gles1 \
	--enable-gles2 \
	--enable-dri \
	--enable-dri3 \
	--enable-vdpau \
	--disable-opencl \
	--disable-opencl-icd \
	--disable-libglvnd \
	LIBUDEV_CFLAGS="$(DESTDIR)$(includedir)" \
	LIBUDEV_LIBS="$(DESTDIR)$(libdir)/libudev.so"

ifeq ($(CPU_ARCH),armv7)
CONFIGURE_ARGS += \
	--with-gallium-drivers=swrast,vc4 \
	--with-dri-drivers=swrast \
	--disable-xa
else
ifeq ($(CPU_ARCH),armv8)
CONFIGURE_ARGS += \
	--with-gallium-drivers=swrast,vc4 \
	--with-dri-drivers=swrast \
	--disable-xa
else
CONFIGURE_ARGS += \
	--with-gallium-drivers=r300,r600,radeonsi,svga,swrast \
	--with-dri-drivers=i915,i965,r200,radeon,swrast \
	--enable-xa
endif
endif

ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += LDFLAGS="-L$(build_DESTDIR)$(build_libdir)/glibc-nptl/"
endif

# Mesa 11+ has bug with honouring vdpau dir durring configure
#	--with-vdpau-libdir="$(libdir)/vdpau" \

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
	@#xxxx - fixme
	@rm -f $(DESTDIR)$(libdir)/libcrypt.so.1
	@rm -f $(DESTDIR)$(libdir)/libdl.so.2
	@rm -f $(DESTDIR)$(libdir)/libpthread.so.0
	@rm -f $(DESTDIR)$(libdir)/libm.so.6
	@rm -f $(DESTDIR)$(libdir)/libresolv.so.2
	@rm -f $(DESTDIR)$(libdir)/librt.so.1
	@$(MAKECOOKIE)

post-configure:
	@#xxxx - fixme
	@if [ -e $(DESTDIR)$(elibdir64)/libcrypt.so.1   ] ; then rm -f $(DESTDIR)$(libdir)/libcrypt.so.1   ; ln -sr $(DESTDIR)$(elibdir64)/libcrypt.so.1   $(DESTDIR)$(libdir)/libcrypt.so.1   ; fi
	@if [ -e $(DESTDIR)$(elibdir64)/libdl.so.2      ] ; then rm -f $(DESTDIR)$(libdir)/libdl.so.2      ; ln -sr $(DESTDIR)$(elibdir64)/libdl.so.2      $(DESTDIR)$(libdir)/libdl.so.2      ; fi
	@if [ -e $(DESTDIR)$(elibdir64)/libpthread.so.0 ] ; then rm -f $(DESTDIR)$(libdir)/libpthread.so.0 ; ln -sr $(DESTDIR)$(elibdir64)/libpthread.so.0 $(DESTDIR)$(libdir)/libpthread.so.0 ; fi
	@if [ -e $(DESTDIR)$(elibdir64)/libm.so.6       ] ; then rm -f $(DESTDIR)$(libdir)/libm.so.6       ; ln -sr $(DESTDIR)$(elibdir64)/libm.so.6       $(DESTDIR)$(libdir)/libm.so.6       ; fi
	@if [ -e $(DESTDIR)$(elibdir64)/libresolv.so.2  ] ; then rm -f $(DESTDIR)$(libdir)/libresolv.so.2  ; ln -sr $(DESTDIR)$(elibdir64)/libresolv.so.2  $(DESTDIR)$(libdir)/libresolv.so.2  ; fi
	@if [ -e $(DESTDIR)$(elibdir64)/librt.so.1      ] ; then rm -f $(DESTDIR)$(libdir)/librt.so.1      ; ln -sr $(DESTDIR)$(elibdir64)/librt.so.1      $(DESTDIR)$(libdir)/librt.so.1      ; fi
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
	@rm -f $(DESTDIR)$(libdir)/libwayland-egl.la
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
