
GARNAME      = mesa
GARVERSION   = 21.2.0
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://gitlab.freedesktop.org/mesa/mesa/-/archive/mesa-$(GARVERSION)/
DISTFILES    = mesa-$(DISTNAME).tar.bz2
PATCHFILES   = fix-compile-softfp-abi-on-arm-target.patch
WORKSRC      = $(WORKDIR)/mesa-$(DISTNAME)

DESCRIPTION = 
define BLURB
endef

DEPENDS =                      \
	lang/c                 \
	lang/cxx               \
	lib/expat              \
	X11/libvdpau           \
	X11/libva-minimal      \
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
	wayland/wayland-protocols \
	wayland/wayland-core   \
	system/eudev           \

BUILDDEPS  = \
	lib/libxml2          \
	python3/python       \
	python3/python-mako  \
	devel/meson          \
	opengl/makedepend    \
	xorg/xorgproto       \
	xorg/libxshmfence    \
	wayland/wayland-core \

PWD := $(shell pwd)
CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

include ../../gar.mk

CONFIGURE_ARGS = $(DIRPATHS_MESON) \
	--buildtype=release \
	-D dri-search-path="/usr/lib/dri" \
	-D va-libs-path="$(libdir)" \
	-D vdpau-libs-path="$(libdir)" \
	-D shared-glapi=true \
	-D shared-llvm=enabled \
	-D gbm=enabled \
	-D shared-glapi=enabled \
	-D glx=dri \
	-D egl=enabled \
	-D gles1=enabled \
	-D gles2=enabled \
	-D dri3=enabled \
	-D gallium-opencl=disabled \
	-D glvnd=false \
	-D gallium-xvmc=disabled \
	-D gallium-xa=disabled \
	-D gallium-nine=false \
	-D b_lto=true \
	-D b_ndebug=true \
	-D cpp_link_args="-L$(build_DESTDIR)$(build_libdir)/glibc-nptl/" \
	-D platforms=x11,wayland \
	-D llvm=enabled \

ifeq ($(GARCH),armv7)
CONFIGURE_ARGS += \
	-D gallium-drivers=swrast,kmsro,lima,panfrost,vc4,v3d \
	-D dri-drivers= \
	-D gallium-vdpau=disabled \
	-D gallium-va=disabled
else
ifeq ($(GARCH),armv8)
CONFIGURE_ARGS += \
	-D gallium-drivers=swrast,kmsro,lima,panfrost,vc4,v3d \
	-D dri-drivers= \
	-D gallium-vdpau=disabled \
	-D gallium-va=disabled
else
CONFIGURE_ARGS += \
	-D gallium-drivers=r300,r600,radeonsi,iris,crocus,svga,swrast \
	-D dri-drivers=i915,i965,r100,r200 \
	-D gallium-vdpau=enabled
endif
endif

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
	@echo "Broadcom VC4/V3D by $(GARNAME)-$(GARVERSION)"                                        >> $(DESTDIR)/usr/share/supported-vc4-gfx-hardware.txt
	@echo "--------------------------------------------------------------------------------"    >> $(DESTDIR)/usr/share/supported-vc4-gfx-hardware.txt
	@echo "Raspberry PI 2/3"                                                                    >> $(DESTDIR)/usr/share/supported-vc4-gfx-hardware.txt
	@echo " "                                                                                   >> $(DESTDIR)/usr/share/supported-vc4-gfx-hardware.txt
endif
ifneq (,$(findstring meson,$(mm_GRAPHICS)))
	@echo "--------------------------------------------------------------------------------"     > $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo "ARM Mali Midgard, Utgard and Bifrost 3D in Amlogic SoC by $(GARNAME)-$(GARVERSION)"  >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo "--------------------------------------------------------------------------------"    >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo "Mali Utgard:"                                                                        >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo "    -Mali 400"                                                                       >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo "    -Mali 450"                                                                       >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo " "                                                                                   >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo "Mali Midgard:"                                                                       >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo "    -Mali T720"                                                                      >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo "    -Mali T760"                                                                      >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo "    -Mali T820"                                                                      >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo "    -Mali T860"                                                                      >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo " "                                                                                   >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo "Mali Bifrost:"                                                                       >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo "    -Mali G31"                                                                       >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@echo " "                                                                                   >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
