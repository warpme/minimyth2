
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

PATCHFILES += 0001-AmLogic-FROMGIT-vendor-prefixes-Add-prefix-for-Shenzhen-SEI-.patch
PATCHFILES += 0002-AmLogic-FROMGIT-arm64-dts-Add-SEI-Robotics-SEI510-Board.patch
PATCHFILES += 0003-AmLogic-FROMGIT-arm64-dts-meson-g12a-Add-AO-Secure-node.patch
PATCHFILES += 0004-AmLogic-FROMGIT-arm64-dts-meson-g12a-add-secure-monitor.patch
PATCHFILES += 0005-AmLogic-FROMGIT-arm64-dts-meson-g12a-add-efuse.patch
PATCHFILES += 0006-AmLogic-FROMGIT-arm64-dts-meson-g12a-Add-AO-Clock-Reset-Cont.patch
PATCHFILES += 0007-AmLogic-FROMGIT-arm64-dts-meson-g12a-add-pinctrl-support-con.patch
PATCHFILES += 0008-AmLogic-FROMGIT-arm64-dts-meson-g12a-add-uart_ao_a-pinctrl.patch
PATCHFILES += 0009-AmLogic-FROMGIT-arm64-dts-meson-g12a-add-reset-controller.patch
PATCHFILES += 0010-AmLogic-FROMGIT-arm64-dts-meson-g12a-Add-UART-A-B-C-nodes-an.patch
PATCHFILES += 0011-AmLogic-FROMGIT-arm64-dts-meson-g12a-u200-add-uart_AO-pinctr.patch
PATCHFILES += 0012-AmLogic-FROMGIT-arm64-dts-meson-g12a-sei510-add-uart_AO-pinc.patch
PATCHFILES += 0013-AmLogic-FROMGIT-arm64-dts-meson-g12a-x96-max-add-uart_AO-pin.patch
PATCHFILES += 0014-AmLogic-FROMGIT-arm64-dts-meson-g12a-sei510-add-regulators.patch
PATCHFILES += 0015-AmLogic-FROMGIT-arm64-dts-meson-g12a-x96-max-add-regulators.patch
PATCHFILES += 0016-AmLogic-FROMGIT-arm64-dts-meson-g12a-x96-max-Enable-BT-Modul.patch
PATCHFILES += 0017-AmLogic-FROMGIT-arm64-dts-meson-g12a-Add-CMA-reserved-memory.patch
PATCHFILES += 0018-AmLogic-FROMGIT-soc-amlogic-gx-socinfo-Add-mask-for-each-SoC.patch
PATCHFILES += 0019-AmLogic-FROMGIT-soc-amlogic-gx-socinfo-Add-new-SoC-IDs-and-P.patch
PATCHFILES += 0020-AmLogic-FROMGIT-meson-gx-socinfo-add-missing-of_node_put-aft.patch
PATCHFILES += 0021-AmLogic-FROMGIT-dt-bindings-iio-adc-document-the-Meson-G12A-.patch
PATCHFILES += 0022-AmLogic-FROMGIT-iio-adc-meson-saradc-add-support-for-Meson-G.patch
PATCHFILES += 0023-AmLogic-FROMGIT-clk-meson-g12a-add-cpu-clock-bindings.patch
PATCHFILES += 0024-AmLogic-FROMGIT-clk-g12a-aoclk-re-export-CLKID_AO_SAR_ADC_SE.patch
PATCHFILES += 0025-AmLogic-FROMGIT-dt-bindings-clk-g12a-clkc-add-PCIE-PLL-clock.patch
PATCHFILES += 0026-AmLogic-FROMGIT-dt-bindings-clock-axg-audio-unexpose-control.patch
PATCHFILES += 0027-AmLogic-FROMGIT-dt-bindings-clk-g12a-clkc-add-VDEC-clock-IDs.patch
PATCHFILES += 0028-AmLogic-FROMGIT-clk-meson-g12a-add-cpu-clocks.patch
PATCHFILES += 0029-AmLogic-FROMGIT-clk-meson-pll-add-reduced-specific-clk_ops-f.patch
PATCHFILES += 0030-AmLogic-FROMGIT-dt-bindings-clock-g12a-aoclk-expose-CLKID_AO.patch
PATCHFILES += 0031-AmLogic-FROMGIT-clk-meson-g12a-add-PCIE-PLL-clocks.patch
PATCHFILES += 0032-AmLogic-FROMGIT-clk-meson-g12a-add-video-decoder-clocks.patch
PATCHFILES += 0033-AmLogic-FROMGIT-dt-bindings-clk-axg-audio-add-g12a-support.patch
PATCHFILES += 0034-AmLogic-FROMGIT-clk-meson-axg_audio-replace-prefix-axg-by-au.patch
PATCHFILES += 0035-AmLogic-FROMGIT-clk-meson-axg-audio-don-t-register-inputs-in.patch
PATCHFILES += 0036-AmLogic-FROMGIT-clk-meson-axg-audio-add-g12a-support.patch
PATCHFILES += 0037-AmLogic-FROMGIT-drm-meson-exclusively-use-the-canvas-provide.patch
PATCHFILES += 0038-AmLogic-FROMGIT-dt-bindings-gpu-add-bindings-for-the-ARM-Mal.patch
PATCHFILES += 0039-AmLogic-FROMGIT-dt-bindings-display-amlogic-meson-vpu-Add-G1.patch
PATCHFILES += 0040-AmLogic-FROMGIT-dt-bindings-display-amlogic-meson-dw-hdmi-Ad.patch
PATCHFILES += 0041-AmLogic-FROMGIT-drm-meson-Switch-PLL-to-5.94GHz-base-for-297.patch
PATCHFILES += 0042-AmLogic-FROMGIT-drm-meson-Add-registers-for-G12A-SoC.patch
PATCHFILES += 0043-AmLogic-FROMGIT-drm-meson-Add-G12A-Support-for-VPP-setup.patch
PATCHFILES += 0044-AmLogic-FROMGIT-drm-meson-Add-G12A-Support-for-VIU-setup.patch
PATCHFILES += 0045-AmLogic-FROMGIT-drm-meson-Add-G12A-support-for-OSD1-Plane.patch
PATCHFILES += 0046-AmLogic-FROMGIT-drm-meson-Add-G12A-Support-for-the-Overlay-v.patch
PATCHFILES += 0047-AmLogic-FROMGIT-drm-meson-Add-G12A-support-for-plane-handlin.patch
PATCHFILES += 0048-AmLogic-FROMGIT-drm-meson-Add-G12A-support-for-CVBS-Encoder.patch
PATCHFILES += 0049-AmLogic-FROMGIT-drm-meson-Add-G12A-Video-Clock-setup.patch
PATCHFILES += 0050-AmLogic-FROMGIT-drm-meson-Add-G12A-compatible.patch
PATCHFILES += 0051-AmLogic-FROMGIT-drm-meson-Add-G12A-support-for-the-DW-HDMI-G.patch
PATCHFILES += 0052-AmLogic-FROMGIT-dt-bindings-phy-Add-Amlogic-G12A-USB2-PHY-Bi.patch
PATCHFILES += 0053-AmLogic-FROMGIT-dt-bindings-phy-Add-Amlogic-G12A-USB3-PCIE-C.patch
PATCHFILES += 0054-AmLogic-FROMGIT-phy-amlogic-add-Amlogic-G12A-USB2-PHY-Driver.patch
PATCHFILES += 0055-AmLogic-FROMGIT-phy-amlogic-Add-Amlogic-G12A-USB3-PCIE-Combo.patch
PATCHFILES += 0056-AmLogic-FROMGIT-ASoC-max98357a-add-missing-supported-rates.patch
PATCHFILES += 0057-AmLogic-FROMGIT-ASoC-meson-add-g12a-compatibles.patch
PATCHFILES += 0058-AmLogic-FROMGIT-ASoC-meson-axg-fifo-add-g12a-support.patch
PATCHFILES += 0059-AmLogic-FROMGIT-ASoC-meson-axg-toddr-add-g12a-support.patch
PATCHFILES += 0060-AmLogic-FROMGIT-ASoC-meson-axg-frddr-add-g12a-support.patch
PATCHFILES += 0061-AmLogic-FROMGIT-ASoC-meson-axg-tdm-formatter-rework-quirks-s.patch
PATCHFILES += 0062-AmLogic-FROMGIT-ASoC-meson-axg-tdmout-add-g12a-support.patch
PATCHFILES += 0063-AmLogic-FROMGIT-dt-bindings-power-amlogic-meson-gx-pwrc-Add-.patch
PATCHFILES += 0064-AmLogic-FROMGIT-arm64-dts-meson-g12a-Add-SAR-ADC-node.patch
PATCHFILES += 0065-AmLogic-FROMGIT-arm64-dts-meson-g12a-Add-G12A-USB-nodes.patch
PATCHFILES += 0066-AmLogic-FROMGIT-arm64-dts-meson-g12a-Add-mali-g31-gpu-node.patch
PATCHFILES += 0067-AmLogic-FROMGIT-arm64-dts-meson-g12a-u200-add-regulators.patch
PATCHFILES += 0068-AmLogic-FROMGIT-arm64-dts-meson-g12a-sei510-Add-ADC-Key-and-.patch
PATCHFILES += 0069-AmLogic-FROMGIT-arm64-dts-meson-g12a-sei510-Enable-USB.patch
PATCHFILES += 0070-AmLogic-FROMGIT-arm64-dts-meson-g12a-u200-Enable-USB.patch
PATCHFILES += 0071-AmLogic-FROMGIT-arm64-dts-meson-g12a-x96-max-Enable-USB.patch
PATCHFILES += 0072-AmLogic-FROMGIT-arm64-dts-meson-g12a-Add-VPU-and-HDMI-relate.patch
PATCHFILES += 0073-AmLogic-FROMGIT-arm64-dts-meson-g12a-Add-AO-CEC-nodes.patch
PATCHFILES += 0074-AmLogic-FROMGIT-arm64-dts-meson-g12a-x96-max-Add-support-for.patch
PATCHFILES += 0075-AmLogic-FROMGIT-arm64-dts-meson-g12a-sei510-Add-support-for-.patch
PATCHFILES += 0076-AmLogic-FROMGIT-arm64-dts-meson-g12a-u200-Add-support-for-Vi.patch
PATCHFILES += 0077-AmLogic-FROMGIT-soc-amlogic-meson-gx-pwrc-vpu-Fix-power-on-o.patch
PATCHFILES += 0078-AmLogic-FROMGIT-soc-amlogic-meson-gx-pwrc-vpu-Add-support-fo.patch
PATCHFILES += 0079-AmLogic-FROMGIT-media-cec-notifier-add-cec_notifier_parse_hd.patch
PATCHFILES += 0080-AmLogic-FROMGIT-media-dt-bindings-media-meson-ao-cec-Add-G12.patch
PATCHFILES += 0081-AmLogic-FROMGIT-media-platform-meson-Add-Amlogic-Meson-G12A-.patch
PATCHFILES += 0082-AmLogic-FROMGIT-media-MAINTAINERS-Update-AO-CEC-with-ao-cec-.patch
PATCHFILES += 0083-AmLogic-FROMGIT-drm-meson-Make-some-functions-static.patch
PATCHFILES += 0084-AmLogic-FROMGIT-drm-meson-add-size-and-alignment-requirement.patch
PATCHFILES += 0085-AmLogic-FROMGIT-dt-bindings-net-phy-add-g12a-mdio-mux-docume.patch
PATCHFILES += 0086-AmLogic-FROMGIT-net-phy-add-amlogic-g12a-mdio-mux-support.patch
PATCHFILES += 0087-AmLogic-FROMGIT-net-phy-meson-gxl-add-g12a-support.patch
PATCHFILES += 0088-AmLogic-FROMGIT-net-phy-meson-gxl-clean-up-gxl-variant-drive.patch
PATCHFILES += 0089-AmLogic-FROMLIST-clk-meson-g12a-fix-gp0-and-hifi-ranges.patch
PATCHFILES += 0090-AmLogic-FROMLIST-media-platform-meson-ao-cec-fix-possible-ob.patch
PATCHFILES += 0091-AmLogic-FROMLIST-dt-bindings-usb-dwc2-Add-Amlogic-G12A-DWC2-.patch
PATCHFILES += 0092-AmLogic-FROMLIST-dt-bindings-usb-dwc3-Add-Amlogic-G12A-DWC3-.patch
PATCHFILES += 0093-AmLogic-FROMLIST-usb-dwc2-Add-Amlogic-G12A-DWC2-Params.patch
PATCHFILES += 0094-AmLogic-FROMLIST-usb-dwc3-Add-Amlogic-G12A-DWC3-glue.patch
PATCHFILES += 0095-AmLogic-FROMLIST-clk-meson-mpll-add-init-callback-and-regs.patch
PATCHFILES += 0096-AmLogic-FROMLIST-clk-meson-g12a-add-mpll-register-init-seque.patch
PATCHFILES += 0097-AmLogic-FROMLIST-clk-meson-eeclk-add-init-regs.patch
PATCHFILES += 0098-AmLogic-FROMLIST-clk-meson-g12a-add-controller-register-init.patch
PATCHFILES += 0099-AmLogic-FROMLIST-clk-meson-mpll-properly-handle-spread-spect.patch
PATCHFILES += 0100-AmLogic-FROMLIST-clk-meson-gxbb-no-spread-spectrum-on-mpll0.patch
PATCHFILES += 0101-AmLogic-FROMLIST-clk-meson-axg-spread-spectrum-is-on-mpll2.patch
PATCHFILES += 0102-AmLogic-FROMLIST-dt-bindings-pinctrl-meson-Add-drive-strengt.patch
PATCHFILES += 0103-AmLogic-FROMLIST-pinctrl-meson-add-support-of-drive-strength.patch
PATCHFILES += 0104-AmLogic-FROMLIST-pwm-meson-use-the-spin-lock-only-to-protect.patch
PATCHFILES += 0105-AmLogic-FROMLIST-dt-bindings-clk-g12a-clkc-add-Temperature-S.patch
PATCHFILES += 0106-AmLogic-FROMLIST-clk-meson-g12a-Add-Temperature-Sensor-clock.patch
PATCHFILES += 0107-AmLogic-FROMLIST-dt-bindings-clk-meson-add-g12b-periph-clock.patch
PATCHFILES += 0108-AmLogic-FROMLIST-clk-meson-g12a-Add-support-for-G12B-CPUB-cl.patch
PATCHFILES += 0109-AmLogic-FROMLIST-clk-meson-g12a-mark-fclk_div3-as-critical.patch
PATCHFILES += 0110-AmLogic-FROMLIST-dt-bindings-arm-amlogic-add-G12B-bindings.patch
PATCHFILES += 0111-AmLogic-FROMLIST-dt-bindings-arm-amlogic-add-Odroid-N2-bindi.patch
PATCHFILES += 0112-AmLogic-FROMLIST-arm64-dts-meson-Add-minimal-support-for-Odr.patch
PATCHFILES += 0113-AmLogic-FROMLIST-dt-bindings-pwm-Update-bindings-for-the-Mes.patch
PATCHFILES += 0114-AmLogic-FROMLIST-pwm-meson-Add-clock-source-configuration-fo.patch
PATCHFILES += 0115-AmLogic-FROMLIST-arm64-dts-meson-g12a-Add-PWM-nodes.patch
PATCHFILES += 0116-AmLogic-FROMLIST-arm64-dts-meson-g12a-Add-IR-nodes.patch
PATCHFILES += 0117-AmLogic-FROMLIST-arm64-dts-meson-g12a-x96-max-enable-IR-deco.patch
PATCHFILES += 0118-AmLogic-FROMLIST-arm64-dts-meson-g12a-u200-enable-IR-decoder.patch
PATCHFILES += 0119-AmLogic-FROMLIST-mmc-meson-gx-remove-open-coded-read-with-ti.patch
PATCHFILES += 0120-AmLogic-FROMLIST-mmc-meson-gx-ack-only-raised-irq.patch
PATCHFILES += 0121-AmLogic-FROMLIST-mmc-meson-gx-correct-irq-flag.patch
PATCHFILES += 0122-AmLogic-FROMLIST-mmc-meson-gx-disable-HS400.patch
PATCHFILES += 0123-AmLogic-FROMLIST-mmc-meson-gx-avoid-clock-glitch-when-switch.patch
PATCHFILES += 0124-AmLogic-FROMLIST-mmc-meson-gx-remove-Rx-phase-tuning.patch
PATCHFILES += 0125-AmLogic-FROMLIST-mmc-meson-gx-add-signal-resampling-tuning.patch
PATCHFILES += 0126-AmLogic-FROMLIST-drm-meson-Add-support-for-XBGR8888-ABGR8888.patch
PATCHFILES += 0127-AmLogic-FROMLIST-drm-meson-Add-zpos-immutable-property-to-pl.patch
PATCHFILES += 0128-AmLogic-WIP-arm64-dts-meson-g12a-add-mhu-mailboxes.patch
PATCHFILES += 0129-AmLogic-WIP-arm64-dts-meson-g12a-add-sram-shared-memory.patch
PATCHFILES += 0130-AmLogic-WIP-arm64-dts-meson-g12a-add-mmc-pins.patch
PATCHFILES += 0131-AmLogic-WIP-arm64-dts-meson-add-dwmac-3.710-to-ethmac-compat.patch
PATCHFILES += 0132-AmLogic-WIP-arm64-dts-g12a-add-mmc-controllers.patch
PATCHFILES += 0133-AmLogic-WIP-arm64-dts-meson-u200-add-sd-and-emmc.patch
PATCHFILES += 0134-AmLogic-WIP-arm64-dts-meson-g12a-set-uart_ao-clocks.patch
PATCHFILES += 0135-AmLogic-WIP-arm64-dts-g12a-add-mailbox-clock-gate.patch
PATCHFILES += 0136-AmLogic-WIP-arm64-dts-meson-g12a-add-uart_ao-reset.patch
PATCHFILES += 0137-AmLogic-WIP-arm64-dts-meson-g12a-add-ethernet-pinctrl-defini.patch
PATCHFILES += 0138-AmLogic-WIP-arm64-dts-meson-g12a-add-ethernet-mac-controller.patch
PATCHFILES += 0139-AmLogic-WIP-arm64-dts-meson-g12a-add-mdio-multiplexer.patch
PATCHFILES += 0140-AmLogic-WIP-arm64-dts-meson-u200-add-internal-network.patch
PATCHFILES += 0141-AmLogic-WIP-arm64-dts-meson-sei510-add-sd-and-emmc.patch
PATCHFILES += 0142-AmLogic-WIP-arm64-dts-meson-sei510-add-network-support.patch
PATCHFILES += 0143-AmLogic-WIP-drm-bridge-dw-hdmi-support-dynamically-get-input.patch
PATCHFILES += 0144-AmLogic-WIP-drm-bridge-dw-hdmi-allow-ycbcr420-modes-for-0x20.patch
PATCHFILES += 0145-AmLogic-WIP-drm-meson-Add-YUV420-output-support.patch
PATCHFILES += 0146-AmLogic-WIP-drm-meson-Output-in-YUV444-if-sink-supports-it.patch
PATCHFILES += 0147-AmLogic-WIP-arm64-dts-meson-x96-add-sd-and-emmc.patch
PATCHFILES += 0148-AmLogic-WIP-arm64-dts-meson-g12a-x96-max-Enable-Wifi-SDIO-Mo.patch
PATCHFILES += 0149-AmLogic-WIP-arm64-dts-meson-g12a-x96-max-Add-Gigabit-Etherne.patch
PATCHFILES += 0150-AmLogic-WIP-arm64-dts-meson-g12a-sei510-Add-base-peripherals.patch
PATCHFILES += 0151-AmLogic-WIP-arm64-dts-meson-g12a-add-missing-drive-strength-.patch
PATCHFILES += 0152-AmLogic-WIP-arm64-dts-meson-g12a-add-drive-strength-for-eth-.patch
PATCHFILES += 0153-AmLogic-fixup-WIP-pinctrl-meson-add-support-of-drive-strengt.patch
PATCHFILES += 0154-AmLogic-WIP-arm64-dts-meson-g12b-odroid-n2-Add-peripherals.patch
PATCHFILES += 0155-AmLogic-ARM64-defconfig-enable-CEC-support.patch
PATCHFILES += 0156-AmLogic-ASoC-meson-add-meson-audio-core-driver.patch
PATCHFILES += 0157-AmLogic-ASoC-meson-add-register-definitions.patch
PATCHFILES += 0158-AmLogic-ASoC-meson-add-initial-aiu-i2s-support.patch
PATCHFILES += 0159-AmLogic-ASoC-meson-add-initial-spdif-support.patch
PATCHFILES += 0160-AmLogic-ARM64-defconfig-enable-audio-support-for-meson-SoCs-.patch
PATCHFILES += 0161-AmLogic-ARM64-dts-meson-gx-add-audio-controller-nodes.patch
PATCHFILES += 0162-AmLogic-snd-meson-activate-HDMI-audio-path.patch
PATCHFILES += 0163-AmLogic-drm-meson-select-dw-hdmi-i2s-audio-for-meson-hdmi.patch
PATCHFILES += 0164-AmLogic-ARM64-dts-meson-gx-add-sound-dai-cells-to-HDMI-node.patch
PATCHFILES += 0165-AmLogic-ARM64-dts-meson-activate-hdmi-audio-HDMI-enabled-boa.patch
PATCHFILES += 0166-AmLogic-drm-bridge-dw-hdmi-Use-AUTO-CTS-setup-mode-when-non-.patch
PATCHFILES += 0167-AmLogic-drm-export-drm_timeout_abs_to_jiffies.patch
PATCHFILES += 0168-AmLogic-drm-Add-library-for-shmem-backed-GEM-objects.patch
PATCHFILES += 0169-AmLogic-drm-Add-reservation_object-to-drm_gem_object.patch
PATCHFILES += 0170-AmLogic-drm-Add-helpers-for-locking-an-array-of-BO-reservati.patch
PATCHFILES += 0171-AmLogic-BACKPORT-drm-lima-driver-for-ARM-Mali4xx-GPUs.patch
PATCHFILES += 0172-AmLogic-iommu-io-pgtable-Add-ARM-Mali-midgard-MMU-page-table.patch
PATCHFILES += 0173-AmLogic-drm-Add-a-drm_gem_objects_lookup-helper.patch
PATCHFILES += 0174-AmLogic-FROMLIST-drm-panfrost-Add-initial-panfrost-driver.patch
PATCHFILES += 0175-AmLogic-arm64-dts-meson-gxm-Add-Mali-T820-node.patch
PATCHFILES += 0176-AmLogic-arm64-dts-meson-gxm-nexbox-a1-Enable-USB.patch
PATCHFILES += 0177-AmLogic-arm64-dts-meson-gxm-nexbox-a1-disable-cvbs.patch
PATCHFILES += 0178-AmLogic-WiP-drm-panfrost-add-support-for-custom-soft-reset-o.patch
endif

