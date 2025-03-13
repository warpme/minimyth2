ifeq (1,1)
#--Use this for mainline official x.y.z kernel from SCM----
MASTER_SITES        = https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/snapshot/
DISTFILES           = $(DISTNAME).tar.gz $(CONFIGFILE)
WORKSRC             = $(WORKDIR)/linux-$(LINUX_VERSION)
#----------------------------------------------------------
endif

ifeq (0,1)
#--Use this for mainline git-commit kernel from SCM--------
MASTER_SITES        = https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/snapshot/
GITHASH             = 
DISTFILES           = $(GITHASH).tar.gz $(CONFIGFILE)
WORKSRC             = $(WORKDIR)/$(GITHASH)
#----------------------------------------------------------
endif

ifeq (0,1)
#--Use this for mainline official x.y.z kernel from GIT----
MASTER_SITES       += https://github.com/torvalds/linux/archive/
DISTFILES           = v$(LINUX_VERSION).tar.gz $(CONFIGFILE)
WORKSRC             = $(WORKDIR)/linux-$(LINUX_VERSION)
#----------------------------------------------------------
endif

GARNAME = linux
GARVERSION = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),$(if $(filter-out 0,$(LINUX_TEENY_VERSION)),.$(LINUX_TEENY_VERSION)))$(LINUX_EXTRA_VERSION)
CATEGORIES = kernel-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)

CONFIGFILE = linux-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)-$(GARCH_FAMILY)-$(GARCH).config

PATCHFILES  = linux-6.14.patch.gar
PATCHFILES += linux-6.14-perl.patch.gar
PATCHFILES += linux-6.14-defaults.patch

ifeq (1,1)

PATCHFILES += 0108-drivers-led-add-openvfd-g3118dda3.patch
PATCHFILES += 0109-drivers-mmc-add-disk-activity-support.patch

ifeq (1,1)
# Misc panfrost patches for 6.14 kernel
PATCHFILES += 0110-drivers-net-wireless-brcmfmac-add-ap6330-firmware.patch
endif

ifeq (1,1)
# Switch GPU DVFS governors default as 'performance'
PATCHFILES += 0125-drm-lima-dvfs-switch-gov-to-performance.patch
PATCHFILES += 0126-drm-panfrost-dvfs-switch-gov-to-performance.patch
endif