endif
ifneq (,$(findstring rockchip,$(mm_GRAPHICS)))
	@echo "--------------------------------------------------------------------------------"     > $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt
	@echo "ARM Mali Midgard, Utgard and Bifrost 3D in Rockchip SoC by $(GARNAME)-$(GARVERSION)" >> $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt
	@echo "--------------------------------------------------------------------------------"    >> $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt
	@echo "Mali Utgard:"                                                                        >> $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt
	@echo "    -Mali 400"                                                                       >> $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt
	@echo "    -Mali 450"                                                                       >> $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt
	@echo " "                                                                                   >> $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt
	@echo "Mali Midgard:"                                                                       >> $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt
	@echo "    -Mali T720"                                                                      >> $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt
	@echo "    -Mali T760"                                                                      >> $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt
	@echo "    -Mali T820"                                                                      >> $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt
	@echo "    -Mali T860"                                                                      >> $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt
	@echo " "                                                                                   >> $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt
	@echo "Mali Bifrost:"                                                                       >> $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt
	@echo "    -Mali G31"                                                                       >> $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt
	@echo " "                                                                                   >> $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt
endif
ifneq (,$(findstring sun4i,$(mm_GRAPHICS)))
	@echo "--------------------------------------------------------------------------------"     > $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt
	@echo "ARM Mali Midgard, Utgard and Bifrost 3D in Allwinner SoC by $(GARNAME)-$(GARVERSION)" >> $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt
	@echo "--------------------------------------------------------------------------------"    >> $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt
	@echo "Mali Utgard:"                                                                        >> $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt
	@echo "    -Mali 400"                                                                       >> $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt
	@echo "    -Mali 450"                                                                       >> $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt
	@echo " "                                                                                   >> $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt
	@echo "Mali Midgard:"                                                                       >> $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt
	@echo "    -Mali T720"                                                                      >> $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt
	@echo "    -Mali T760"                                                                      >> $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt
	@echo "    -Mali T820"                                                                      >> $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt
	@echo "    -Mali T860"                                                                      >> $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt
	@echo " "                                                                                   >> $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt
	@echo "Mali Bifrost:"                                                                       >> $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt
	@echo "    -Mali G31"                                                                       >> $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt
	@echo " "                                                                                   >> $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt
