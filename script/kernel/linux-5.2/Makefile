
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

PATCHFILES  = linux-5.2.patch.gar
PATCHFILES += linux-5.2-perl.patch.gar
PATCHFILES += linux-5.2-disable_dma_for_cfa.patch
PATCHFILES += linux-5.2-defaults.patch
PATCHFILES += linux-5.2-vgaarb-add-3D-accell-detection.patch
PATCHFILES += linux-5.2-net-smsc95xx-allow-mac-address-as-param.patch

# fix for panfrost power bug in amlogic gxm
PATCHFILES += 0000-iommu-Fix-alloc_io_pgtable_ops-for-ARM_MALI_LPAE-on-.patch
PATCHFILES += 0001-fix-io-alloc-for-non-48bit.patch
PATCHFILES += 0002-WIP-drm-panfrost-add-support-for-custom-soft-reset-on-GXM.patch
# Some Lima fixes
PATCHFILES += 0003-drm-lima-Mark-64-bit-number-as-ULL.patch
PATCHFILES += 0004-drm-lima-Reduce-the-amount-of-logs-on-deferred-probe.patch
PATCHFILES += 0005-drm-lima-Reduce-number-of-PTR_ERR-calls.patch
PATCHFILES += 0006-drm-lima-Reduce-the-amount-of-logs-on-deferred-probe.patch
PATCHFILES += 0007-drm-lima-drop-DRM_AUTH-usage-from-the-driver.patch

# Add Amlogic HW video decorer support
PATCHFILES += 0101-dt-bindings-media-add-Amlogic-Video-Decoder-Bindings.patch
PATCHFILES += 0102-media-videodev2-add-V4L2_FMT_FLAG_FIXED_RESOLUTION.patch
PATCHFILES += 0103-media-meson-add-v4l2-m2m-video-decoder-driver.patch
PATCHFILES += 0104-MAINTAINERS-Add-meson-video-decoder.patch
PATCHFILES += 0105-arm64-dts-meson-gx-add-vdec-entry.patch
PATCHFILES += 0106-arm64-dts-meson-add-vdec-entries.patch
PATCHFILES += 0107-media-meson-vdec-add-H.264-decoding-support.patch
PATCHFILES += 0108-media-meson-vdec-add-MPEG4-decoding-support.patch
PATCHFILES += 0109-media-meson-vdec-add-MJPEG-decoding-support.patch
PATCHFILES += 0110-media-videodev2.h-Add-Amlogic-compressed-format.patch
PATCHFILES += 0111-media-meson-vdec-add-support-for-V4L2_PIX_FMT_AM21C.patch
PATCHFILES += 0112-media-meson-vdec-add-HEVC-decoding-support.patch
PATCHFILES += 0113-media-meson-vdec-add-VP9-input-support.patch
PATCHFILES += 0114-media-meson-vdec-add-VP9-support.patch
PATCHFILES += 0115-media-meson-vdec-add-g12a-platform.patch
PATCHFILES += 0116-media-meson-vp9-add-IOMMU-support.patch
PATCHFILES += 0117-arm64-dts-meson-g12a-add-video-decoder-node.patch

# Generic HDMI audio patches for dw-hdmi controller
PATCHFILES += 0201-drm-dw-hdmi-extract-dw_hdmi_connector_update_edid.patch
PATCHFILES += 0202-drm-dw-hdmi-move-dw_hdmi_connector_detect.patch
PATCHFILES += 0203-drm-dw-hdmi-update-CEC-phys-addr-and-EDID-on-HPD-eve.patch
PATCHFILES += 0204-Revert-drm-edid-make-drm_edid_to_eld-static.patch
PATCHFILES += 0205-drm-dw-hdmi-update-ELD-on-HPD-event.patch
PATCHFILES += 0206-ASoC-hdmi-codec-add-hdmi_codec_eld_notify.patch
PATCHFILES += 0207-drm-dw-hdmi-add-dw_hdmi_update_eld-callback.patch
PATCHFILES += 0208-drm-dw-hdmi-i2s-add-.get_eld-callback-for-ALSA-SoC.patch
PATCHFILES += 0209-drm-bridge-dw-hdmi-Use-AUTO-CTS-setup-mode-when-non-.patch
PATCHFILES += 0210-ASoC-hdmi-codec-reorder-channel-allocation-list.patch
PATCHFILES += 0211-drm-dw-hdmi-i2s-add-multi-channel-lpcm-support.patch
PATCHFILES += 0212-drm-dw-hdmi-call-hdmi_set_cts_n-after-clock-is-enabl.patch
PATCHFILES += 0214-ASoC-hdmi-codec-fix-chmap-idx.patch
PATCHFILES += 0215-WIP-dw-hdmi-cec-sleep-100ms-on-error.patch