ifeq (1,1)
#-- Amlogic patches -----------------------------------------
# increas CMA pool for 4k decode
PATCHFILES += 0311-arm64-dts-meson-set-dma-pool-to-896MB.patch
PATCHFILES += 0312-g12-set-cma-to-896MiB-for-4k.patch
PATCHFILES += 0329-media-meson-vdec-esparser-check-parsing-.patch
PATCHFILES += 0330-media-meson-vdec-implement-10bit-bitstre.patch
PATCHFILES += 0331-media-meson-vdec-add-HEVC-decode-codec.patch
PATCHFILES += 0332-media-meson-vdec-disable-MPEG1-MPEG2-hardware-de.patch
# device-tree patches
PATCHFILES += 0341-arm64-meson-add-Amlogic-Meson-GX-PM-Suspend.patch
PATCHFILES += 0342-arm64-dts-meson-add-support-for-GX-PM-and-Virtu.patch
PATCHFILES += 0361-arm64-dts-meson-gxm-add-beelink-gt1.patch
PATCHFILES += 0371-arm64-dts-meson-sm1-add-support-for-TX5-plus.patch
# Fixes non-working EGLFS DRM_PRIME/DRM Planes on all Amlogic HW I have
PATCHFILES += 0377-drm-meson-swap-primary-overlay-zpos.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Allwinner H6 patches -----------------------------------------
PATCHFILES += 0500-clk-Implement-protected-clocks-for-all-OF-clock-prov.patch
PATCHFILES += 0501-revert-clk-qcom-Support-protected-clocks-property.patch
PATCHFILES += 0502-rtc-sun6i-Allow-RTC-wakeup-after-shutdown.patch
PATCHFILES += 0503-firmware-arm_scpi-Support-unidirectional-mailbox-cha.patch
PATCHFILES += 0504-mfd-add-AC200.patch
PATCHFILES += 0505-net-phy-Add-support-for-AC200-EPHY.patch
PATCHFILES += 0506-net-wireless-add-xr819-support-07072021.patch
PATCHFILES += 0507-net-stmmac-sun8i-Use-devm_regulator_get-for-PHY-regu.patch
PATCHFILES += 0508-net-stmmac-sun8i-Rename-PHY-regulator-variable-to-re.patch
PATCHFILES += 0509-net-stmmac-sun8i-Add-support-for-enabling-a-regulato.patch
PATCHFILES += 0510-iommu-sun50i-Allow-page-sizes-multiple-of-4096.patch
PATCHFILES += 0520-drm-sun4i-mixer-Add-caching-support.patch
PATCHFILES += 0521-drm-sun4i-dw-hdmi-Deinit-PHY-in-fail-path.patch
PATCHFILES += 0522-drm-sun4i-dw-hdmi-Remove-double-encoder-cleanup.patch
PATCHFILES += 0523-drm-sun4i-dw-hdmi-Switch-to-bridge-functions.patch
PATCHFILES += 0524-drm-sun4i-Don-t-show-error-for-deferred-probes.patch
PATCHFILES += 0525-drm-sun4i-dw-hdmi-Make-sun8i_hdmi_phy_get-more-intui.patch
PATCHFILES += 0526-drm-sun4i-dw-hdmi-check-for-phy-device-first.patch
PATCHFILES += 0527-drm-sun4i-de2-de3-Change-CSC-argument.patch
PATCHFILES += 0528-drm-sun4i-de2-de3-Merge-CSC-functions-into-one.patch
PATCHFILES += 0529-drm-sun4i-de2-de3-call-csc-setup-also-for-UI-layer.patch
PATCHFILES += 0530-drm-bridge-dw-hdmi-add-mtmdsclock-parameter-to-phy-c.patch
PATCHFILES += 0531-drm-bridge-dw-hdmi-support-configuring-phy-for-deep-.patch
PATCHFILES += 0532-drm-sun4i-de3-Add-support-for-YUV420-output.patch
PATCHFILES += 0533-drm-sun4i-de2-Initialize-layer-fields-earlier.patch
PATCHFILES += 0534-drm-sun4i-de3-Implement-AFBC-support.patch
PATCHFILES += 0535-drm-dw-hdmi-cec-sleep-100ms-on-error.patch
PATCHFILES += 0536-drm-bridge-dw-hdmi-fix-4k60-modes-on-some-tv.patch
PATCHFILES += 0537-drm-bridge-synopsys-Fix-CEC-not-working-after-power.patch
PATCHFILES += 0538-HACK-SW-CEC-implementation-for-H3.patch
PATCHFILES += 0550-HACK-clk-sunxi-ng-unify-parent-for-HDMI-clocks.patch
PATCHFILES += 0552-asoc-sun4i-i2s-WiP-multi-channel.patch
PATCHFILES += 0553-media-cedrus-Don-t-CPU-map-source-buffers.patch
PATCHFILES += 0554-media-Add-NV12-and-P010-AFBC-compressed-formats.patch
PATCHFILES += 0555-media-cedrus-add-format-filtering-based-on-depth-and.patch
# commented as commpressed out format not works with ffmpeg7.1 v4l2_request
# PATCHFILES += 0556-media-cedrus-Implement-AFBC-YUV420-formats-for-H265.patch
PATCHFILES += 0557-media-cedrus-Increase-H6-clock-rate.patch
PATCHFILES += 0560-mmc-sunxi-fix-unusuable-eMMC-on-some-H6-boards-by-di.patch
PATCHFILES += 0561-bluetooth-btrtl-add-hci-ver-rtl8822cs.patch
PATCHFILES += 0562-h6-add-sun50i-di-deinterlace-WiP.patch
# todo PATCHFILES += 0563-hantro-Add-quirk-for-NV12-NV12_4L4-capture-format.patch
# device-tree patches
PATCHFILES += 0570-arm64-dts-allwinner-h6-Protect-SCP-clock.patch
PATCHFILES += 0571-arm64-dts-allwinner-h6-Add-SCPI-protocol.patch
PATCHFILES += 0572-arm64-dts-allwinner-h6-dtsi-add-sound-node.patch
PATCHFILES += 0573-arm64-dts-allwinner-h6-Fix-Cedrus-IOMMU-again.patch
PATCHFILES += 0574-arm64-dts-allwinner-h6.dtsi-add-ac200-nodes.patch
PATCHFILES += 0575-arm64-dts-allwinner-gs1-fix-eMMC-and-incr-vcpu-limit.patch
PATCHFILES += 0576-arm64-dts-allwinner-tanix-tx6-mini-enable-eth.patch
PATCHFILES += 0577-arm64-dts-allwinner-add-Eeachlink-H6-Mini.patch
PATCHFILES += 0578-arm64-dts-allwinner-tanix-tx6-mini-enable-wifi-cpu-dvfs.patch
PATCHFILES += 0579-arm64-dts-allwinner-enable-audio-gs1.patch
PATCHFILES += 0580-arm64-dts-allwinner-tanix-tx6-enable-wifi-cpu-dvfs.patch
PATCHFILES += 0581-arm64-dts-allwinner-h6-normalize-spdif-card-name.patch
PATCHFILES += 0582-arm64-dts-allwinner-h6-add-deinterlace-node.patch
PATCHFILES += 0583-arm64-dts-allwinner-opi3-enable-ethernet.patch
PATCHFILES += 0584-arm64-dts-allwinner-opi3-fixes.patch
PATCHFILES += 0585-arm64-dts-allwinner-add-Tanix-TX6-A.patch
PATCHFILES += 0586-arm64-dts-allwinner-enable-gpu-opp-multiple-boards.patch
PATCHFILES += 0587-arm64-dts-allwinner-add-orangepi-3-lts.patch
PATCHFILES += 0588-arm64-dtsi-allwinner-rework-cpu-gpu-opp.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Allwinner H616 patches -----------------------------------------
PATCHFILES += 0600-drivers-h616-wip-add-usb-emac2-support.patch
PATCHFILES += 0601-drivers-thermal-allwinner-add-h616-ths-support.patch
PATCHFILES += 0602-media-cedrus-add-H616-variant.patch
PATCHFILES += 0603-soc-sunxi-sram-Add-SRAM-C1-H616-handling.patch
PATCHFILES += 0604-dma-sun6i-dma-add-h616-support.patch
PATCHFILES += 0610-drivers-drm-wip-add-h616-hdmi.patch
PATCHFILES += 0615-drivers-iommu-sun50i-iommu-fix-iommu-on-h616.patch
PATCHFILES += 0620-sound-soc-sunxi-add-codec-driver-for-h616.patch
PATCHFILES += 0621-sound-soc-add-sunxi_v2-for-h616-ahub.patch
PATCHFILES += 0623-sound-soc-sunxi-hack-to-fix-oops-on-cards-caps-query.patch
PATCHFILES += 0630-net-wireless-add-uwe5622-support-v20231020.patch
PATCHFILES += 0631-clk-sunxi-ng-ccu-sun6i-rtc-fix-32k-clk.patch
PATCHFILES += 0632-clk-sunxi-ng-ccu-hack-fix-too-slow-hdmi-audio.patch
# device-tree patches
PATCHFILES += 0640-arm64-dts-allwinner-h616.dtsi-add-audio-hdmi-vdec.patch
PATCHFILES += 0641-arm64-dts-allwinner-h616.dtsi-add-ths-cpu-gpu-opp-and-dvfs.patch
PATCHFILES += 0642-arm64-dts-allwinner-h616.dtsi-add-emac1.patch
PATCHFILES += 0643-arm64-dts-allwinner-h616.dtsi-fix-x96q-failing-mmc3.patch
PATCHFILES += 0644-arm64-dts-allwinner-h616-OrangePI-Zero23-enable-ths-hdmi-audio.patch
PATCHFILES += 0645-arm64-dts-allwinner-h616-add-Tanix-TX6s-TVbox.patch
PATCHFILES += 0646-arm64-dts-allwinner-h616-add-Tanix-TX6s-axp313-TVbox.patch
PATCHFILES += 0647-arm64-dts-allwinner-h313-add-x96q-TVbox.patch
PATCHFILES += 0648-arm64-dts-allwinner-h313-add-x96q-lpddr3-TVbox.patch
PATCHFILES += 0649-arm64-dts-allwinner-h618-add-vontar-h618-TVbox.patch
PATCHFILES += 0650-arm64-dts-allwinner-h618-add-opi-2w.patch
PATCHFILES += 0651-arm64-dts-allwinner-h313-Tanix-TX1-TVbox.patch
PATCHFILES += 0652-arm64-dts-allwinner-h313-add-x96q-v5.1-TVbox.patch
PATCHFILES += 0653-arm64-dts-allwinner-h616-add-pendoo-x12pro-tvbox.patch
#------------------------------------------------------------
endif

