
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

# Patches for baseline kernel from https://github.com/superna9999/linux/commits/amlogic/v5.2/misc-fixes
ifeq (1,1)
PATCHFILES += 0003-clk-meson-mpll-properly-handle-spread-spectrum.patch
PATCHFILES += 0004-clk-meson-gxbb-no-spread-spectrum-on-mpll0.patch
PATCHFILES += 0005-clk-meson-axg-spread-spectrum-is-on-mpll2.patch
PATCHFILES += 0006-clk-meson-mpll-add-init-callback-and-regs.patch
PATCHFILES += 0007-clk-meson-g12a-add-mpll-register-init-sequences.patch
PATCHFILES += 0008-clk-meson-eeclk-add-init-regs.patch
PATCHFILES += 0009-clk-meson-g12a-add-controller-register-init.patch
PATCHFILES += 0010-arm64-dts-meson-g12a-Add-PWM-nodes.patch
PATCHFILES += 0011-arm64-dts-meson-g12a-Add-IR-nodes.patch
PATCHFILES += 0012-arm64-dts-meson-g12a-x96-max-enable-IR-decoder.patch
PATCHFILES += 0013-arm64-dts-meson-g12a-u200-enable-IR-decoder.patch
PATCHFILES += 0014-arm64-dts-meson-libretech-cc-set-eMMC-as-removable.patch
PATCHFILES += 0015-arm64-dts-meson-libretech-cc-switch-eMMC-to-1.8v.patch
PATCHFILES += 0016-arm64-dts-meson-fix-mmc-pin-bias.patch
PATCHFILES += 0017-arm64-dts-meson-fix-mmc-v2-chips-max-frequencies.patch
PATCHFILES += 0018-arm64-dts-meson-vim2-add-missing-clk-gate-pinctrl.patch
PATCHFILES += 0019-arm64-dts-meson-vim2-remove-sd-hs-and-hs400-modes-fr.patch
PATCHFILES += 0020-arm64-dts-meson-sei510-consistently-order-nodes.patch
PATCHFILES += 0021-arm64-dts-meson-u200-consistently-order-nodes.patch
PATCHFILES += 0022-arm64-dts-amlogic-remove-ethernet-phy-idAAAA.BBBB-co.patch
PATCHFILES += 0023-arm64-dts-meson-nanopi-k2-add-sd-DDR50.patch
PATCHFILES += 0024-arm64-dts-meson-odroid-c2-add-missing-mmc-modes.patch
PATCHFILES += 0025-arm64-dts-meson-g12a-add-mmc-nodes.patch
PATCHFILES += 0026-arm64-dts-meson-u200-add-sd-and-emmc.patch
PATCHFILES += 0027-arm64-dts-meson-sei510-add-sd-and-emmc.patch
PATCHFILES += 0028-arm64-dts-meson-g12a-set-uart_ao-clocks.patch
PATCHFILES += 0029-arm64-dts-meson-g12a-add-i2c-nodes.patch
PATCHFILES += 0030-arm64-dts-meson-u200-enable-i2c-busses.patch
PATCHFILES += 0031-arm64-dts-meson-sei510-enable-i2c3.patch
PATCHFILES += 0032-arm64-dts-meson-g12a-add-audio-clock-controller.patch
PATCHFILES += 0033-arm64-dts-meson-g12a-add-audio-memory-arbitrer.patch
PATCHFILES += 0034-arm64-dts-meson-g12a-add-audio-fifos.patch
PATCHFILES += 0035-arm64-dts-meson-g12a-add-tdm.patch
PATCHFILES += 0036-arm64-dts-meson-g12a-add-spdifouts.patch
PATCHFILES += 0037-arm64-dts-meson-g12a-add-pdm.patch
PATCHFILES += 0038-arm64-dts-meson-g12a-add-spdifin.patch
PATCHFILES += 0039-arm64-dts-meson-g12a-enable-hdmi_tx-sound-dai-provid.patch
PATCHFILES += 0040-dt-bindings-arm-amlogic-Move-amlogic-meson-gx-ao-sec.patch
PATCHFILES += 0041-dt-bindings-arm-Convert-Amlogic-board-soc-bindings-t.patch
PATCHFILES += 0042-arm64-dts-meson-sei510-add-bluetooth-supplies.patch
PATCHFILES += 0043-arm64-dts-meson-g12a-add-tohdmitx.patch
PATCHFILES += 0044-arm64-dts-meson-g12a-add-ethernet-mac-controller.patch
PATCHFILES += 0045-arm64-dts-meson-g12a-add-ethernet-pinctrl-definition.patch
PATCHFILES += 0046-arm64-dts-meson-g12a-add-mdio-multiplexer.patch
PATCHFILES += 0047-arm64-dts-meson-u200-add-internal-network.patch
PATCHFILES += 0048-arm64-dts-meson-sei510-add-network-support.patch
PATCHFILES += 0049-arm64-dts-meson-g12a-add-drive-strength-hdmi-ddc-pin.patch
PATCHFILES += 0050-arm64-dts-meson-g12a-add-drive-strength-for-eth-pins.patch
PATCHFILES += 0051-arm64-dts-meson-gxm-khadas-vim2-fix-gpio-keys-polled.patch
PATCHFILES += 0052-arm64-dts-meson-gxm-khadas-vim2-fix-Bluetooth-suppor.patch
PATCHFILES += 0053-arm64-dts-meson-gxbb-wetek-enable-SARADC.patch
PATCHFILES += 0054-arm64-dts-meson-gxbb-wetek-enable-bluetooth.patch
PATCHFILES += 0055-arm64-dts-meson-gxbb-vega-s95-fix-regulators.patch
PATCHFILES += 0056-arm64-dts-meson-gxbb-vega-s95-add-HDMI-nodes.patch
PATCHFILES += 0057-arm64-dts-meson-gxbb-vega-s95-enable-CEC.patch
PATCHFILES += 0058-arm64-dts-meson-gxbb-vega-s95-enable-SARADC.patch
PATCHFILES += 0059-arm64-dts-meson-gxbb-vega-s95-fix-WiFi-BT-module-sup.patch
PATCHFILES += 0060-arm64-dts-meson-gxbb-vega-s95-add-ethernet-PHY-inter.patch
endif