# Amlogic drm-meson crtc support for yuv420 pix format
PATCHFILES += 0216-drm-bridge-dw-hdmi-support-dynamically-get-input-out.patch
PATCHFILES += 0217-drm-bridge-dw-hdmi-allow-ycbcr420-modes-for-0x200a.patch
PATCHFILES += 0218-drm-meson-Add-YUV420-output-support.patch

# Amlogic speciffic patches to enable hdmi audio
PATCHFILES += 0301-ASoC-meson-add-meson-audio-core-driver.patch
PATCHFILES += 0302-ASoC-meson-add-register-definitions.patch
PATCHFILES += 0303-ASoC-meson-add-initial-aiu-i2s-support.patch
PATCHFILES += 0304-ASoC-meson-add-initial-spdif-support.patch
PATCHFILES += 0305-ARM64-dts-meson-gx-add-audio-controller-nodes.patch
PATCHFILES += 0306-snd-meson-activate-HDMI-audio-path.patch
PATCHFILES += 0307-ARM64-dts-meson-gx-add-sound-dai-cells-to-HDMI-node.patch
PATCHFILES += 0308-ARM64-dts-meson-activate-hdmi-audio-HDMI-enabled-boa.patch

# ROCKCHIP speciffic patches to enable hdmi audio
PATCHFILES += 0400-arm64-dts-rockchip-add-HDMI-sound-node-for-rk3328-ro.patch
PATCHFILES += 0401-ASoC-rockchip-i2s-use-closest-clock-rate.patch
PATCHFILES += 0402-HACK-arm64-dts-rockchip-update-gpu-node-on-rk3328-ro.patch
PATCHFILES += 0403-HACK-arm64-dts-rockchip-remove-acodec-dai-on-rk3328-.patch
PATCHFILES += 0404-HACK-arm64-dts-rockchip-split-sound-node-on-rk3328-r.patch
PATCHFILES += 0405-WIP-arm64-dts-rockchip-work-in-progress-on-rk3328-ro.patch
PATCHFILES += 0406-arm64-dts-rockchip-Enable-HDMI-audio-on-rk3399-rock-.patch
PATCHFILES += 0406-HACK-arm64-dts-rockchip-rename-hdmi-sound-card-on-rk.patch
PATCHFILES += 0407-arm64-dts-rockchip-Enable-HDMI-audio-on-rk3399-nanop.patch
PATCHFILES += 0408-arm64-dts-rockchip-Fix-HDMI-audio-on-rk3399-orangepi.patch
PATCHFILES += 0409-arm64-dts-rockchip-Enable-HDMI-audio-on-rk3399-roc-p.patch
PATCHFILES += 0410-arm64-dts-rockchip-Enable-gpu-node-on-rk3399-roc-pc.patch

