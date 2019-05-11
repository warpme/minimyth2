
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

PATCHFILES  = linux-5.1.patch.gar
PATCHFILES += linux-5.1-perl.patch.gar
PATCHFILES += linux-5.1-disable_dma_for_cfa.patch
PATCHFILES += linux-5.1-defaults.patch
PATCHFILES += linux-5.1-vgaarb-add-3D-accell-detection.patch
PATCHFILES += linux-5.1-net-smsc95xx-allow-mac-address-as-param.patch

# Patches for Amlogic audio, lima, panfrost support
# based on https://github.com/superna9999/linux.git -b linux-5.1-le-amlogic-gx
ifeq (1,1)
PATCHFILES += 0001-ARM64-defconfig-enable-CEC-support.patch
PATCHFILES += 0002-ASoC-meson-add-meson-audio-core-driver.patch
PATCHFILES += 0003-ASoC-meson-add-register-definitions.patch
PATCHFILES += 0004-ASoC-meson-add-initial-aiu-i2s-support.patch
PATCHFILES += 0005-ASoC-meson-add-initial-spdif-support.patch
PATCHFILES += 0006-ARM64-defconfig-enable-audio-support-for-meson-SoCs-.patch
PATCHFILES += 0007-ARM64-dts-meson-gx-add-audio-controller-nodes.patch
PATCHFILES += 0008-snd-meson-activate-HDMI-audio-path.patch
PATCHFILES += 0009-drm-meson-select-dw-hdmi-i2s-audio-for-meson-hdmi.patch
PATCHFILES += 0010-ARM64-dts-meson-gx-add-sound-dai-cells-to-HDMI-node.patch
PATCHFILES += 0011-ARM64-dts-meson-activate-hdmi-audio-HDMI-enabled-boa.patch
PATCHFILES += 0012-drm-bridge-dw-hdmi-Use-AUTO-CTS-setup-mode-when-non-.patch
PATCHFILES += 0013-drm-bridge-dw-hdmi-support-dynamically-get-input-out.patch
PATCHFILES += 0014-drm-bridge-dw-hdmi-allow-ycbcr420-modes-for-0x200a.patch
PATCHFILES += 0015-drm-meson-Add-YUV420-output-support.patch
PATCHFILES += 0016-drm-meson-Output-in-YUV444-if-sink-supports-it.patch
PATCHFILES += 0017-drm-export-drm_timeout_abs_to_jiffies.patch
PATCHFILES += 0018-drm-Add-library-for-shmem-backed-GEM-objects.patch
PATCHFILES += 0019-drm-Add-reservation_object-to-drm_gem_object.patch
PATCHFILES += 0020-drm-Add-helpers-for-locking-an-array-of-BO-reservati.patch
PATCHFILES += 0021-BACKPORT-drm-lima-driver-for-ARM-Mali4xx-GPUs.patch
PATCHFILES += 0022-iommu-io-pgtable-Add-ARM-Mali-midgard-MMU-page-table.patch
PATCHFILES += 0023-drm-Add-a-drm_gem_objects_lookup-helper.patch
PATCHFILES += 0024-FROMLIST-drm-panfrost-Add-initial-panfrost-driver.patch
PATCHFILES += 0025-arm64-dts-meson-gxm-Add-Mali-T820-node.patch
PATCHFILES += 0026-arm64-dts-meson-gxm-nexbox-a1-Enable-USB.patch
PATCHFILES += 0027-arm64-dts-meson-gxm-nexbox-a1-disable-cvbs.patch
PATCHFILES += 0028-WiP-drm-panfrost-add-support-for-custom-soft-reset-o.patch
endif

# Patches for Amlogic video decoder
# based on https://github.com/Elyotna/linux/commits/5.0/v4l2-m2m-pr
ifeq (1,1)
PATCHFILES += 0101-dt-bindings-media-add-Amlogic-Video-Decoder-Bindings.patch
PATCHFILES += 0102-media-meson-add-v4l2-m2m-video-decoder-driver.patch
PATCHFILES += 0103-MAINTAINERS-Add-meson-video-decoder.patch
PATCHFILES += 0104-arm64-dts-meson-gx-add-vdec-entry.patch
PATCHFILES += 0105-arm64-dts-meson-add-vdec-entries.patch
PATCHFILES += 0106-meson-vdec-introduce-controls-and-V4L2_CID_MIN_BUFFE.patch
PATCHFILES += 0107-media-videodev2-add-V4L2_FMT_FLAG_NO_SOURCE_CHANGE.patch
PATCHFILES += 0108-meson-vdec-allow-subscribing-to-V4L2_EVENT_SOURCE_CH.patch
PATCHFILES += 0109-media-meson-vdec-add-H.264-decoding-support.patch
PATCHFILES += 0110-media-meson-vdec-add-MPEG4-decoding-support.patch
PATCHFILES += 0111-media-meson-vdec-add-MJPEG-decoding-support.patch
PATCHFILES += 0112-media-videodev2.h-Add-Amlogic-compressed-format.patch
PATCHFILES += 0113-media-meson-vdec-add-support-for-V4L2_PIX_FMT_AM21C.patch
PATCHFILES += 0114-meson-vdec-make-amvdec_dst_buf_done_offset-public.patch
PATCHFILES += 0115-media-meson-vdec-add-HEVC-decoding-support.patch
PATCHFILES += 0116-media-meson-vdec-more-debug-output-on-src-change.patch
PATCHFILES += 0117-meson-vdec-Map-the-Firmware-buf-idx-VB2-buf-idx.patch
PATCHFILES += 0118-media-meson-vdec-commonize-some-HEVC-code.patch
PATCHFILES += 0119-media-meson-vdec-add-VP9-input-support.patch
PATCHFILES += 0120-media-meson-vdec-add-VP9-support.patch
PATCHFILES += 0121-media-meson-vdec-don-t-keep-queuing-inputs-on-stop_s.patch
PATCHFILES += 0122-media-meson-vp9-multiple-fixes-for-lockups.patch
PATCHFILES += 0123-vp9-cosmetics.patch
PATCHFILES += 0124-media-meson-vdec-fixes-for-5.0.patch
endif