ifeq (1,1)
#-- Rockchip 33x patches -----------------------------------------
# https://github.com/Kwiboo/linux-rockchip/commits/linuxtv-rkvdec-high-10-v5
PATCHFILES += 0703-media-v4l2-common-Add-helpers-to-calculate-bytesperl.patch
PATCHFILES += 0704-media-v4l2-Add-NV15-and-NV20-pixel-formats.patch
PATCHFILES += 0705-media-rkvdec-h264-Use-bytesperline-and-buffer-height.patch
PATCHFILES += 0706-media-rkvdec-h264-Don-t-hardcode-SPS-PPS-parameters.patch
PATCHFILES += 0707-media-rkvdec-Extract-rkvdec_fill_decoded_pixfmt-into.patch
PATCHFILES += 0708-media-rkvdec-Move-rkvdec_reset_decoded_fmt-helper.patch
PATCHFILES += 0709-media-rkvdec-Extract-decoded-format-enumeration-into.patch
PATCHFILES += 0710-media-rkvdec-Add-image-format-concept.patch
PATCHFILES += 0711-media-rkvdec-Add-get_image_fmt-ops.patch
PATCHFILES += 0712-media-rkvdec-h264-Support-High-10-and-4-2-2-profiles.patch
PATCHFILES += 0714-media-rkvdec-Add-HEVC-backend.patch
PATCHFILES += 0715-media-rkvdec-Add-variants-support.patch
PATCHFILES += 0716-media-rkvdec-Implement-capability-filtering.patch
PATCHFILES += 0717-media-rkvdec-Add-RK3288-variant.patch
PATCHFILES += 0718-media-rkvdec-Disable-QoS-for-HEVC-and-VP9-on-RK3328.patch
PATCHFILES += 0722-v4l2-wip-iep-driver.patch
PATCHFILES += 0724-media-rkvdec-add-soft-reset-on-errors.patch
PATCHFILES += 0725-drm-rockchip-vop-add-immutable-zpos-property-fix-z-order.patch
PATCHFILES += 0727-drm-rockchip-vop2-rk356x-reorder-wins-fix-osd-in-drm-planes.patch
# device-tree patches
PATCHFILES += 0739-arm64-dtsi-rockchip-rk3328-rk3399-add-soft-reset.patch
PATCHFILES += 0740-arm64-dts-rockchip-var-fixes-from-libreelec.patch
PATCHFILES += 0743-arm64-dts-rockchip-beelink-a1-enable-openvfd.patch
PATCHFILES += 0746-arm64-dts-rockchip-beelink-a1-bump-cpu-gpu-freqs.patch
PATCHFILES += 0747-arm64-dts-rockchip-beelink-a1-limit-sdmmc-clk-to-35MHz.patch
PATCHFILES += 0748-arm64-dts-rockchip-beelink-a1-limit-emmc-speed-to-fix-emmc-booting.patch
PATCHFILES += 0749-phy-rockchip-phy-add-rockchip-inno-usb3.patch
PATCHFILES += 0750-arm64-dts-rockchip-rk3328-enable-inno-usb3-on-various-boards.patch
PATCHFILES += 0753-arm64-dts-rockchip-rk3399-radxa-rockpi-bc-remove-wifi-compatible.patch
PATCHFILES += 0754-arm64-dts-rockchip-rk33xx-set-userled-to-mmc.patch
PATCHFILES += 0755-arm64-dts-rockchip-rk3399-add-orangepi-4-and-4-lts.patch
PATCHFILES += 0756-arm64-dts-rockchip-rk33xx-add-eth-wifi-aliases.patch
PATCHFILES += 0757-arm64-dts-rockchip-rk3399-orangepi-4-lts-add-fan-support.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Rockchip 356x patches -----------------------------------------
PATCHFILES += 0800-Enable-rk356x-PCIe-controller.patch
PATCHFILES += 0801-net-wireless-backport-aic8800-sdio-v2024_0327_3561b08f.patch
PATCHFILES += 0802-net-wireless-mm2-fixes-aic8800-sdio-v2024_0327_3561b08f.patch
PATCHFILES += 0803-net-wireless-backport-aic8800-usb-v2024_0327_3561b08f.patch
PATCHFILES += 0804-net-wireless-mm2-fixes-aic8800-usb-v2024_0327_3561b08f.patch
# device-tree patches
PATCHFILES += 0831-arm64-dts-rockchip-enable-usb2-usb3-sata-audio-in-rk35xx.dtsi.patch
PATCHFILES += 0832-arm64-dtsi-rockchip-rk356x-disable-vepu-rga-enable-dfi.patch
PATCHFILES += 0833-arm64-dts-rockchip-enable-Quartz64-A-usb2-usb3-pcie-audio.patch
PATCHFILES += 0836-arm64-dts-rockchip-add-dts-for-x96-x6.patch
PATCHFILES += 0840-arm64-dts-rockchip-improve-dts-for-rock3b.patch
PATCHFILES += 0841-arm64-dts-rockchip-increas-alarm-cpu-temp-to-85.patch
PATCHFILES += 0842-arm64-dts-rockchip-Quartz64-B-fix-Eth-enable-hdmi-audio.patch
PATCHFILES += 0843-arm64-dts-rockchip-rock3a-fix-mdio-reset-disable-uart-bt.patch
PATCHFILES += 0845-arm64-dts-rockchip-improve-dts-for-rock3c.patch
PATCHFILES += 0846-arm64-dts-rockchip-rk35xx-set-userled-to-mmc.patch
PATCHFILES += 0847-arm64-dts-rockchip-add-dts-for-urve-pi.patch
PATCHFILES += 0848-arm64-dts-rockchip-add-dts-for-opi-3b.patch
PATCHFILES += 0849-arm64-dts-rockchip-improve-dts-for-zero3.patch
PATCHFILES += 0850-arm64-dts-rockchip-rk356x-add-eth-wifi-aliases.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- RaspberryPI patches -----------------------------------------
# Hack for adding H264 v4l2 decoding on RPI
PATCHFILES += 0900-rpi-vc04_services-add_h~l2-m2m_decode-15062024.patch
PATCHFILES += 0902-media-add-rpivid-driver.patch
PATCHFILES += 0905-drivers-add-rpi5-clk-pinctrl-mmc-pwm-net-usb-pci-rp1.patch
PATCHFILES += 0906-gpu-drm-vc4-add-rpi5-support.patch
# device-tree patches
PATCHFILES += 0950-arm64-dts-brcm-set-userled-to-mmc.patch
PATCHFILES += 0951-arm64-dts-brcm-add-rpi5-dt.patch
PATCHFILES += 0953-arm64-dts-add-rpivid-rpi4.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Rockchip 3588 patches -----------------------------------------
PATCHFILES += 1001-math.h-add-DIV_ROUND_UP_NO_OVERFLOW.patch
PATCHFILES += 1002-clk-divider-Fix-divisor-masking-on-64-bit-platforms.patch
PATCHFILES += 1003-clk-composite-replace-open-coded-abs_diff.patch
# hdmi video support
PATCHFILES += 1010-FROM-ML-phy-phy-rockchip-samsung-hdptx-Don-t-use-dt-.patch
PATCHFILES += 1011-FROM-UPSTREAM-drm-rockchip-Don-t-change-hdmi-referen.patch
PATCHFILES += 1012-FROM-UPSTREAM-drm-rockchip-vop2-Drop-unnecessary-if_.patch
PATCHFILES += 1013-FROM-UPSTREAM-drm-rockchip-vop2-Improve-display-mode.patch
PATCHFILES += 1014-WIP-drm-rockchip-vop2-Improve-display-modes-handling.patch
PATCHFILES += 1015-drm-bridge-dw-hdmi-Sync-comments-with-actual-bus-for.patch
PATCHFILES += 1016-drm-bridge-connector-Sync-supported_formats-with-com.patch
PATCHFILES += 1017-drm-connector-hdmi-Evaluate-limited-range-after-comp.patch
PATCHFILES += 1018-drm-connector-hdmi-Add-support-for-YUV420-format-ver.patch
PATCHFILES += 1019-drm-connector-hdmi-Improve-debug-message-for-support.patch
PATCHFILES += 1020-drm-connector-hdmi-Use-YUV420-output-format-as-an-RG.patch
PATCHFILES += 1021-phy-Add-HDMI-configuration-options.patch
PATCHFILES += 1022-phy-hdmi-Add-color-depth-configuration.patch
PATCHFILES += 1023-phy-rockchip-samsung-hdptx-Fix-clock-ratio-setup.patch
PATCHFILES += 1024-phy-rockchip-samsung-hdptx-Drop-unused-lcpll_config.patch
PATCHFILES += 1025-phy-rockchip-samsung-hdptx-Setup-TMDS-char-rate-via-.patch
PATCHFILES += 1026-phy-rockchip-samsung-hdptx-Add-high-color-depth-mana.patch
PATCHFILES += 1027-phy-rockchip-samsung-hdptx-Cleanup-internal-rate-han.patch
PATCHFILES += 1028-phy-rockchip-samsung-hdptx-Avoid-Hz-hHz-unit-convers.patch
PATCHFILES += 1029-TEST-phy-rockchip-samsung-hdptx-Add-verbose-logging.patch
PATCHFILES += 1030-WIP-drm-bridge-Add-detect_ctx-hook.patch
PATCHFILES += 1031-WIP-drm-bridge-connector-Switch-from-detect-to-detec.patch
PATCHFILES += 1032-WIP-drm-bridge-dw-hdmi-qp-Add-high-TMDS-clock-ratio-.patch
PATCHFILES += 1033-WIP-drm-rockchip-vop2-Add-high-color-depth-support.patch
PATCHFILES += 1034-WIP-drm-rockchip-vop2-Add-YUV420-support.patch
PATCHFILES += 1035-WIP-drm-rockchip-dw_hdmi_qp-Make-use-of-phy_configur.patch
PATCHFILES += 1036-WIP-drm-rockchip-dw_hdmi_qp-Add-10bpc-and-YUV420-out.patch
PATCHFILES += 1037-WIP-drm-bridge-dw-hdmi-qp-Enable-10bpc-and-YUV420.patch
PATCHFILES += 1038-FROM-ML-clk-check-for-disabled-clock-provider.patch
# hdmi audio support
PATCHFILES += 1040-drm-bridge-synopsys-add-audio-support-for-dw-hdmi-qp-v7.patch
# cec support
PATCHFILES += 1045-drm-bridge-synopsys-add-cec-support.patch
# samsung eDP support
PATCHFILES += 1047-drm-rockchip-rk3588-add-edp-support-v6.patch
PATCHFILES += 1048-phy-rockchip-samsung-hdptx-add-edp-mode-support-v7.patch
# designware dp support
PATCHFILES += 1049-drm-bridge-synopsys-add-dw-dptx-controller-support-library-v2.patch
PATCHFILES += 1050-drm-rockchip-add-rk3588-dptx-output-support-v2.patch
PATCHFILES += 1051-drm-rockchip-vop2-fix-copy-erro-affecting-dp1-usage.patch
PATCHFILES += 1052-phy-rockchip-usbdp-only-verify-link-voltage-when-flags-are-set.patch
PATCHFILES += 1053-phy-rockchip-usbdp-avoid-call-hpd_event_trigger-in-dp_phy_init.patch
# var additions
PATCHFILES += 1060-net-ethernet-add-yt6801-gige-pcie-controller.patch
PATCHFILES += 1061-net-ethernet-yt6801-gige-pcie-silence-debug-msgs.patch
PATCHFILES += 1062-WIP-iommu-rockchip-add-flush_iotlb_all-ops.patch
PATCHFILES += 1063-media-rockchip-add-rkvdec2-driver.patch
PATCHFILES += 1064-media-rkvdec2-add-iommu-support-v3.patch
PATCHFILES += 1065-wip-add-hevc-support.patch
PATCHFILES += 1066-wip-hevc-add-ref-frames-support.patch
# dtsi additions
PATCHFILES += 1070-arm64-dtsi-rk3588s-add-vop2-clock-resets.patch
PATCHFILES += 1071-arm64-dtsi-rockchip-3588s-add-hdmi-bridge.patch
PATCHFILES += 1072-arm64-dtsi-rockchip-3588-hdmi-add-audio-support.patch
PATCHFILES += 1073-arm64-dtsi-rockchip-add-rkvdec2-video-vecoder-on-rk3588.patch
PATCHFILES += 1074-arm64-dtsi-rkvdec2-add-iommu-support-v3.patch
PATCHFILES += 1075-arm64-dtsi-rockchip-rk356x-add-rkvdec2-video-decoder-nodes.patch
PATCHFILES += 1076-arm64-dtsi-rockchip-add-dw-dp-nodes.patch
PATCHFILES += 1077-arm64-dtsi-rockchip-add-samsung-edp-nodes.patch
# dts patches
PATCHFILES += 1080-arm64-dts-rockchip-rk3588s-rock5a-dts-improvements.patch
PATCHFILES += 1081-arm64-dts-rockchip-rk3588-rock5b-dts-improvements.patch
PATCHFILES += 1082-arm64-dts-rockchip-rk3588s-rock5c-dts-improvements.patch
PATCHFILES += 1083-arm64-dts-rockchip-rk3588-rock5itx-dts-improvements.patch
PATCHFILES += 1084-arm64-dts-rockchip-rk3588s-opi5-dts-improvements.patch
PATCHFILES += 1085-arm64-dts-rockchip-rk3588-opi5plus-dts-improvements.patch
PATCHFILES += 1086-arm64-dts-rockchip-rk3588s-add-opi5pro-dts.patch
PATCHFILES += 1087-arm64-dts-rockchip-rk3588s-add-nanopi-m6-dts.patch
PATCHFILES += 1088-arm64-dts-rockchip-rk3588s-nanopc-r6s-dts-improvements.patch
PATCHFILES += 1089-arm64-dts-rockchip-rk3588-nanopc-t6-dtsi-improvements.patch
PATCHFILES += 1090-arm64-dts-rockchip-rk3588-add-rock5t-dt.patch
#------------------------------------------------------------
endif