endif
endif
	@rm -f "$(DESTDIR)/usr/share/supported-intel-gfx-hardware.txt"
	@# Generate udev rules for Intel i810
	@cd files/udev-generator; ./generate-x-udev-rules.sh \
		"../../$(WORKSRC)/include/pci_ids/i810_pci_ids.h" \
		"../../../../../script/meta/minimyth/files/source/rootfs/usr/lib/udev/rules.d/05-minimyth-detect-x-i810.rules.disabled" \
		"$(DESTDIR)/usr/share/supported-intel-gfx-hardware.txt" \
		"8086" \
		"intel_i915" \
		"intel_vaapi" \
		"./i810_names_with_HW_accell.lst" \
		"i810"
	@# Generate udev rules for Intel i915
	@cd files/udev-generator; ./generate-x-udev-rules.sh \
		"../../$(WORKSRC)/include/pci_ids/i915_pci_ids.h" \
		"../../../../../script/meta/minimyth/files/source/rootfs/usr/lib/udev/rules.d/05-minimyth-detect-x-i915.rules.disabled" \
		"$(DESTDIR)/usr/share/supported-intel-gfx-hardware.txt" \
		"8086" \
		"intel_i915" \
		"intel_vaapi" \
		"./i915_names_with_HW_accell.lst" \
		"i915"
	@# Generate udev rules for Intel i965
	@cd files/udev-generator; ./generate-x-udev-rules.sh \
		"../../$(WORKSRC)/include/pci_ids/i965_pci_ids.h" \
		"../../../../../script/meta/minimyth/files/source/rootfs/usr/lib/udev/rules.d/05-minimyth-detect-x-i965.rules.disabled" \
		"$(DESTDIR)/usr/share/supported-intel-gfx-hardware.txt" \
		"8086" \
		"intel_i915" \
		"intel_vaapi" \
		"./i965_names_with_HW_accell.lst" \
		"i965"
	@# Generate udev rules for Intel iris
	@cd files/udev-generator; ./generate-x-udev-rules.sh \
		"../../$(WORKSRC)/include/pci_ids/iris_pci_ids.h" \
		"../../../../../script/meta/minimyth/files/source/rootfs/usr/lib/udev/rules.d/05-minimyth-detect-x-iris.rules.disabled" \
		"$(DESTDIR)/usr/share/supported-intel-gfx-hardware.txt" \
		"8086" \
		"intel_i915" \
		"intel_vaapi" \
		"./iris_names_with_HW_accell.lst" \
		"iris"
	@rm -f "$(DESTDIR)/usr/share/supported-ati-gfx-hardware.txt"
	@# Generate udev rules for AMD r200
	@cd files/udev-generator; ./generate-x-udev-rules.sh \
		"../../$(WORKSRC)/include/pci_ids/r200_pci_ids.h" \
		"../../../../../script/meta/minimyth/files/source/rootfs/usr/lib/udev/rules.d/05-minimyth-detect-x-r200.rules.disabled" \
		"$(DESTDIR)/usr/share/supported-ati-gfx-hardware.txt" \
		"1002" \
		"radeon" \
		"radeon_vaapi" \
		"./r200_names_with_HW_accell.lst" \
		"r200"
	@cd files/udev-generator; ./generate-x-udev-rules.sh \
		"../../$(WORKSRC)/include/pci_ids/r300_pci_ids.h" \
		"../../../../../script/meta/minimyth/files/source/rootfs/usr/lib/udev/rules.d/05-minimyth-detect-x-r300.rules.disabled" \
		"$(DESTDIR)/usr/share/supported-ati-gfx-hardware.txt" \
		"1002" \
		"radeon" \
		"radeon_vaapi" \
		"./r300_names_with_HW_accell.lst" \
		"r300"
	@cd files/udev-generator; ./generate-x-udev-rules.sh \
		"../../$(WORKSRC)/include/pci_ids/r600_pci_ids.h" \
		"../../../../../script/meta/minimyth/files/source/rootfs/usr/lib/udev/rules.d/05-minimyth-detect-x-r600.rules.disabled" \
		"$(DESTDIR)/usr/share/supported-ati-gfx-hardware.txt" \
		"1002" \
		"radeon" \
		"radeon_vaapi" \
		"./r600_names_with_HW_accell.lst" \
		"r600"
	@cd files/udev-generator; ./generate-x-udev-rules.sh \
		"../../$(WORKSRC)/include/pci_ids/radeon_pci_ids.h" \
		"../../../../../script/meta/minimyth/files/source/rootfs/usr/lib/udev/rules.d/05-minimyth-detect-x-radeon.rules.disabled" \
		"$(DESTDIR)/usr/share/supported-ati-gfx-hardware.txt" \
		"1002" \
		"radeon" \
		"radeon_vaapi" \
		"./radeon_names_with_HW_accell.lst" \
		"radeon"
	@cd files/udev-generator; ./generate-x-udev-rules.sh \
		"../../$(WORKSRC)/include/pci_ids/radeonsi_pci_ids.h" \
		"../../../../../script/meta/minimyth/files/source/rootfs/usr/lib/udev/rules.d/05-minimyth-detect-x-radeonsi.rules.disabled" \
		"$(DESTDIR)/usr/share/supported-ati-gfx-hardware.txt" \
		"1002" \
		"radeon" \
		"radeon_vaapi" \
		"./radeonsi_names_with_HW_accell.lst" \
		"radeonsi"
	@rm -f "$(DESTDIR)/usr/share/supported-vmwgfx-gfx-hardware.txt"
	@cd files/udev-generator; ./generate-x-udev-rules.sh \
		"../../$(WORKSRC)/include/pci_ids/vmwgfx_pci_ids.h" \
		"../../../../../script/meta/minimyth/files/source/rootfs/usr/lib/udev/rules.d/05-minimyth-detect-x-vmwgfx.rules.disabled" \
		"$(DESTDIR)/usr/share/supported-vmwgfx-gfx-hardware.txt" \
		"15ad" \
		"vmware" \
		"vmware" \
		"./vmwgfx_names_with_HW_accell.lst" \
		"vmwgfx"
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)$(libdir)/libGL.*
	@rm -f $(DESTDIR)$(libdir)/libEGL.*
	@rm -f $(DESTDIR)$(libdir)/libglapi.*
	@rm -f $(DESTDIR)$(libdir)/libgbm.*
	@rm -f $(DESTDIR)$(libdir)/libGLESv2.*
	@rm -f $(DESTDIR)$(libdir)/libGLESv1_CM.*
	@rm -f $(DESTDIR)$(libdir)/libxatracker.*
	@rm -f $(DESTDIR)$(libdir)/libvulkan_radeon.so*
	@rm -f $(DESTDIR)$(libdir)/libvulkan_intel.so*
	@rm -f $(DESTDIR)$(libdir)/dri/gallium_drv_video.*
	@rm -f $(DESTDIR)$(libdir)/dri/i915_dri.*
	@rm -f $(DESTDIR)$(libdir)/dri/i965_dri.*
	@rm -f $(DESTDIR)$(libdir)/dri/r200_dri.*
	@rm -f $(DESTDIR)$(libdir)/dri/r300_dri.*
	@rm -f $(DESTDIR)$(libdir)/dri/r600_dri.*
	@rm -f $(DESTDIR)$(libdir)/dri/radeon_dri.*
	@rm -f $(DESTDIR)$(libdir)/dri/radeonsi_dri.*
	@rm -f $(DESTDIR)$(libdir)/dri/swrast_dri.*
	@rm -f $(DESTDIR)$(libdir)/dri/vmwgfx_dri.*
	@rm -f $(DESTDIR)$(libdir)/dri/v3d_dri.so.*
	@rm -f $(DESTDIR)$(libdir)/dri/vc4_dri.so.*
	@rm -f $(DESTDIR)$(libdir)/dri/radeonsi_drv_video.so*
	@rm -f $(DESTDIR)$(libdir)/dri/r600_drv_video.so*
	@rm -f $(DESTDIR)$(libdir)/dri/kms_swrast_dri.so*
	@rm -f $(DESTDIR)$(libdir)/gallium-pipe/pipe_r600*
	@rm -f $(DESTDIR)$(libdir)/gallium-pipe/pipe_r300*
	@rm -f $(DESTDIR)$(libdir)/gallium-pipe/pipe_i915*
	@rm -f $(DESTDIR)$(libdir)/gallium-pipe/pipe_swrast*
	@rm -f $(DESTDIR)$(libdir)/gallium-pipe/pipe_radeonsi*
	@rm -f $(DESTDIR)$(libdir)/gallium-pipe/pipe_vmwgfx*
	@rm -f $(DESTDIR)$(libdir)/libvdpau_r300*
	@rm -f $(DESTDIR)$(libdir)/libvdpau_r600*
	@rm -f $(DESTDIR)$(libdir)/libvdpau_radeonsi*
	@rm -f $(DESTDIR)$(libdir)/libvdpau_softpipe*
	@rm -f $(DESTDIR)$(libdir)/radeonsi_drv_video.so*
	@rm -f $(DESTDIR)$(libdir)/r600_drv_video.so*
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