# Patches for Amlogic audio fixes & extensions
# https://github.com/kszaq/LibreELEC.tv/tree/amlogic/packages/linux/patches/amlogic-amlgx
ifeq (1,1)
PATCHFILES += 0201-drm-dw-hdmi-extract-dw_hdmi_connector_update_edid.patch
PATCHFILES += 0202-drm-dw-hdmi-move-dw_hdmi_connector_detect.patch
PATCHFILES += 0203-drm-dw-hdmi-update-CEC-phys-addr-and-EDID-on-HPD-eve.patch
PATCHFILES += 0204-Revert-drm-edid-make-drm_edid_to_eld-static.patch
PATCHFILES += 0205-drm-dw-hdmi-update-ELD-on-HPD-event.patch
PATCHFILES += 0206-ASoC-hdmi-codec-add-hdmi_codec_eld_notify.patch
PATCHFILES += 0207-drm-dw-hdmi-add-dw_hdmi_update_eld-callback.patch
PATCHFILES += 0208-drm-dw-hdmi-i2s-add-.get_eld-callback-for-ALSA-SoC.patch
PATCHFILES += 0210-ASoC-hdmi-codec-reorder-channel-allocation-list.patch
PATCHFILES += 0211-drm-dw-hdmi-i2s-add-multi-channel-lpcm-support.patch
PATCHFILES += 0212-drm-dw-hdmi-call-hdmi_set_cts_n-after-clock-is-enabl.patch
PATCHFILES += 0213-ASoC-sun4i-i2s-multichannel-updates.patch
PATCHFILES += 0214-ASoC-sun4i-i2s-multichannel-updates-fixes.patch
PATCHFILES += 0215-fix-chmap_idx.patch
endif

# Misc patches for Atheros 10k WiFi driver
# https://github.com/kszaq/LibreELEC.tv/tree/amlogic/packages/linux/patches/amlogic-amlgx
ifeq (1,1)
PATCHFILES += 0301-ath10k-add-inline-wrapper-for-htt_h2t_aggr_cfg_msg.patch
PATCHFILES += 0302-ath10k-add-htt_h2t_aggr_cfg_msg-op-for-high-latency-.patch
# PATCHFILES += 0303-ath10k-remove-iteration-in-wake_tx_queue.patch
PATCHFILES += 0304-ath10k-use-clean-packet-headers.patch
PATCHFILES += 0305-ath10k-high-latency-fixes-for-beacon-buffer.patch
PATCHFILES += 0306-ath10k-sdio-read-RX-packets-in-bundles.patch
PATCHFILES += 0307-ath10k-sdio-add-MSDU-ID-allocation-in-HTT-TX-path.patch
PATCHFILES += 0308-ath10k-sdio-add-missing-error-check.patch
PATCHFILES += 0309-ath10k-sdio-replace-skb_trim-with-explicit-set-of-sk.patch
PATCHFILES += 0310-ath10k-add-TARGET_QCA9377_HL_NUM_PEERS.patch
PATCHFILES += 0311-ath10k-add-QCA9377-usb-hw_param-item.patch
PATCHFILES += 0312-ath10k-add-QCA9377-sdio-hw_param-item.patch
PATCHFILES += 0313-ath10k-add-start_once-support.patch
PATCHFILES += 0314-ath10k_sdio-hif-start-once-addition.patch
PATCHFILES += 0315-ath10k-sdio-readd-start_once.patch
PATCHFILES += 0316-ath10k-add-n_cipher_suites-for-QCA9377-USB-SDIO.patch
PATCHFILES += 0317-ath10k_sdio-DMA-bounce-buffers-for-read-write.patch
endif