ifeq (1,1)
#-- Allwinner A523/T527/H728 --------------------------------
PATCHFILES += 1101-pinctrl-sunxi-refactor-pinctrl-variants-into-flags.patch
PATCHFILES += 1102-pinctrl-sunxi-increase-number-of-GPIO-bank-regulator.patch
PATCHFILES += 1103-pinctrl-sunxi-move-bank-K-register-offset.patch
PATCHFILES += 1104-pinctrl-sunxi-support-moved-power-configuration-regi.patch
PATCHFILES += 1105-pinctrl-sunxi-allow-reading-mux-values-from-DT.patch
PATCHFILES += 1106-dt-bindings-pinctrl-add-compatible-for-Allwinner-A52.patch
PATCHFILES += 1107-pinctrl-sunxi-Add-support-for-the-Allwinner-A523.patch
PATCHFILES += 1108-pinctrl-sunxi-Add-support-for-the-secondary-A523-GPI.patch
PATCHFILES += 1109-clk-sunxi-ng-mp-introduce-dual-divider-clock.patch
PATCHFILES += 1110-clk-sunxi-ng-mp-provide-wrappers-for-setting-feature.patch
PATCHFILES += 1111-clk-sunxi-ng-Add-support-for-update-bit.patch
PATCHFILES += 1112-dt-bindings-clk-sunxi-ng-document-two-Allwinner-A523.patch
PATCHFILES += 1113-clk-sunxi-ng-Add-support-for-the-A523-T527-CCU-PLLs.patch
PATCHFILES += 1114-clk-sunxi-ng-a523-Add-support-for-bus-clocks.patch
PATCHFILES += 1115-clk-sunxi-ng-a523-add-video-mod-clocks.patch
PATCHFILES += 1116-clk-sunxi-ng-a523-add-system-mod-clocks.patch
PATCHFILES += 1117-clk-sunxi-ng-a523-add-interface-mod-clocks.patch
PATCHFILES += 1118-clk-sunxi-ng-a523-add-USB-mod-clocks.patch
PATCHFILES += 1119-clk-sunxi-ng-a523-remaining-mod-clocks.patch
PATCHFILES += 1120-clk-sunxi-ng-a523-add-bus-clock-gates.patch
PATCHFILES += 1121-clk-sunxi-ng-a523-add-reset-lines.patch
PATCHFILES += 1122-clk-sunxi-ng-add-support-for-the-A523-T527-PRCM-CCU.patch
PATCHFILES += 1123-dt-bindings-mmc-sunxi-Simplify-compatible-string-lis.patch
PATCHFILES += 1124-dt-bindings-mmc-sunxi-add-compatible-strings-for-All.patch
PATCHFILES += 1125-dt-bindings-watchdog-sunxi-add-Allwinner-A523-compat.patch
PATCHFILES += 1126-watchdog-sunxi_wdt-Add-support-for-Allwinner-A523.patch
PATCHFILES += 1127-dt-bindings-irq-sun7i-nmi-document-the-Allwinner-A52.patch
PATCHFILES += 1128-irqchip-sunxi-nmi-Support-Allwinner-A523-NMI-control.patch
PATCHFILES += 1129-dt-bindings-phy-document-Allwinner-A523-USB-2.0-PHY.patch
PATCHFILES += 1131-dt-bindings-vendor-prefixes-Add-YuzukiHD-name.patch
PATCHFILES += 1132-dt-bindings-arm-sunxi-Add-new-board-names-for-A523-g.patch
PATCHFILES += 1136-dt-bindings-arm-sunxi-Add-YuzukiHD-Chameleon-board-n.patch
PATCHFILES += 1139-net-ethernet-allwinner-add-gmac200-support.patch
PATCHFILES += 1140-net-ethernet-allwinner-add-gmac-support.patch
# dt patches
PATCHFILES += 1150-arm64-dtsi-allwinner-add-initial-A523-support.patch
PATCHFILES += 1151-arm64-dtsi-allwinner-add-gmac1-in-A523-dtsi.patch
PATCHFILES += 1152-arm64-dtsi-allwinner-add-gmac0-in-A523-dtsi.patch
PATCHFILES += 1170-arm64-dts-allwinner-h728-add-x96q-pro-tvbox-plus.patch
PATCHFILES += 1172-arm64-dts-allwinner-t527-add-orangepi-4a-dts.patch
PATCHFILES += 1173-arm64-dts-allwinner-a527-add-Radxa-A5E-support.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Rockchip rk3528 -----------------------------------------
PATCHFILES += 1200-dt-bindings-add-rk3528-clock-reset-definitions.patch
PATCHFILES += 1201-clk-rockchip-add-clock-controller-for-the-RK3528.patch
PATCHFILES += 1202-pinctrl-rockchip-add-rk3528-support.patch
PATCHFILES += 1203-dt-bindings-power-add-RK3528-SoCs-header-for-idle.patch
PATCHFILES += 1204-ethernet-stmmac-dwmac-rk3528-add-GMAC-support.patch
PATCHFILES += 1205-soc-rockchip-power-domain-add-rk3528-support.patch
PATCHFILES += 1206-phy-rockchip-inno-usb2-add-phy-support-for-rk3528.patch
PATCHFILES += 1208-thermal-rockchip-add-support-for-rk3528.patch
PATCHFILES += 1209-phy-rockchip-naneng-combphy-add-support-for-rk3528.patch
PATCHFILES += 1210-phy-rockchip-inno-hdmi-add-support-for-rk3528.patch
PATCHFILES += 1211-drm-rockchip-dw_hdmi-add-support-for-rk3528.patch
PATCHFILES += 1213-nvmem-rockchip-otp-add-support-for-rk3528.patch
PATCHFILES += 1214-sound-soc-codecs-add-rk3528-support.patch
PATCHFILES += 1215-hack-hack-gpu-drm-rockchip-rockchip_vop2_reg-add-rk3528.patch
PATCHFILES += 1250-arm64-dtsi-rockchip-add-3528.dtsi.patch
PATCHFILES += 1251-arm64-dts-rockchip-add-dts-for-vontar_r3.patch
PATCHFILES += 1252-arm64-dts-rockchip-rk3528-add-dts-for-rock2a-rock2f.patch
endif
#------------------------------------------------------------