# Patches for Amlogic video decoder
# based on https://github.com/Elyotna/linux/commits/5.0/v4l2-m2m-pr
ifeq (1,1)
PATCHFILES += 0201-AmLogic-dt-bindings-media-add-Amlogic-Video-Decoder-Bindings.patch
PATCHFILES += 0202-AmLogic-media-meson-add-v4l2-m2m-video-decoder-driver.patch
PATCHFILES += 0203-AmLogic-MAINTAINERS-Add-meson-video-decoder.patch
PATCHFILES += 0204-AmLogic-arm64-dts-meson-gx-add-vdec-entry.patch
PATCHFILES += 0205-AmLogic-arm64-dts-meson-add-vdec-entries.patch
PATCHFILES += 0206-AmLogic-meson-vdec-introduce-controls-and-V4L2_CID_MIN_BUFFE.patch
PATCHFILES += 0207-AmLogic-media-videodev2-add-V4L2_FMT_FLAG_NO_SOURCE_CHANGE.patch
PATCHFILES += 0208-AmLogic-meson-vdec-allow-subscribing-to-V4L2_EVENT_SOURCE_CH.patch
PATCHFILES += 0209-AmLogic-media-meson-vdec-add-H.264-decoding-support.patch
PATCHFILES += 0210-AmLogic-media-meson-vdec-add-MPEG4-decoding-support.patch
PATCHFILES += 0211-AmLogic-media-meson-vdec-add-MJPEG-decoding-support.patch
PATCHFILES += 0212-AmLogic-media-videodev2.h-Add-Amlogic-compressed-format.patch
PATCHFILES += 0213-AmLogic-media-meson-vdec-add-support-for-V4L2_PIX_FMT_AM21C.patch
PATCHFILES += 0214-AmLogic-meson-vdec-make-amvdec_dst_buf_done_offset-public.patch
PATCHFILES += 0215-AmLogic-media-meson-vdec-add-HEVC-decoding-support.patch
PATCHFILES += 0216-AmLogic-media-meson-vdec-more-debug-output-on-src-change.patch
PATCHFILES += 0217-AmLogic-meson-vdec-Map-the-Firmware-buf-idx-VB2-buf-idx.patch
PATCHFILES += 0218-AmLogic-media-meson-vdec-commonize-some-HEVC-code.patch
PATCHFILES += 0219-AmLogic-media-meson-vdec-add-VP9-input-support.patch
PATCHFILES += 0220-AmLogic-media-meson-vdec-add-VP9-support.patch
PATCHFILES += 0221-AmLogic-media-meson-vdec-don-t-keep-queuing-inputs-on-stop_s.patch
PATCHFILES += 0222-AmLogic-media-meson-vp9-multiple-fixes-for-lockups.patch
PATCHFILES += 0223-AmLogic-vp9-cosmetics.patch
PATCHFILES += 0224-AmLogic-media-meson-vdec-fixes-for-5.0.patch
endif

