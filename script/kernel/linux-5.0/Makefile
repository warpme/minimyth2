
#--Use this for mainline official x.y.z kernel----
MASTER_SITES        = https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/snapshot/
DISTFILES           = $(DISTNAME).tar.gz $(CONFIGFILE)
WORKSRC             = $(WORKDIR)/linux-$(LINUX_VERSION)
#-------------------------------------------

#--Use this for mainline git-commit kernel--
# MASTER_SITES        = https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/snapshot/
# DISTFILES           = $(GITHASH).tar.gz $(CONFIGFILE)
# WORKSRC             = $(WORKDIR)/$(GITHASH)
#-------------------------------------------

GARNAME = linux
GARVERSION = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),$(if $(filter-out 0,$(LINUX_TEENY_VERSION)),.$(LINUX_TEENY_VERSION)))$(LINUX_EXTRA_VERSION)
CATEGORIES = kernel-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)

CONFIGFILE = linux-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)-$(GARCH_FAMILY)-$(GARCH).config


PATCHFILES  = linux-5.0.patch.gar
PATCHFILES += linux-5.0-perl.patch.gar
PATCHFILES += linux-5.0-disable_dma_for_cfa.patch
PATCHFILES += linux-5.0-defaults.patch
PATCHFILES += linux-5.0-vgaarb-add-3D-accell-detection.patch
PATCHFILES += linux-5.0-net-smsc95xx-allow-mac-address-as-param.patch

# Patches for Amlogic video decoder
# based on https://github.com/Elyotna/linux/commits/5.0/v4l2-m2m-pr
ifeq (1,1)
PATCHFILES += 0101-amlogic-vdec-dt-bindings-amlogic-vdec-add-Amlogic-Video-Decoder-Bindings.patch
PATCHFILES += 0102-amlogic-vdec-add-v4l2-m2m-video-decoder-driver.patch
PATCHFILES += 0103-amlogic-vdec-MAINTAINERS-Add-meson-video-decoder.patch
PATCHFILES += 0104-amlogic-vdec-arm64-dts-meson-gx-add-vdec-entry.patch
PATCHFILES += 0105-amlogic-vdec-arm64-dts-meson-add-vdec-entries.patch
PATCHFILES += 0106-amlogic-vdec-introduce-controls-and-V4L2_CID_MIN_BUFFE.patch
PATCHFILES += 0107-amlogic-vdec-videodev2-add-V4L2_FMT_FLAG_NO_SOURCE_CHANGE.patch
PATCHFILES += 0108-amlogic-vdec-allow-subscribing-to-V4L2_EVENT_SOURCE_CH.patch
PATCHFILES += 0109-amlogic-vdec-add-H.264-decoding-support.patch
PATCHFILES += 0110-amlogic-vdec-add-MPEG4-decoding-support.patch
PATCHFILES += 0111-amlogic-vdec-add-MJPEG-decoding-support.patch
PATCHFILES += 0112-amlogic-vdec-videodev2.h-Add-Amlogic-compressed-format.patch
PATCHFILES += 0113-amlogic-vdec-add-support-for-V4L2_PIX_FMT_AM21C.patch
PATCHFILES += 0114-amlogic-vdec-make-amvdec_dst_buf_done_offset-public.patch
PATCHFILES += 0115-amlogic-vdec-add-HEVC-decoding-support.patch
PATCHFILES += 0116-amlogic-vdec-more-debug-output-on-src-change.patch
PATCHFILES += 0117-amlogic-vdec-Map-the-Firmware-buf-idx-VB2-buf-idx.patch
PATCHFILES += 0118-amlogic-vdec-commonize-some-HEVC-code.patch
PATCHFILES += 0119-amlogic-vdec-add-VP9-input-support.patch
PATCHFILES += 0120-amlogic-vdec-add-VP9-support.patch
PATCHFILES += 0121-amlogic-vdec-don-t-keep-queuing-inputs-on-stop_s.patch
PATCHFILES += 0122-amlogic-vdec-vp9-multiple-fixes-for-lockups.patch
PATCHFILES += 0123-amlogic-vdec-vp9-cosmetics.patch
PATCHFILES += 0124-amlogic-vdec-fixes-for-5.0.patch
endif