endif

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	utils/bc \
	utils/kmod \
	$(if $(filter arm arm64,$(mm_GARCH_FAMILY)),bootloaders/u-boot.tools) \

DEPENDS = \
	kernel-headers/linux-headers \
	firmware/firmware \

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

CONFIGURE_ARGS    = $(LINUX_MAKE_ARGS)
BUILD_ARGS        = $(LINUX_MAKE_ARGS)
INSTALL_ARGS      = $(LINUX_MAKE_ARGS) INSTALL_HDR_PATH="$(DESTDIR)$(LINUX_INCLUDEDIR)"

CONFIGURE_ENV = $(LINUX_MAKE_ENV)
BUILD_ENV     = $(LINUX_MAKE_ENV)
INSTALL_ENV   = $(LINUX_MAKE_ENV) INSTALL_PATH="$(DESTDIR)$(LINUX_DIR)" INSTALL_MOD_PATH="$(DESTDIR)$(rootdir)" INSTALL_DTBS_PATH="$(DESTDIR)$(rootdir)/boot/dtbs" INSTALL_HDR_PATH="$(DESTDIR)$(LINUX_INCLUDEDIR)"

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
	@$(CONFIGURE_ENV) $(MAKE) $(BUILD_ARGS) -C $(WORKSRC) zImage modules dtbs
