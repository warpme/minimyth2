
# GIT URL: https://github.com/Elyotna/linux
# GIT URL: https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git
# GIT URL: https://github.com/150balbes/Amlogic_s905-kernel/archive/2b66eefe06f198f98668871fb0e3dc9007cfd25d.zip
# GIT URL: https://github.com/khadas/linux/archive/b0ee9f50b8030b8dd9b26eb7b5cdef5bdbda4f35.zip
# GIT URL: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/snapshot/

#--Use this for mainline kernel-------------------------------
#MASTER_SITES        = https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/snapshot/
#DISTFILES           = $(GITHASH).tar.gz $(CONFIGFILE)
#WORKSRC             = $(WORKDIR)/$(GITHASH)
#-------------------------------------------------------------

#--Use this for khadas kernel---------------------------------
# MASTER_SITES        = https://github.com/khadas/linux/archive/
# DISTFILES           = $(GITHASH).zip $(CONFIGFILE)
# WORKSRC             = $(WORKDIR)/linux-$(GITHASH)
#-------------------------------------------------------------

#-- Use this for Elyotna kernel-------------------------------
# MASTER_SITES        = https://github.com/Elyotna/linux/archive/
# DISTFILES           = $(GITHASH).tar.gz $(CONFIGFILE)
# WORKSRC             = $(WORKDIR)/linux-$(GITHASH)
#-------------------------------------------------------------

#--Use this for balbes150 kernel------------------------------
# MASTER_SITES        = https://github.com/150balbes/Amlogic_s905-kernel/archive/
# DISTFILES           = $(GITHASH).zip $(CONFIGFILE)
# WORKSRC             = $(WORKDIR)/Amlogic_s905-kernel-$(GITHASH)
#-------------------------------------------------------------

#--Use this for yuq lima kernel------------------------------
MASTER_SITES        = https://gitlab.freedesktop.org/lima/linux/-/archive/lima-4.19-rc4/
DISTFILES           = $(GITHASH).tar.bz2 $(CONFIGFILE)
WORKSRC             = $(WORKDIR)/$(GITHASH)
#-------------------------------------------------------------

#--Use this for official kernel git for AMLogic (khilman)-----
# MASTER_SITES        = https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git/snapshot/
# DISTFILES           = $(GARNAME)-$(GARVERSION).tar.gz $(CONFIGFILE)
#-------------------------------------------------------------

GARNAME = linux-amlogic
GARVERSION = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),$(if $(filter-out 0,$(LINUX_TEENY_VERSION)),.$(LINUX_TEENY_VERSION)))$(LINUX_EXTRA_VERSION)
CATEGORIES = kernel-amlogic-4.19

CONFIGFILE = linux-amlogic-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)-$(GARCH_FAMILY)-$(GARCH).config

PATCHFILES  = linux-amlogic-4.19.patch.gar
PATCHFILES += linux-amlogic-4.19-perl.patch.gar
PATCHFILES += linux-amlogic-4.19-disable_dma_for_cfa.patch
PATCHFILES += linux-amlogic-4.19-defaults.patch
PATCHFILES += linux-amlogic-4.19-vgaarb-add-3D-accell-detection.patch
PATCHFILES += linux-amlogic-4.19-net-smsc95xx-allow-mac-address-as-param.patch

PATCHFILES += 0006-drm-meson-Add-support-for-VIC-alternate-timings.patch
PATCHFILES += 0007-drm-meson-fix-max-height-width.patch
PATCHFILES += 0008-defconfig-enable-CEC-support.patch
PATCHFILES += 0009-audio-meson-add-meson-audio-core-driver.patch
PATCHFILES += 0010-audio-meson-add-register-definitions.patch
PATCHFILES += 0011-audio-meson-add-aiu-i2s-dma-support.patch
PATCHFILES += 0012-audio-meson-add-initial-i2s-dai-support.patch
PATCHFILES += 0013-audio-meson-add-aiu-spdif-dma-support.patch
PATCHFILES += 0014-audio-meson-add-initial-spdif-dai-support.patch
PATCHFILES += 0015-defconfig-enable-audio-support-for-meson-SoCs-.patch
PATCHFILES += 0016-audio-dts-meson-gx-add-audio-controller-nodes.patch
PATCHFILES += 0017-audio-meson-activate-HDMI-audio-path.patch
PATCHFILES += 0018-drm-meson-select-dw-hdmi-i2s-audio-for-meson-hdmi.patch
PATCHFILES += 0019-audio-dts-meson-gx-add-sound-dai-cells-to-HDMI-node.patch
PATCHFILES += 0020-audio-dts-meson-activate-hdmi-audio-HDMI-enabled-boa.patch
PATCHFILES += 0021-drm-bridge-dw-hdmi-Use-AUTO-CTS-setup-mode-when-non-.patch
PATCHFILES += 0022-drm-meson-Call-drm_crtc_vblank_on-drm_crtc_vblank_of.patch
PATCHFILES += 0037-audio-hdmi-codec-fix-channel-allocation.patch
PATCHFILES += 0038-drm-dw-hdmi-i2s-add-.get_eld-callback-for-ALSA-SoC.patch
PATCHFILES += 0039-drm-dw-hdmi-i2s-add-multi-channel-lpcm-support.patch
PATCHFILES += 0040-drm-dw-hdmi-call-hdmi_set_cts_n-after-clock-is-enabl.patch
PATCHFILES += 0041-drm-dw-hdmi-extract-dw_hdmi_connector_update_edid.patch
PATCHFILES += 0042-drm-dw-hdmi-update-edid-on-hpd-event.patch
PATCHFILES += 0045-arm64-dts-meson-gx-adjust-cma-size.patch
PATCHFILES += 0046-misc-update-cpuinfo.patch
PATCHFILES += 0047-misc-cpu-serial.patch
PATCHFILES += 0052-misc-pfn-stfu.patch
PATCHFILES += 0053-misc-set-rc-warn-once.patch
PATCHFILES += 0056-defconfig-enable-zram-as-module.patch
PATCHFILES += 0057-boot-GX-update-TEXT_OFFSET-for-Amlogic-MESON-SoC.patch
PATCHFILES += 0060-defconfig-update-defconfig.patch
PATCHFILES += 0070-defconfig-add-config-for-Amlogic-Rockchip-platfor.patch