# Patches for Mali450 GPU Lima driver
ifeq (1,1)
PATCHFILES += 0201-drm-export-drm_timeout_abs_to_jiffies.patch
PATCHFILES += 0202-drm-Add-reservation_object-to-drm_gem_object.patch
PATCHFILES += 0203-drm-sched-Refactor-ring-mirror-list-handling.patch
PATCHFILES += 0204-drm-lima-driver-for-ARM-Mali4xx-GPUs.patch
PATCHFILES += 0205-drm-include-idr.h-from-drm_file.h.patch
endif

# Patches for Amlogic audio support
# based on https://github.com/superna9999/linux.git -b linux-5.0-le-amlogic-gx
ifeq (1,1)
PATCHFILES += 0301-ARM64-defconfig-enable-CEC-support.patch
PATCHFILES += 0302-ASoC-meson-add-meson-audio-core-driver.patch
PATCHFILES += 0303-ASoC-meson-add-register-definitions.patch
PATCHFILES += 0304-ASoC-meson-add-initial-aiu-i2s-support.patch
PATCHFILES += 0305-ASoC-meson-add-initial-spdif-support.patch
PATCHFILES += 0306-ARM64-defconfig-enable-audio-support-for-meson-SoCs-.patch
PATCHFILES += 0307-ARM64-dts-meson-gx-add-audio-controller-nodes.patch
PATCHFILES += 0308-snd-meson-activate-HDMI-audio-path.patch
PATCHFILES += 0309-drm-meson-select-dw-hdmi-i2s-audio-for-meson-hdmi.patch
PATCHFILES += 0310-ARM64-dts-meson-gx-add-sound-dai-cells-to-HDMI-node.patch
PATCHFILES += 0311-ARM64-dts-meson-activate-hdmi-audio-HDMI-enabled-boa.patch
PATCHFILES += 0312-drm-bridge-dw-hdmi-Use-AUTO-CTS-setup-mode-when-non-.patch
PATCHFILES += 0313-arm64-dts-meson-gx-Add-canvas-provider-node-to-the-v.patch
PATCHFILES += 0314-drm-bridge-dw-hdmi-Add-SCDC-and-TMDS-Scrambling-supp.patch
PATCHFILES += 0315-drm-meson-add-HDMI-div40-TMDS-mode.patch
PATCHFILES += 0316-drm-meson-add-support-for-HDMI2.0-2160p-modes.patch
PATCHFILES += 0317-drm-bridge-dw-hdmi-add-support-for-YUV420-output.patch
PATCHFILES += 0318-drm-bridge-dw-hdmi-support-dynamically-get-input-out.patch
PATCHFILES += 0319-drm-bridge-dw-hdmi-allow-ycbcr420-modes-for-0x200a.patch
PATCHFILES += 0320-drm-meson-Add-YUV420-output-support.patch
PATCHFILES += 0321-drm-meson-Output-in-YUV444-if-sink-supports-it.patch
endif

# Misc patches for Amlogic
ifeq (1,0)
endif

