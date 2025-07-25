
GARNAME      = mesa
GARVERSION   = 25.1.6
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://gitlab.freedesktop.org/mesa/mesa/-/archive/mesa-$(GARVERSION)/
DISTFILES    = mesa-$(DISTNAME).tar.gz
WORKSRC      = $(WORKDIR)/mesa-$(DISTNAME)

DESCRIPTION = 
define BLURB
endef

ifneq ($(DESTIMG),build)
# deps for target
DEPENDS =                      \
	lang/c                 \
	lang/cxx               \
	lib/expat              \
	X11/libvdpau           \
	X11/libva-minimal      \
	devel/llvm             \
	devel/libelf           \
	python2/python-mako    \
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
	devel/llvm             \

BUILDDEPS  = \
	lib/libxml2          \
	python3/python       \
	python3/python-ply   \
	python3/python-mako  \
	python3/python-pyyaml \
	devel/meson          \
	xorg/xorgproto       \
	xorg/libxshmfence    \
	wayland/wayland-core \
	opengl/glslang       \
	devel/llvm           \
	opengl/mesa          \

else
# deps for build
DEPENDS =                    \
	lib/libxml2          \
	python3/python       \
	python3/python-ply   \
	python3/python-mako  \
	python3/python-pyyaml \
	devel/meson          \
	opengl/glslang       \
	devel/llvm           \
	lib/SPIRV-LLVM-Translator \
	xorg/libdrm            \

endif

PWD := $(shell pwd)
CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS_BUILD = \
	-D glvnd=disabled \
	-D gallium-drivers=iris \
	-D gallium-vdpau=disabled \
	-D platforms= \
	-D glx=disabled \
	-D vulkan-drivers= \
	-D install-mesa-clc=true \
	-D tools=panfrost \
	-D precomp-compiler=enabled \
	-D install-precomp-compiler=true \
	-D shared-llvm=disabled \

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D dri-drivers-path="/usr/lib/dri" \
	-D va-libs-path="$(libdir)" \
	-D vdpau-libs-path="$(libdir)" \
	-D shared-llvm=enabled \
	-D gbm=enabled \
	-D glx=dri \
	-D egl=enabled \
	-D gles1=enabled \
	-D gles2=enabled \
	-D glvnd=disabled \
	-D b_lto=true \
	-D b_ndebug=true \
	-D cpp_link_args="-L$(build_DESTDIR)$(build_libdir)/glibc-nptl/" \
	-D platforms=x11,wayland \
	-D vulkan-drivers=amd,intel \
	-D gallium-rusticl=false \
	-D microsoft-clc=disabled \
	-D install-intel-clc=false \
	-D llvm=enabled \
	-D mesa-clc=system \

include ../../gar.mk

ifeq ($(GARCH),armv7)
MESON_CONFIGURE_ARGS += \
	-D gallium-drivers=swrast,lima,panfrost,vc4,v3d \
	-D gallium-vdpau=disabled \
	-D gallium-va=disabled \
	-D vulkan-drivers= \
	-D precomp-compiler=system \
	-D c_args="-mfpu=neon -mfloat-abi=softfp" \

else
ifeq ($(GARCH),armv8)
MESON_CONFIGURE_ARGS += \
	-D gallium-drivers=lima,panfrost,vc4,v3d \
	-D gallium-vdpau=disabled \
	-D gallium-va=disabled \
	-D vulkan-drivers= \
	-D precomp-compiler=system \

else
MESON_CONFIGURE_ARGS += \
	-D gallium-drivers=radeonsi,iris,crocus,nouveau \
	-D gallium-vdpau=enabled \
	-D gallium-va=enabled \
	-D video-codecs=vc1dec,h264dec,h265dec \

endif
endif

post-install:
	@sed 's|prefix=.*|prefix=/usr\nlibdir=\$${prefix}/lib|g' -i $(DESTDIR)$(libdir)/pkgconfig/dri.pc
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
	@cat $(WORKSRC)/docs/drivers/vc4.rst | sed -n '1,29 p' >  $(DESTDIR)/usr/share/supported-vc4-gfx-hardware.txt
	@cat $(WORKSRC)/docs/drivers/v3d.rst | sed -n '1,17 p' >> $(DESTDIR)/usr/share/supported-vc4-gfx-hardware.txt
endif
ifneq (,$(findstring meson rockchip sun4i,$(mm_GRAPHICS)))
	@cat $(WORKSRC)/docs/drivers/lima.rst     | sed -n '1,19 p' >  $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
	@cat $(WORKSRC)/docs/drivers/panfrost.rst | sed -n '1,38 p' >> $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt
endif
ifneq (,$(findstring rockchip,$(mm_GRAPHICS)))
	@cat $(WORKSRC)/docs/drivers/lima.rst     | sed -n '1,19 p' >  $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt
	@cat $(WORKSRC)/docs/drivers/panfrost.rst | sed -n '1,38 p' >> $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt
endif
ifneq (,$(findstring sun4i,$(mm_GRAPHICS)))
	@cat $(WORKSRC)/docs/drivers/lima.rst     | sed -n '1,19 p' >  $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt
	@cat $(WORKSRC)/docs/drivers/panfrost.rst | sed -n '1,38 p' >> $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt
endif
	@rm -f "$(DESTDIR)/usr/share/supported-intel-gfx-hardware.txt"
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
	@# Generate udev rules for Intel crocus
	@cd files/udev-generator; ./generate-x-udev-rules.sh \
		"../../$(WORKSRC)/include/pci_ids/crocus_pci_ids.h" \
		"../../../../../script/meta/minimyth/files/source/rootfs/usr/lib/udev/rules.d/05-minimyth-detect-x-crocus.rules.disabled" \
		"$(DESTDIR)/usr/share/supported-intel-gfx-hardware.txt" \
		"8086" \
		"intel_i915" \
		"intel_vaapi" \
		"./crocus_names_with_HW_accell.lst" \
		"crocus"
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
endif

clean-all:
	@rm -f $(DESTDIR)$(bindir)/panfrost*
	@rm -f $(DESTDIR)$(bindir)/mesa*
	@rm -f $(DESTDIR)$(bindir)/vtn_bindgen*
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
	@rm -f $(DESTDIR)$(libdir)/dri/nouveau_dri.so*
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