# Misc patches for Atheros 10k WiFi driver
# https://github.com/kszaq/LibreELEC.tv/tree/amlogic/packages/linux/patches/amlogic-amlgx
ifeq (1,1)
PATCHFILES += 0301-AmLogic-ath10k-add-inline-wrapper-for-htt_h2t_aggr_cfg_msg.patch
PATCHFILES += 0302-AmLogic-ath10k-add-htt_h2t_aggr_cfg_msg-op-for-high-latency-.patch
# PATCHFILES += 0303-AmLogic-ath10k-remove-iteration-in-wake_tx_queue.patch
PATCHFILES += 0304-AmLogic-ath10k-use-clean-packet-headers.patch
PATCHFILES += 0305-AmLogic-ath10k-high-latency-fixes-for-beacon-buffer.patch
PATCHFILES += 0306-AmLogic-ath10k-sdio-read-RX-packets-in-bundles.patch
PATCHFILES += 0307-AmLogic-ath10k-sdio-add-MSDU-ID-allocation-in-HTT-TX-path.patch
PATCHFILES += 0308-AmLogic-ath10k-sdio-add-missing-error-check.patch
PATCHFILES += 0309-AmLogic-ath10k-sdio-replace-skb_trim-with-explicit-set-of-sk.patch
PATCHFILES += 0310-AmLogic-ath10k-add-TARGET_QCA9377_HL_NUM_PEERS.patch
PATCHFILES += 0311-AmLogic-ath10k-add-QCA9377-usb-hw_param-item.patch
PATCHFILES += 0312-AmLogic-ath10k-add-QCA9377-sdio-hw_param-item.patch
PATCHFILES += 0313-AmLogic-ath10k-add-start_once-support.patch
PATCHFILES += 0314-AmLogic-ath10k_sdio-hif-start-once-addition.patch
PATCHFILES += 0315-AmLogic-ath10k-sdio-readd-start_once.patch
PATCHFILES += 0316-AmLogic-ath10k-add-n_cipher_suites-for-QCA9377-USB-SDIO.patch
PATCHFILES += 0317-AmLogic-ath10k_sdio-DMA-bounce-buffers-for-read-write.patch
endif