# Patches for Rockchip audio support
ifeq (1,1)
PATCHFILES += 0406-arm64-dts-rockchip-add-rk3328-ACODEC-node.patch
PATCHFILES += 0407-arm64-dts-rockchip-move-rk3328-sound-dai-cells-to-th.patch
PATCHFILES += 0408-arm64-dts-rockchip-enable-analog-audio-node-for-rock.patch
PATCHFILES += 0422-arm64-dts-Remove-inconsistent-use-of-arm-armv8-compa.patch
PATCHFILES += 0432-arm64-dts-rockchip-fix-rk3328-roc-cc-gmac2io-stabili.patch
PATCHFILES += 0438-arm64-dts-rockchip-fix-rk3328-roc-cc-gmac2io-tx-rx_d.patch
PATCHFILES += 0450-arm64-dts-rockchip-enable-HDMI-CEC-on-rk3328.patch
PATCHFILES += 0451-arm64-dts-rockchip-fix-regulator-name-on-rk3328-rock.patch
PATCHFILES += 0452-arm64-dts-rockchip-add-leds-node-on-rk3328-rock64.patch
PATCHFILES += 0453-arm64-dts-rockchip-add-ir-receiver-node-on-rk3328-ro.patch
PATCHFILES += 0454-arm64-dts-rockchip-add-sound-dai-cells-to-HDMI-of-rk.patch
PATCHFILES += 0455-arm64-dts-rockchip-give-some-life-to-the-rk3328-roc-.patch
PATCHFILES += 0456-arm64-dts-rockchip-add-rk3328-roc-cc-cpu-supply-entr.patch
PATCHFILES += 0469-clk-rockchip-fix-wrong-clock-definitions-for-rk3328.patch
PATCHFILES += 0470-ARM-dts-rockchip-Fix-gic-efuse-sort-ordering-for-rk3.patch
PATCHFILES += 0475-ARM-dts-rockchip-Fix-gpu-opp-node-names-for-rk3288.patch
PATCHFILES += 0476-ARM-dts-rockchip-Remove-address-size-cells-from-rk32.patch
PATCHFILES += 0502-drm-rockchip-Add-implicit-fencing-support-for-planes.patch
PATCHFILES += 0503-drm-rockchip-Fix-YUV-buffers-color-rendering.patch
PATCHFILES += 0504-drm-rockchip-Fix-typo-in-VOP-macros-argument.patch
PATCHFILES += 0505-drm-rockchip-Separate-RK3288-from-RK3368-win01-regis.patch
PATCHFILES += 0506-drm-rockchip-Add-reflection-properties.patch
PATCHFILES += 0507-drm-rockchip-check-yuv2yuv-existence-before-assignin.patch
PATCHFILES += 0508-drm-bridge-dw-hdmi-Fix-overflow-workaround-for-Rockc.patch
PATCHFILES += 0511-dt-bindings-usb-add-DT-binding-for-RK3328-dwc3-contr.patch
PATCHFILES += 0512-arm64-dts-rockchip-add-usb3-controller-node-for-RK33.patch
PATCHFILES += 0513-arm64-dts-rockchip-enable-usb3-nodes-on-rk3328-rock6.patch
PATCHFILES += 0515-arm64-dts-rockchip-add-HDMI-sound-node-for-rk3328-ro.patch
PATCHFILES += 0516-drm-dw-hdmi-extract-dw_hdmi_connector_update_edid.patch
PATCHFILES += 0517-drm-dw-hdmi-move-dw_hdmi_connector_detect.patch
PATCHFILES += 0518-drm-dw-hdmi-update-CEC-phys-addr-and-EDID-on-HPD-eve.patch
PATCHFILES += 0519-Revert-drm-edid-make-drm_edid_to_eld-static.patch
PATCHFILES += 0520-drm-dw-hdmi-update-ELD-on-HPD-event.patch
PATCHFILES += 0521-ASoC-hdmi-codec-add-hdmi_codec_eld_notify.patch
PATCHFILES += 0522-drm-dw-hdmi-add-dw_hdmi_update_eld-callback.patch
PATCHFILES += 0523-drm-dw-hdmi-i2s-add-.get_eld-callback-for-ALSA-SoC.patch
PATCHFILES += 0525-ASoC-hdmi-codec-reorder-channel-allocation-list.patch
PATCHFILES += 0526-drm-dw-hdmi-i2s-add-multi-channel-lpcm-support.patch
PATCHFILES += 0527-drm-dw-hdmi-call-hdmi_set_cts_n-after-clock-is-enabl.patch
PATCHFILES += 0528-fix-chmap_idx.patch
PATCHFILES += 0529-ASoC-rockchip-i2s-use-closest-clock-rate.patch
PATCHFILES += 0530-HACK-arm64-dts-rockchip-update-gpu-node-on-rk3328-ro.patch
PATCHFILES += 0531-HACK-arm64-dts-rockchip-remove-acodec-dai-on-rk3328-.patch
PATCHFILES += 0532-HACK-arm64-dts-rockchip-split-sound-node-on-rk3328-r.patch
PATCHFILES += 0533-media-cec-notifier-debounce-callback-setting-invalid.patch
PATCHFILES += 0534-WIP-dw-hdmi-cec-sleep-104ms-on-error.patch
endif

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	utils/bc \