# Allwinner H6 patches for OrangePi 3 support
# https://github.com/megous/linux/commits/opi3-5.2
PATCHFILES += 0801-rtc-sun6i-Add-support-for-H6-RTC.patch
PATCHFILES += 0802-arm64-dts-sun50i-h6-Add-support-for-RTC-and-fix-the-.patch
PATCHFILES += 0803-dt-bindings-Add-compatible-for-H6-RTC.patch
PATCHFILES += 0804-drm-Remove-redundant-of_device_is_available-check.patch
PATCHFILES += 0805-net-stmmac-sun8i-add-support-for-Allwinner-H6-EMAC.patch
PATCHFILES += 0807-arm64-dts-allwinner-orange-pi-3-Enable-ethernet.patch
PATCHFILES += 0808-dt-bindings-display-hdmi-connector-Support-DDC-bus-e.patch
PATCHFILES += 0809-drm-sun4i-Add-support-for-enabling-DDC-I2C-bus-to-su.patch
PATCHFILES += 0810-arm64-dts-allwinner-orange-pi-3-Enable-HDMI-output.patch
PATCHFILES += 0811-arm64-dts-allwinner-orange-pi-3-Enable-WiFi.patch
PATCHFILES += 0812-bluetooth-hci_bcm-Give-more-time-to-come-out-of-rese.patch
PATCHFILES += 0813-arm64-dts-allwinner-h6-Add-pin-configs-for-uart1.patch
PATCHFILES += 0814-arm64-dts-allwinner-orange-pi-3-Enable-UART1-Bluetoo.patch
PATCHFILES += 0815-phy-allwinner-add-phy-driver-for-USB3-PHY-on-Allwinn.patch
PATCHFILES += 0816-thermal-Thermal-sensor-driver-for-Allwinner-H6.patch
PATCHFILES += 0817-arm64-dts-allwinner-h6-add-USB3-device-nodes.patch
PATCHFILES += 0818-arm64-dts-allwinner-h6-Add-thermal-sensor-DTS-nodes.patch
PATCHFILES += 0819-arm64-dts-allwinner-h6-Add-clock-to-CPU-cores.patch
PATCHFILES += 0820-arm64-dts-allwinner-h6-Add-CPU-Operating-Performance.patch
PATCHFILES += 0821-Use-the-OPP-table-for-the-worst-bin.patch
PATCHFILES += 0822-arm64-dts-allwinner-orange-pi-3-Enable-USB-3.0-host-.patch
PATCHFILES += 0824-clk-sunxi-ng-sun50i-h6-r-Fix-incorrect-W1-clock-gate.patch
PATCHFILES += 0825-bluetooth-bcm-Add-support-for-loading-firmware-for-B.patch
PATCHFILES += 0826-drm-sun8i-Drop-reference-to-connector_pdev.patch
PATCHFILES += 0827-Fix-reboot-issue-with-ethernet-on-Orange-Pi-3.patch
PATCHFILES += 0828-Even-more-BT-delay.patch
# Some generic H6 patches
PATCHFILES += 0834-arm64-dts-allwinner-Add-ARM-Mali-GPU-node-for-H6.patch
PATCHFILES += 0835-arm64-dts-allwinner-Add-mali-GPU-supply-for-H6-board.patch
PATCHFILES += 0838-arm64-dts-allwinner-Add-GPU-operating-points-for-H6.patch
PATCHFILES += 0839-net-stmmac-RX-Descriptors-need-to-be-clean-before-se.patch
PATCHFILES += 0856-Add-AC200-EPHY-support.patch
PATCHFILES += 0857-arm64-dts-allwinner-OrangePiOnePlus-updates.patch
PATCHFILES += 0858-arm64-dts-allwinner-add-Tanix-TX6-WIP.patch
PATCHFILES += 0859-arm64-dts-allwinner-add-h6-eachlink-h6mini.patch
PATCHFILES += 0860-arm64-dts-allwinner-add-h6-qplus.patch
PATCHFILES += 0861-sun50i-h6-sound-hack.patch
PATCHFILES += 0862-arm64-allwinner-sunxi5i-allow-changing-gpu-parent-rate.patch
PATCHFILES += 0863-arm64-allwinner-h6-add-binding-for-DMA-controller.patch

PATCHFILES += 0900-media-rc-add-keymap-for-Tanix-TX3-mini-remote.patch

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	utils/bc \
	$(if $(filter arm arm64,$(mm_GARCH_FAMILY)),bootloaders/u-boot-tools) \

DEPENDS = \
	kernel-headers/linux-headers \
	kernel/linux-firmware \
	kernel/linux-firmware-meson \

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