# Misc patches for AmLogic
# https://github.com/kszaq/LibreELEC.tv/tree/amlogic/packages/linux/patches/amlogic-amlgx
ifeq (1,1)
PATCHFILES += 0401-AmLogic-HACK-set-cma-pool-to-896MB.patch
PATCHFILES += 0403-AmLogic-HACK-silence-PFNs-busy-log-spam.patch
PATCHFILES += 0404-AmLogic-HACK-silence-meson-ir-warn-once-log-spam.patch
PATCHFILES += 0405-AmLogic-HACK-silence-hrtimer-log-spam.patch
PATCHFILES += 0406-AmLogic-HACK-Bluetooth-Fix-spurious-error-message.patch
PATCHFILES += 0407-AmLogic-WIP-hdmi-patch.patch
# PATCHFILES += 0409-AmLogic-WIP-fix-meson-gx-socid-output.patch
PATCHFILES += 0410-AmLogic-WIP-set-max-frequency-100000000-for-emmc-nodes.patch
PATCHFILES += 0411-AmLogic-arm64-dts-meson-gxbb-vega-s95-update-dtsi-with-many-.patch
PATCHFILES += 0412-AmLogic-arm64-dts-meson-gxbb-wetek.dtsi-enable-bluetooth.patch
PATCHFILES += 0413-AmLogic-arm64-dts-meson-gxbb-wetek.dtsi-enable-saradc-node.patch
PATCHFILES += 0414-AmLogic-arm64-dts-meson-gxbb-gxl-gxm-set-audio-card-name-to-.patch
PATCHFILES += 0415-AmLogic-arm64-dts-meson-gxbb-odroid-set-blue-led-to-on.patch
PATCHFILES += 0416-AmLogic-arm64-dts-meson-gxbb-odroid-set-rc-odroid-ir-keymap.patch
PATCHFILES += 0417-AmLogic-arm64-dts-meson-gxbb-vega-s95-set-rc-vega-s95-ir-key.patch
PATCHFILES += 0418-AmLogic-arm64-dts-meson-gxbb-wetek-hub-set-rc-wetek-hub-ir-k.patch
PATCHFILES += 0419-AmLogic-arm64-dts-meson-gxbb-wetek-play2-set-rc-wetek-play2-.patch
PATCHFILES += 0420-AmLogic-arm64-dts-meson-gxl-s905x-khadas-vim-use-rc-khadas-r.patch
PATCHFILES += 0421-AmLogic-arm64-dts-meson-gxl-s905x-khadas-vim-fix-address-siz.patch
PATCHFILES += 0422-AmLogic-arm64-dts-meson-gxl-s905w-tx3-mini-set-rc-tx3mini-ir.patch
PATCHFILES += 0423-AmLogic-arm64-dts-meson-gxm-khadas-vim2-set-eee-broken-1000t.patch
PATCHFILES += 0424-AmLogic-arm64-dts-meson-gxm-khadas-vim2-fix-address-size-cel.patch
PATCHFILES += 0425-AmLogic-arm64-dts-meson-gxm-khadas-vim2-set-bt-compatible.patch
PATCHFILES += 0426-AmLogic-arm64-dts-meson-gxm-vega-s96-set-rc-vega-s95-ir-keym.patch
PATCHFILES += 0427-AmLogic-media-rc-add-keymap-for-HardKernel-ODROID-remote.patch
PATCHFILES += 0428-AmLogic-media-rc-add-keymap-for-Khadas-VIM-EDGE-remote.patch
PATCHFILES += 0429-AmLogic-media-rc-add-keymap-for-KHAMSIN-remote.patch
PATCHFILES += 0430-AmLogic-media-rc-add-keymap-for-Philips-RC242-remote.patch
PATCHFILES += 0431-AmLogic-media-rc-add-keymap-for-Tanix-TX3-mini-remote.patch
PATCHFILES += 0432-AmLogic-media-rc-add-keymap-for-WeTek-Hub-remote.patch
PATCHFILES += 0433-AmLogic-media-rc-add-keymap-for-WeTeK-Play-2-remote.patch
PATCHFILES += 0434-AmLogic-ASoC-meson-correct-i2s-error-messages.patch
PATCHFILES += 0435-AmLogic-dt-bindings-Add-vendor-prefix-for-SmartLabs-LLC.patch
PATCHFILES += 0436-AmLogic-dt-bindings-arm-amlogic-Add-support-for-the-SmartLab.patch
PATCHFILES += 0437-AmLogic-ARM64-dts-meson-gxl-Add-support-for-the-SmartLabs-SM.patch
PATCHFILES += 0438-AmLogic-ARM64-dts-meson-gx-add-ATF-BL32-reserved-memory-regi.patch
endif

# Misc patches for Panfrost driver
# https://github.com/kszaq/LibreELEC.tv/tree/amlogic/packages/linux/patches/amlogic-amlgx
ifeq (1,1)
PATCHFILES += 0501-AmLogic-drm-panfrost-Add-support-for-2MB-page-entries.patch
PATCHFILES += 0502-AmLogic-drm-panfrost-Make-panfrost_gem_free_object-static.patch
PATCHFILES += 0503-AmLogic-drm-panfrost-Add-missing-include.patch
PATCHFILES += 0504-AmLogic-drm-panfrost-depend-on-GENERIC_ATOMIC64-when-using-C.patch
PATCHFILES += 0505-AmLogic-drm-panfrost-Prevent-concurrent-resets.patch
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