# Misc patches for Amlogic Vdec
ifeq (1,1)
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
endif

# Misc patches for Amlogic Audio
ifeq (1,1)
PATCHFILES += 0202-ASoC-meson-add-meson-audio-core-driver.patch
PATCHFILES += 0203-ASoC-meson-add-register-definitions.patch
PATCHFILES += 0204-ASoC-meson-add-initial-aiu-i2s-support.patch
PATCHFILES += 0205-ASoC-meson-add-initial-spdif-support.patch
PATCHFILES += 0207-ARM64-dts-meson-gx-add-audio-controller-nodes.patch
PATCHFILES += 0208-snd-meson-activate-HDMI-audio-path.patch
PATCHFILES += 0209-drm-meson-select-dw-hdmi-i2s-audio-for-meson-hdmi.patch
PATCHFILES += 0210-ARM64-dts-meson-gx-add-sound-dai-cells-to-HDMI-node.patch
PATCHFILES += 0211-ARM64-dts-meson-activate-hdmi-audio-HDMI-enabled-boa.patch
PATCHFILES += 0212-drm-bridge-dw-hdmi-Use-AUTO-CTS-setup-mode-when-non-.patch
PATCHFILES += 0213-drm-bridge-dw-hdmi-support-dynamically-get-input-out.patch
endif

