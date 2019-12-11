
GARNAME      = mesa

ifeq (1,1)
# mesa git@11.12.2019. Working all GLSL on t720/t820/mali405
GARVERSION   = ab5570820071d97c4adfe8cd8a90083f3784fa5e
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://gitlab.freedesktop.org/mesa/mesa/-/archive/$(GARVERSION)/
DISTFILES    = mesa-$(DISTNAME).tar.bz2
#PATCHFILES   = meson-use-softfp-abi-vc4-v3d-tilling.patch
endif

ifeq (0,1)
# testing branch https://gitlab.freedesktop.org/tomeu/mesa/commits/lava-ci-t720-III
GARVERSION   = 5533293dd23d4978ae236ba6027c0e6b9c67358e
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://gitlab.freedesktop.org/tomeu/mesa/-/archive/$(GARVERSION)/
DISTFILES    = mesa-$(DISTNAME).tar.bz2
endif

LICENSE = LGPL2/MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS =                      \
	lang/c                 \
	lang/cxx               \
	lib/expat              \
	X11/libvdpau           \
	devel/llvm             \
	devel/libelf           \
	python/python-mako     \
	xorg/xorgproto         \
	xorg/libdrm            \
	xorg/libX11            \
	xorg/libxcb            \
	xorg/libXdamage        \
	xorg/libXext           \
	xorg/libXfixes         \
	xorg/libXxf86vm        \
	xorg/libxshmfence      \
	xorg/wayland-protocols \
	xorg/wayland           \
	system/eudev           \

BUILDDEPS  = \
	lib/libxml2         \
	python3/python      \
	python3/python-mako \
	python3/meson       \
	opengl/makedepend   \
	xorg/xorgproto      \
	xorg/libxshmfence   \
	xorg/wayland        \

PWD := $(shell pwd)
CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS  = custom
BUILD_SCRIPTS      = custom
INSTALL_SCRIPTS    = custom

include ../../gar.mk

CONFIGURE_ARGS = \
	--prefix="$(DESTDIR)" \
	--libdir="$(DESTDIR)$(libdir)" \
	--includedir="$(DESTDIR)$(includedir)" \
	--datadir="$(DESTDIR)$(datadir)" \
	--cross-file=$(build_DESTDIR)$(build_datadir)/meson/cross/$(GARHOST).conf \
	--buildtype=release \
	--optimization=s \
	-D dri-search-path="/usr/lib/dri" \
	-D shared-glapi=true \
	-D llvm=true \
	-D shared-llvm=true \
	-D gbm=true \
	-D shared-glapi=true \
	-D glx=dri \
	-D egl=true \
	-D gles1=true \
	-D gles2=true \
	-D dri3=true \
	-D gallium-opencl=disabled \
	-D glvnd=false \
	-D gallium-xvmc=false \
	-D gallium-nine=false \
	-D b_lto=false \
	-D b_ndebug=true \
	-D cpp_link_args="-L$(build_DESTDIR)$(build_libdir)/glibc-nptl/" \

ifeq ($(GARCH),armv7)
CONFIGURE_ARGS += \
	-D gallium-drivers=swrast,kmsro,lima,panfrost,vc4,v3d \
	-D dri-drivers= \
	-D platforms=x11,drm \
	-D gallium-vdpau=false \
	-D gallium-xa=false
else
ifeq ($(GARCH),armv8)
CONFIGURE_ARGS += \
	-D gallium-drivers=swrast,kmsro,lima,panfrost,vc4,v3d \
	-D dri-drivers= \
	-D platforms=x11,drm \
	-D gallium-vdpau=false \
	-D gallium-xa=false
else
CONFIGURE_ARGS += \
	-D gallium-drivers=r300,r600,radeonsi,svga,swrast \
	-D dri-drivers=i915,i965,r100,r200 \
	-D platforms=x11,drm \
	-D gallium-vdpau=true \
	-D gallium-xa=true
endif
endif

git//%$(DISTNAME).tar.xz:
	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