# Misc patches for AmLogic
# https://github.com/kszaq/LibreELEC.tv/tree/amlogic/packages/linux/patches/amlogic-amlgx
ifeq (1,1)
PATCHFILES += 0401-HACK-set-cma-pool-to-896MB.patch
PATCHFILES += 0403-HACK-silence-PFNs-busy-log-spam.patch
PATCHFILES += 0404-HACK-silence-meson-ir-warn-once-log-spam.patch
PATCHFILES += 0405-HACK-silence-hrtimer-log-spam.patch
PATCHFILES += 0406-HACK-Bluetooth-Fix-spurious-error-message.patch
PATCHFILES += 0407-WIP-hdmi-patch.patch
PATCHFILES += 0409-WIP-fix-meson-gx-socid-output.patch
PATCHFILES += 0410-WIP-set-max-frequency-100000000-for-emmc-nodes.patch
PATCHFILES += 0411-arm64-dts-meson-gxbb-vega-s95-update-dtsi-with-many-.patch
PATCHFILES += 0412-arm64-dts-meson-gxbb-wetek.dtsi-enable-bluetooth.patch
PATCHFILES += 0413-arm64-dts-meson-gxbb-wetek.dtsi-enable-saradc-node.patch
PATCHFILES += 0414-arm64-dts-meson-gxbb-gxl-gxm-set-audio-card-name-to-.patch
PATCHFILES += 0415-arm64-dts-meson-gxbb-odroid-set-blue-led-to-on.patch
PATCHFILES += 0416-arm64-dts-meson-gxbb-odroid-set-rc-odroid-ir-keymap.patch
PATCHFILES += 0417-arm64-dts-meson-gxbb-vega-s95-set-rc-vega-s95-ir-key.patch
PATCHFILES += 0418-arm64-dts-meson-gxbb-wetek-hub-set-rc-wetek-hub-ir-k.patch
PATCHFILES += 0419-arm64-dts-meson-gxbb-wetek-play2-set-rc-wetek-play2-.patch
PATCHFILES += 0420-arm64-dts-meson-gxl-s905x-khadas-vim-use-rc-khadas-r.patch
PATCHFILES += 0421-arm64-dts-meson-gxl-s905x-khadas-vim-fix-address-siz.patch
PATCHFILES += 0422-arm64-dts-meson-gxl-s905w-tx3-mini-set-rc-tx3mini-ir.patch
PATCHFILES += 0423-arm64-dts-meson-gxm-khadas-vim2-set-eee-broken-1000t.patch
PATCHFILES += 0424-arm64-dts-meson-gxm-khadas-vim2-fix-address-size-cel.patch
PATCHFILES += 0425-arm64-dts-meson-gxm-khadas-vim2-set-bt-compatible.patch
PATCHFILES += 0426-arm64-dts-meson-gxm-vega-s96-set-rc-vega-s95-ir-keym.patch
PATCHFILES += 0427-media-rc-add-keymap-for-HardKernel-ODROID-remote.patch
PATCHFILES += 0428-media-rc-add-keymap-for-Khadas-VIM-EDGE-remote.patch
PATCHFILES += 0429-media-rc-add-keymap-for-KHAMSIN-remote.patch
PATCHFILES += 0430-media-rc-add-keymap-for-Philips-RC242-remote.patch
PATCHFILES += 0431-media-rc-add-keymap-for-Tanix-TX3-mini-remote.patch
PATCHFILES += 0432-media-rc-add-keymap-for-WeTek-Hub-remote.patch
PATCHFILES += 0433-media-rc-add-keymap-for-WeTeK-Play-2-remote.patch
PATCHFILES += 0434-ASoC-meson-correct-i2s-error-messages.patch
PATCHFILES += 0435-dt-bindings-Add-vendor-prefix-for-SmartLabs-LLC.patch
PATCHFILES += 0436-dt-bindings-arm-amlogic-Add-support-for-the-SmartLab.patch
PATCHFILES += 0437-ARM64-dts-meson-gxl-Add-support-for-the-SmartLabs-SM.patch
endif

# Misc patches for Panfrost driver
# https://github.com/kszaq/LibreELEC.tv/tree/amlogic/packages/linux/patches/amlogic-amlgx
ifeq (1,1)
PATCHFILES += 0501-drm-panfrost-Add-support-for-2MB-page-entries.patch
PATCHFILES += 0502-drm-panfrost-Make-panfrost_gem_free_object-static.patch
PATCHFILES += 0503-drm-panfrost-Add-missing-include.patch
PATCHFILES += 0504-drm-panfrost-depend-on-GENERIC_ATOMIC64-when-using-C.patch
PATCHFILES += 0505-drm-panfrost-Prevent-concurrent-resets.patch
PATCHFILES += 0506-ARM64-dts-meson-gx-add-ATF-BL32-reserved-memory-regi.patch
endif

# Patches for Rockchip audio support
ifeq (0,1)
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