# Misc patches for AmLogic
# https://github.com/kszaq/LibreELEC.tv/tree/amlogic/packages/linux/patches/amlogic-amlgx
ifeq (1,1)
PATCHFILES += 0401-HACK-set-cma-pool-to-896MB.patch
PATCHFILES += 0403-HACK-silence-PFNs-busy-log-spam.patch
PATCHFILES += 0404-HACK-silence-meson-ir-warn-once-log-spam.patch
PATCHFILES += 0405-HACK-silence-hrtimer-log-spam.patch
PATCHFILES += 0406-HACK-Bluetooth-Fix-spurious-error-message.patch
PATCHFILES += 0427-media-rc-add-keymap-for-HardKernel-ODROID-remote.patch
PATCHFILES += 0428-media-rc-add-keymap-for-Khadas-VIM-EDGE-remote.patch
PATCHFILES += 0429-media-rc-add-keymap-for-KHAMSIN-remote.patch
PATCHFILES += 0430-media-rc-add-keymap-for-Philips-RC242-remote.patch
PATCHFILES += 0431-media-rc-add-keymap-for-Tanix-TX3-mini-remote.patch
PATCHFILES += 0432-media-rc-add-keymap-for-WeTek-Hub-remote.patch
PATCHFILES += 0433-media-rc-add-keymap-for-WeTeK-Play-2-remote.patch
PATCHFILES += 0434-ASoC-meson-correct-i2s-error-messages.patch
PATCHFILES += 0501-drm-panfrost-add-support-for-custom-soft-reset-on-Amlogic-GXM.patch
endif

# Patches for Rockchip audio support
ifeq (1,1)
PATCHFILES += 0615-arm64-dts-rockchip-add-HDMI-sound-node-for-rk3328-ro.patch
PATCHFILES += 0616-drm-dw-hdmi-extract-dw_hdmi_connector_update_edid.patch
PATCHFILES += 0617-drm-dw-hdmi-move-dw_hdmi_connector_detect.patch
PATCHFILES += 0618-drm-dw-hdmi-update-CEC-phys-addr-and-EDID-on-HPD-eve.patch
PATCHFILES += 0619-Revert-drm-edid-make-drm_edid_to_eld-static.patch
PATCHFILES += 0620-drm-dw-hdmi-update-ELD-on-HPD-event.patch
PATCHFILES += 0621-ASoC-hdmi-codec-add-hdmi_codec_eld_notify.patch
PATCHFILES += 0625-ASoC-hdmi-codec-reorder-channel-allocation-list.patch
PATCHFILES += 0626-drm-dw-hdmi-i2s-add-multi-channel-lpcm-support.patch
PATCHFILES += 0627-drm-dw-hdmi-call-hdmi_set_cts_n-after-clock-is-enabl.patch
PATCHFILES += 0628-fix-chmap_idx.patch
PATCHFILES += 0629-ASoC-rockchip-i2s-use-closest-clock-rate.patch
PATCHFILES += 0630-HACK-arm64-dts-rockchip-update-gpu-node-on-rk3328-ro.patch
PATCHFILES += 0631-HACK-arm64-dts-rockchip-remove-acodec-dai-on-rk3328-.patch
PATCHFILES += 0632-HACK-arm64-dts-rockchip-split-sound-node-on-rk3328-r.patch
PATCHFILES += 0634-WIP-dw-hdmi-cec-sleep-100ms-on-error.patch
PATCHFILES += 0635-WIP-arm64-dts-rockchip-work-in-progress-on-rk3328-ro.patch
PATCHFILES += 0636-HACK-arm64-dts-rockchip-rename-hdmi-sound-card-on-rk.patch
PATCHFILES += 0637-arm64-dts-rockchip-Enable-HDMI-audio-on-rk3399-rock-.patch
PATCHFILES += 0638-arm64-dts-rockchip-Enable-HDMI-audio-on-rk3399-nanop.patch
PATCHFILES += 0639-arm64-dts-rockchip-Fix-HDMI-audio-on-rk3399-orangepi.patch
PATCHFILES += 0640-arm64-dts-rockchip-Enable-HDMI-audio-on-rk3399-roc-p.patch
PATCHFILES += 0641-arm64-dts-rockchip-Enable-gpu-node-on-rk3399-roc-pc.patch
endif

# PATCHFILES += 0700-update-demabuf2-for-vc4_services.patch
PATCHFILES += 0700-videobuf2-Allow-exporting-of-a-struct-dmabuf.patch
PATCHFILES += 0701-add-vc4_servcies-for-raspberrypi.patch


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