pre-configure:
	@#xxxx - fixme
	@rm -f $(DESTDIR)$(libdir)/libcrypt.so.1
	@rm -f $(DESTDIR)$(libdir)/libdl.so.2
	@rm -f $(DESTDIR)$(libdir)/libpthread.so.0
	@rm -f $(DESTDIR)$(libdir)/libm.so.6
	@rm -f $(DESTDIR)$(libdir)/libresolv.so.2
	@rm -f $(DESTDIR)$(libdir)/librt.so.1
	@$(MAKECOOKIE)

configure-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/meson build $(CONFIGURE_ARGS)
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/meson configure build
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

build-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/ninja -C build
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/ninja -C build install
	@$(MAKECOOKIE)

install-source:
	@mkdir -p $(DESTDIR)$(sourcedir)
	@rm -f $(DESTDIR)$(sourcedir)/mesa
	@ln -sf $(PWD)/$(WORKSRC) $(DESTDIR)$(sourcedir)/mesa
	@$(MAKECOOKIE)

install-cross:
	@$(MAKECOOKIE)

post-install:
	@files="dri.pc egl.pc gbm.pc gl.pc glesv1_cm.pc glesv2.pc" ; \
	 for file in $${files} ; do \
		sed \
		-e 's%^prefix=.*%prefix=/usr%g' \
		-e 's%^libdir=.*%libdir=\$$\{prefix\}/lib%g' \
		-e 's%^includedir.*%includedir=\$$\{prefix\}/include%g' \
		-e 's%^dridriverdir.*%dridriverdir=\$$\{libdir\}/dri%g' \
		-i $(DESTDIR)$(libdir)/pkgconfig/$${file} ; \
	 done
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
ifneq ($(DESTIMG),build)
ifneq (,$(findstring vc4,$(mm_GRAPHICS)))
	@echo "--------------------------------------------------------------------------------"     > $(DESTDIR)/usr/share/supported-vc4-gfx-hardware.txt
	@echo "Broadcom VC4 by $(GARNAME)-$(GARVERSION)"                                            >> $(DESTDIR)/usr/share/supported-vc4-gfx-hardware.txt
	@echo "--------------------------------------------------------------------------------"    >> $(DESTDIR)/usr/share/supported-vc4-gfx-hardware.txt
	@echo "Raspberry PI 2/3"                                                                    >> $(DESTDIR)/usr/share/supported-vc4-gfx-hardware.txt
	@echo " "                                                                                   >> $(DESTDIR)/usr/share/supported-vc4-gfx-hardware.txt
endif
ifneq (,$(findstring meson,$(mm_GRAPHICS)))
	@echo "--------------------------------------------------------------------------------"     > $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo "ARM Mali450 by $(GARNAME)-$(GARVERSION)"                                             >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo "--------------------------------------------------------------------------------"    >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo "ARM Mali 450"                                                                        >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo " "                                                                                   >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