PATCHFILES += 0101-vdec-dt-bindings-soc-amlogic-add-meson-canvas-documentati.patch
PATCHFILES += 0102-vdec-soc-amlogic-add-meson-canvas-driver.patch
PATCHFILES += 0103-vdec-ARM64-dts-meson-gx-add-dmcbus-and-canvas-nodes.patch
PATCHFILES += 0104-vdec-drm-meson-convert-to-the-new-canvas-module.patch
PATCHFILES += 0105-vdec-dt-bindings-media-add-Amlogic-Video-Decoder-Bindings.patch
PATCHFILES += 0106-vdec-media-meson-add-v4l2-m2m-video-decoder-driver.patch
PATCHFILES += 0107-vdec-MAINTAINERS-Add-meson-video-decoder.patch
PATCHFILES += 0108-vdec-arm64-dts-meson-gx-add-vdec-entry.patch
PATCHFILES += 0109-vdec-arm64-dts-meson-add-vdec-entries.patch
PATCHFILES += 0110-vdec-meson-vdec-introduce-controls-and-V4L2_CID_MIN_BUFFE.patch
PATCHFILES += 0111-vdec-media-videodev2-add-V4L2_FMT_FLAG_NO_SOURCE_CHANGE.patch
PATCHFILES += 0112-vdec-meson-vdec-allow-subscribing-to-V4L2_EVENT_SOURCE_CH.patch
PATCHFILES += 0113-vdec-media-meson-vdec-add-H.264-decoding-support.patch
PATCHFILES += 0114-vdec-media-meson-vdec-add-MPEG4-decoding-support.patch
PATCHFILES += 0115-vdec-media-meson-vdec-add-MJPEG-decoding-support.patch
PATCHFILES += 0116-vdec-media-videodev2.h-Add-Amlogic-compressed-format.patch
PATCHFILES += 0117-vdec-media-meson-vdec-add-support-for-V4L2_PIX_FMT_AM21C.patch
PATCHFILES += 0118-vdec-media-meson-vdec-add-HEVC-decoding-support.patch
PATCHFILES += 0119-vdec-meson-vdec-more-debug-information-on-src-change.patch
PATCHFILES += 0120-vdec-meson-vdec-hevc-fix-conformance-window.patch
PATCHFILES += 0121-vdec-meson-vdec-hevc-simplify-integer-ceiling.patch
PATCHFILES += 0122-vdec-meson-vdec-hevc-various-80-line-fixes.patch
PATCHFILES += 0123-vdec-meson-vdec-hevc-fix-wrong-sao_up-buf-size.patch
PATCHFILES += 0124-vdec-meson-vdec-fix-coccinelle-warnings.patch
PATCHFILES += 0125-vdec-meson-vdec-make-amvdec_dst_buf_done_offset-public.patch
PATCHFILES += 0126-vdec-meson-vdec-hevc-support-offset-based-frame-DONE-ing.patch
PATCHFILES += 0127-vdec-meson-vdec-don-t-allow-dropping-timestamps-with-hevc.patch

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	utils/bc                      \

DEPENDS = \
	kernel/linux-headers-amlogic-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)  \
	kernel/linux-firmware-amlogic-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION) \

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

CONFIGURE_ARGS    = $(LINUX_MAKE_ARGS)
BUILD_ARGS        = $(LINUX_MAKE_ARGS)
INSTALL_ARGS      = $(LINUX_MAKE_ARGS)