DEPENDS = \
	kernel-headers/linux-headers \
	kernel/linux-firmware \
	kernel/linux-firmware-meson \
	$(if $(filter arm arm64,$(mm_GARCH_FAMILY)),bootloaders/u-boot-tools) \

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
	@$(CONFIGURE_ENV) $(MAKE) $(CONFIGURE_ARGS) -C $(WORKSRC) prepare
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
	@rm -f  $(DESTDIR)$(LINUX_DIR)/Image
	@rm -f  $(DESTDIR)$(LINUX_DIR)/zImage
	@rm -f  $(DESTDIR)$(LINUX_DIR)/uImage
	@rm -f  $(DESTDIR)$(LINUX_DIR)/Image.gz
	@rm -f  $(DESTDIR)$(LINUX_DIR)/System.map
	@rm -f  $(DESTDIR)$(LINUX_DIR)/vmlinuz
	@rm -rf $(DESTDIR)$(LINUX_DIR)/dtbs*
	@rm -rf $(DESTDIR)$(LINUX_MODULESDIR)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(LINUX_DIR)
	@# cp  $(WORKSRC)/System.map $(DESTDIR)$(LINUX_DIR)/System.map
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) modules_install
ifeq ($(GARCH),armv7)
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/zImage > $(DESTDIR)$(LINUX_DIR)/zImage
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image    > $(DESTDIR)$(LINUX_DIR)/Image
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) dtbs_install
	@$(MAKECOOKIE)
else
ifeq ($(GARCH),armv8)
	@# cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image.gz > $(DESTDIR)$(LINUX_DIR)/Image.gz
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image    > $(DESTDIR)$(LINUX_DIR)/Image
	@$(build_DESTDIR)$(build_bindir)/mkimage -A arm64 -O linux -T kernel -C none -a 0x1080000 -e 0x1080000 -n linux-next -d $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image $(DESTDIR)$(LINUX_DIR)/uImage
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) dtbs_install
	@$(MAKECOOKIE)
else
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/bzImage > $(DESTDIR)$(LINUX_DIR)/vmlinuz
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
	@rm -f  $(DESTDIR)$(LINUX_DIR)/Image
	@rm -f  $(DESTDIR)$(LINUX_DIR)/zImage
	@rm -f  $(DESTDIR)$(LINUX_DIR)/uImage
	@rm -f  $(DESTDIR)$(LINUX_DIR)/Image.gz
	@rm -f  $(DESTDIR)$(LINUX_DIR)/System.map
	@rm -f  $(DESTDIR)$(LINUX_DIR)/vmlinuz
	@rm -rf $(DESTDIR)$(LINUX_DIR)/dtbs*
	@rm -rf $(DESTDIR)$(LINUX_MODULESPREFIX)
	@$(MAKE) clean       -C ../../kernel-headers/linux-headers
	@$(MAKE) clean-all   -C ../../kernel-headers/linux-headers
	@$(MAKE) clean       -C ../linux-firmware
	@$(MAKE) clean-all   -C ../linux-firmware-meson