else
ifeq ($(GARCH),armv8)
	@$(CONFIGURE_ENV) $(MAKE) $(BUILD_ARGS) -C $(WORKSRC) Image Image.gz modules dtbs
else
	@$(CONFIGURE_ENV) $(MAKE) $(BUILD_ARGS) -C $(WORKSRC) bzImage modules
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
	@echo "Installing Linux modules in [$(DESTDIR)$(LINUX_DIR)]..."
	@mkdir -p $(DESTDIR)$(LINUX_DIR)
	@# cp  $(WORKSRC)/System.map $(DESTDIR)$(LINUX_DIR)/System.map
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) modules_install
	@echo "Installing Linux headers in [$(DESTDIR)$(LINUX_INCLUDEDIR)]..."
	@mkdir -p $(DESTDIR)$(LINUX_INCLUDEDIR)
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) headers_install
ifeq ($(GARCH),armv7)
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/zImage > $(DESTDIR)$(LINUX_DIR)/zImage
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image    > $(DESTDIR)$(LINUX_DIR)/Image
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) dtbs_install
	@rm -rf $(DESTDIR)$(LINUX_DIR)/dtbs/broadcom/bcmbca*
	@rm -rf $(DESTDIR)$(LINUX_DIR)/dtbs/broadcom/northstar2*
	@rm -rf $(DESTDIR)$(LINUX_DIR)/dtbs/broadcom/stingray*
	@$(MAKECOOKIE)