CONFIGURE_ENV = $(LINUX_MAKE_ENV)
BUILD_ENV     = $(LINUX_MAKE_ENV)
INSTALL_ENV   = $(LINUX_MAKE_ENV) INSTALL_PATH="$(DESTDIR)$(LINUX_DIR)" INSTALL_MOD_PATH="$(DESTDIR)$(rootdir)" INSTALL_DTBS_PATH="$(DESTDIR)$(rootdir)/boot/dtbs"

include ../../gar.mk

configure-custom:
	@$(CONFIGURE_ENV) $(MAKE) $(CONFIGURE_ARGS) -C $(WORKSRC) mrproper
	@cp $(if $(mm_KERNEL_CONFIG),$(HOME)/.minimyth/$(mm_KERNEL_CONFIG),$(DOWNLOADDIR)/$(CONFIGFILE)) $(WORKSRC)/.config
	@$(CONFIGURE_ENV) $(MAKE) $(CONFIGURE_ARGS) -C $(WORKSRC) oldconfig
	@$(CONFIGURE_ENV) $(MAKE) $(CONFIGURE_ARGS) -C $(WORKSRC) clean
	$(warning Kernel will be build with following cmd line:$(BUILD_ARGS))
	$(warning LINUX_MAKE_ARGS: $(LINUX_MAKE_ARGS))
	$(warning LINUX_MAKE_ENV: $(LINUX_MAKE_ENV))
	$(warning LDFLAGS: $(LDFLAGS))
	$(warning main_LDFLAGS: $(main_LDFLAGS))
	@$(MAKECOOKIE)

build-custom:
ifeq ($(GARCH),armv7)
	@$(CONFIGURE_ENV) $(MAKE) -C $(WORKSRC) $(BUILD_ARGS) zImage modules dtbs
else
ifeq ($(GARCH),armv8)
	@$(CONFIGURE_ENV) $(MAKE) -C $(WORKSRC) $(BUILD_ARGS) Image modules dtbs
else
	@$(CONFIGURE_ENV) $(MAKE) -C $(WORKSRC) $(BUILD_ARGS) bzImage modules
endif
endif
	@$(MAKECOOKIE)

pre-install:
	@rm -rf "$(DESTDIR)$(LINUX_DIR)"
	@rm -rf "$(DESTDIR)$(LINUX_MODULESDIR)"
	@mkdir -p "$(DESTDIR)$(LINUX_DIR)"
	@$(MAKECOOKIE)

install-custom:
ifeq ($(GARCH),armv7)
	@mkdir -p "$(DESTDIR)/boot"
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/zImage > $(DESTDIR)/boot/zImage
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image    > $(DESTDIR)/boot/Image
	@cp  $(WORKSRC)/System.map $(DESTDIR)$(LINUX_DIR)/System.map
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) dtbs_install
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) modules_install
	@$(MAKECOOKIE)
else
ifeq ($(GARCH),armv8)
	@mkdir -p "$(DESTDIR)/boot"
	@#echo "Installing kernel Image.gz"
	@#cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image.gz > $(DESTDIR)/boot/Image.gz
	@echo "Installing kernel Image."
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image    > $(DESTDIR)/boot/Image
	@echo "Generating uImage."
	@/usr/bin/mkimage -A arm64 -O linux -T kernel -C none -a 0x1080000 -e 0x1080000 -n linux-next -d $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image $(DESTDIR)/boot/uImage
	@cp  $(WORKSRC)/System.map $(DESTDIR)$(LINUX_DIR)/System.map
	@echo "Installing kernel DTBS"
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) dtbs_install
	@echo "Installing kernel modules"
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) modules_install
	@$(MAKECOOKIE)
else
	@mkdir -p "$(DESTDIR)$(LINUX_DIR)"
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/bzImage > $(DESTDIR)$(LINUX_DIR)/vmlinuz
	@cp $(WORKSRC)/System.map                           $(DESTDIR)$(LINUX_DIR)/System.map
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) modules_install
	@$(MAKECOOKIE)
endif
endif

post-install:
	@echo "------------------------------------"     > $(DESTDIR)/usr/share/supported-IR-remotes.txt
	@echo "List of supported IR receivers as of"    >> $(DESTDIR)/usr/share/supported-IR-remotes.txt
	@echo "MiniMyth2 $(LINUX_FULL_VERSION) kernel " >> $(DESTDIR)/usr/share/supported-IR-remotes.txt
	@echo "------------------------------------"    >> $(DESTDIR)/usr/share/supported-IR-remotes.txt
	@ls -1 $(WORKSRC)/drivers/media/rc/keymaps/*.mod.c | sed -e "s/.*rc-//" -e "s/.mod.c//" >> $(DESTDIR)/usr/share/supported-IR-remotes.txt
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(LINUX_DIR)
	@rm -rf $(DESTDIR)$(LINUX_MODULESPREFIX)
	@$(MAKE) clean       -C ../linux-headers-amlogic-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)
	@$(MAKE) clean       -C ../linux-firmware-amlogic-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)
	@$(MAKE) clean-all   -C ../linux-headers-amlogic-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)
	@$(MAKE) clean-all   -C ../linux-firmware-amlogic-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)