endif
endif
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)$(libdir)/libGL*
	@rm -f $(DESTDIR)$(libdir)/libEGL*
	@rm -f $(DESTDIR)$(libdir)/libglapi*
	@rm -f $(DESTDIR)$(libdir)/libgbm*
	@rm -f $(DESTDIR)$(libdir)/libGLESv2*
	@rm -f $(DESTDIR)$(libdir)/libGLESv1_CM*
	@rm -f $(DESTDIR)$(libdir)/libwayland-egl*
	@rm -f $(DESTDIR)$(libdir)/libxatracker*
	@rm -f $(DESTDIR)$(libdir)/dri/gallium_drv_video*
	@rm -f $(DESTDIR)$(libdir)/dri/i915_dri*
	@rm -f $(DESTDIR)$(libdir)/dri/i965_dri*
	@rm -f $(DESTDIR)$(libdir)/dri/r200_dri*
	@rm -f $(DESTDIR)$(libdir)/dri/r300_dri*
	@rm -f $(DESTDIR)$(libdir)/dri/r600_dri*
	@rm -f $(DESTDIR)$(libdir)/dri/radeon_dri*
	@rm -f $(DESTDIR)$(libdir)/dri/radeonsi_dri*
	@rm -f $(DESTDIR)$(libdir)/dri/swrast_dri*
	@rm -f $(DESTDIR)$(libdir)/dri/vmwgfx_dri*
	@rm -f $(DESTDIR)$(libdir)/dri/v3d_dri.so*
	@rm -f $(DESTDIR)$(libdir)/dri/vc4_dri.so*
	@rm -f $(DESTDIR)$(libdir)/dri/radeonsi_drv_video.so*
	@rm -f $(DESTDIR)$(libdir)/dri/r600_drv_video.so*
	@rm -f $(DESTDIR)$(libdir)/dri/kms_swrast_dri.so*
	@rm -f $(DESTDIR)$(libdir)/gallium-pipe/pipe_r600*
	@rm -f $(DESTDIR)$(libdir)/gallium-pipe/pipe_r300*
	@rm -f $(DESTDIR)$(libdir)/gallium-pipe/pipe_i915*
	@rm -f $(DESTDIR)$(libdir)/gallium-pipe/pipe_swrast*
	@rm -f $(DESTDIR)$(libdir)/gallium-pipe/pipe_radeonsi*
	@rm -f $(DESTDIR)$(libdir)/gallium-pipe/pipe_vmwgfx*
	@rm -f $(DESTDIR)$(libdir)/vdpau/libvdpau_r300*
	@rm -f $(DESTDIR)$(libdir)/vdpau/libvdpau_r600*
	@rm -f $(DESTDIR)$(libdir)/vdpau/libvdpau_radeonsi*
	@rm -f $(DESTDIR)$(libdir)/vdpau/libvdpau_softpipe*
	@rm -f $(DESTDIR)$(libdir)/libvdpau_r300*
	@rm -f $(DESTDIR)$(libdir)/libvdpau_r600*
	@rm -f $(DESTDIR)$(libdir)/libvdpau_radeonsi*
	@rm -f $(DESTDIR)$(libdir)/libvdpau_softpipe*
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/d3d.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/dri.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/egl.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/gbm.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/gl.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/glesv1_cm.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/glesv2.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/wayland-egl.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/xatracker.pc
	@rm -f $(DESTDIR)$(includedir)/GL/glcorearb.h
	@rm -f $(DESTDIR)$(includedir)/GL/glext.h
	@rm -f $(DESTDIR)$(includedir)/GL/gl.h
	@rm -f $(DESTDIR)$(includedir)/GL/gl_mangle.h
	@rm -f $(DESTDIR)$(includedir)/GL/glxext.h
	@rm -f $(DESTDIR)$(includedir)/GL/glx.h
	@rm -f $(DESTDIR)$(includedir)/GL/glx_mangle.h
	@rm -f $(DESTDIR)$(includedir)/GL/mesa_glinterop.h
	@rm -f $(DESTDIR)$(includedir)/GL/osmesa.h
	@rm -f $(DESTDIR)$(includedir)/GL/wglext.h
	@rm -f $(DESTDIR)$(includedir)/GL/internal/dri_interface.h
	@rm -rf $(DESTDIR)$(includedir)/EGL*
	@rm -rf $(DESTDIR)$(includedir)/GLES*
	@rm -rf $(DESTDIR)$(includedir)/GLES2*
	@rm -rf $(DESTDIR)$(includedir)/GLES3*
	@rm -rf $(DESTDIR)$(includedir)/KHR*
	@rm -rf $(DESTDIR)$(includedir)/d3dadapter*
	@rm -f $(DESTDIR)$(includedir)/gbm.h
	@rm -f $(DESTDIR)$(includedir)/xa_composite.h
	@rm -f $(DESTDIR)$(includedir)/xa_context.h
	@rm -f $(DESTDIR)$(includedir)/xa_tracker.h
	@rm -rf $(DESTDIR)$(includedir)/vulkan*
	@rm -f $(DESTDIR)/usr/versions/mesa