else
ifeq ($(GARCH),armv8)
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image.gz > $(DESTDIR)$(LINUX_DIR)/Image.gz
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image    > $(DESTDIR)$(LINUX_DIR)/Image
	@$(build_DESTDIR)$(build_bindir)/mkimage -A arm64 -O linux -T kernel -C none -a 0x1080000 -e 0x1080000 -n linux-next -d $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image $(DESTDIR)$(LINUX_DIR)/uImage
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) dtbs_install
	@rm -rf $(DESTDIR)$(LINUX_DIR)/dtbs/broadcom/bcmbca*
	@rm -rf $(DESTDIR)$(LINUX_DIR)/dtbs/broadcom/northstar2*
	@rm -rf $(DESTDIR)$(LINUX_DIR)/dtbs/broadcom/stingray*
	@$(MAKECOOKIE)
else
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/bzImage > $(DESTDIR)$(LINUX_DIR)/vmlinuz
	@ln -srf $(DESTDIR)$(LINUX_DIR)/vmlinuz $(DESTDIR)$(LINUX_DIR)/bzImage
	@$(MAKECOOKIE)
endif
endif

install-headers:
	@$(MAKE) patch
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) headers_install
	@mkdir -p $(DESTDIR)$(includedir)
	@cp -rf $(WORKSRC)/usr/include/* $(DESTDIR)$(includedir)

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

menuconfig: configure
	@$(CONFIGURE_ENV) $(MAKE) $(CONFIGURE_ARGS) -C $(WORKSRC) menuconfig

savedefconfig: configure
	@$(CONFIGURE_ENV) $(MAKE) $(CONFIGURE_ARGS) -C $(WORKSRC) savedefconfig
	mv $(WORKSRC)/defconfig $(CONFIGFILE)

