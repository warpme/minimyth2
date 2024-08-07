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

PATCHFILES  = linux-6.10.patch.gar
PATCHFILES += linux-6.10-perl.patch.gar
PATCHFILES += linux-6.10-defaults.patch

ifeq (1,1)

PATCHFILES += 0108-drivers-led-add-openvfd-g3118dda3.patch

ifeq (1,1)
# Misc panfrost patches for 6.10 kernel
# todo PATCHFILES += 0109-drm-panfrost-add-support-for-custom-soft-reset-on-GXM.patch
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
PATCHFILES += 0501-Revert-clk-qcom-Support-protected-clocks-property.patch
PATCHFILES += 0502-arm64-dts-allwinner-h6-Protect-SCP-clock.patch
PATCHFILES += 0503-rtc-sun6i-Allow-RTC-wakeup-after-shutdown.patch
PATCHFILES += 0504-firmware-arm_scpi-Support-unidirectional-mailbox-cha.patch
PATCHFILES += 0505-arm64-dts-allwinner-h6-Add-SCPI-protocol.patch
PATCHFILES += 0506-ASoC-hdmi-codec-fix-channel-allocation.patch
PATCHFILES += 0507-ASoC-sun4i-i2s-WiP-multi-channel.patch
PATCHFILES += 0508-arm64-dts-sun50i-h6-dtsi-add-sound-node.patch
PATCHFILES += 0524-arm64-dts-allwinner-h6-Fix-Cedrus-IOMMU-again.patch
PATCHFILES += 0531-iommu-sun50i-Allow-page-sizes-multiple-of-4096.patch
PATCHFILES += 0534-media-cedrus-Don-t-CPU-map-source-buffers.patch
PATCHFILES += 0535-drm-sun4i-mixer-Add-caching-support.patch
PATCHFILES += 0536-drm-sun4i-dw-hdmi-Deinit-PHY-in-fail-path.patch
PATCHFILES += 0537-drm-sun4i-dw-hdmi-Remove-double-encoder-cleanup.patch
PATCHFILES += 0538-drm-sun4i-dw-hdmi-Switch-to-bridge-functions.patch
PATCHFILES += 0539-drm-sun4i-Don-t-show-error-for-deferred-probes.patch
PATCHFILES += 0540-drm-sun4i-dw-hdmi-Make-sun8i_hdmi_phy_get-more-intui.patch
PATCHFILES += 0541-drm-sun4i-dw-hdmi-check-for-phy-device-first.patch
PATCHFILES += 0542-drm-sun4i-de2-de3-Change-CSC-argument.patch
PATCHFILES += 0543-drm-sun4i-de2-de3-Merge-CSC-functions-into-one.patch
PATCHFILES += 0544-drm-sun4i-de2-de3-call-csc-setup-also-for-UI-layer.patch
PATCHFILES += 0545-drm-bridge-dw-hdmi-add-mtmdsclock-parameter-to-phy-c.patch
PATCHFILES += 0546-drm-bridge-dw-hdmi-support-configuring-phy-for-deep-.patch
PATCHFILES += 0547-WIP-drm-sun4i-de3-Add-support-for-YUV420-output.patch
PATCHFILES += 0549-media-Add-NV12-and-P010-AFBC-compressed-formats.patch
PATCHFILES += 0550-media-cedrus-add-format-filtering-based-on-depth-and.patch
PATCHFILES += 0551-media-cedrus-Implement-AFBC-YUV420-formats-for-H265.patch
PATCHFILES += 0552-drm-sun4i-de2-Initialize-layer-fields-earlier.patch
PATCHFILES += 0553-drm-sun4i-de3-Implement-AFBC-support.patch
PATCHFILES += 0554-media-cedrus-Increase-H6-clock-rate.patch
PATCHFILES += 0556-HACK-clk-sunxi-ng-unify-parent-for-HDMI-clocks.patch
# various patches for H6
PATCHFILES += 0559-mfd-add-AC200.patch
PATCHFILES += 0560-net-phy-Add-support-for-AC200-EPHY.patch
PATCHFILES += 0561-arm64-dts-sun50i-h6.dtsi-add-ac200-nodes.patch
PATCHFILES += 0562-arm64-dts-allwinner-gs1-fix-eMMC-and-incr-vcpu-limit.patch
PATCHFILES += 0563-arm64-dts-allwinner-tanix-tx6-mini-enable-eth.patch
PATCHFILES += 0564-arm64-dts-allwinner-add-Eeachlink-H6-Mini.patch
PATCHFILES += 0565-arm64-dts-allwinner-tanix-tx6-mini-enable-wifi-cpu-dvfs.patch
PATCHFILES += 0567-arm64-dts-enable-audio-gs1.patch
PATCHFILES += 0568-arm64-dts-allwinner-tanix-tx6-enable-wifi-cpu-dvfs.patch
PATCHFILES += 0569-drm-dw-hdmi-cec-sleep-100ms-on-error.patch
PATCHFILES += 0570-arm64-dts-sun50i-h6-normalize-spdif-card-name.patch
PATCHFILES += 0573-mmc-sunxi-fix-unusuable-eMMC-on-some-H6-boards-by-di.patch
PATCHFILES += 0575-H6-add-sun50i-di-deinterlace-WiP.patch
PATCHFILES += 0576-arm64-dts-h6-add-deinterlace-node.patch
PATCHFILES += 0577-net-wireless-add-xr819-support-07072021.patch
PATCHFILES += 0579-drm-bridge-dw-hdmi-fix-4k60-modes-on-some-tv.patch
PATCHFILES += 0580-net-stmmac-sun8i-Use-devm_regulator_get-for-PHY-regu.patch
PATCHFILES += 0581-net-stmmac-sun8i-Rename-PHY-regulator-variable-to-re.patch
PATCHFILES += 0582-net-stmmac-sun8i-Add-support-for-enabling-a-regulato.patch
PATCHFILES += 0583-arm64-dts-allwinner-orange-pi-3-Enable-ethernet.patch
PATCHFILES += 0584-bluetooth-btrtl-add-hci-ver-rtl8822cs.patch
PATCHFILES += 0585-arm64-dts-allwinner-OrangePi3-fixes.patch
PATCHFILES += 0586-hantro-Add-quirk-for-NV12-NV12_4L4-capture-format.patch
PATCHFILES += 0587-arm64-dts-allwinner-add-Tanix-TX6-A.patch
PATCHFILES += 0588-arm64-dts-allwinner-enable-gpu-opp-multiple-boards.patch
PATCHFILES += 0590-arm64-dts-allwinner-add-orangepi-3-lts.patch
PATCHFILES += 0592-arm64-dtsi-allwinner-rework-cpu-gpu-opp.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Allwinner H616 patches -----------------------------------------
PATCHFILES += 0600-drivers-h616-wip-add-usb-emac2-support.patch
# add THS support
PATCHFILES += 0601-drivers-thermal-allwinner-add-h616-ths-support.patch
# add cedrus support
PATCHFILES += 0602-media-cedrus-add-H616-variant.patch
PATCHFILES += 0603-soc-sunxi-sram-Add-SRAM-C1-H616-handling.patch
# add HDMI, audio support
PATCHFILES += 0606-dma-sun6i-dma-add-h616-support.patch
PATCHFILES += 0607-drivers-drm-wip-add-h616-hdmi-jernejsk-24102023.patch
PATCHFILES += 0608-sound-soc-sunxi-add-codec-driver-for-h616.patch
PATCHFILES += 0609-sound-soc-add-sunxi_v2-for-h616-ahub.patch
PATCHFILES += 0614-clk-sunxi-ng-ccu-sun6i-rtc-fix-32k-clk.patch
PATCHFILES += 0615-drivers-iommu-sun50i-iommu-fix-iommu-on-h616.patch
PATCHFILES += 0616-net-wireless-add-uwe5622-support-v20231020.patch
PATCHFILES += 0617-sound-soc-sunxi-add-spdif-spdif.patch
PATCHFILES += 0618-sound-soc-sunxi-hack-to-fix-oops-on-cards-caps-query.patch
# device-tree patches
PATCHFILES += 0630-arm64-dts-allwinner-h616.dtsi-add-audio-hdmi-vdec.patch
PATCHFILES += 0631-arm64-dts-allwinner-h616.dtsi-add-ths-cpu-gpu-opp-and-dvfs.patch
PATCHFILES += 0632-arm64-dts-allwinner-h616.dtsi-add-emac1.patch
PATCHFILES += 0633-arm64-dts-allwinner-h616.dtsi-fix-x96q-failing-mmc3.patch
PATCHFILES += 0641-arm64-dts-allwinner-h616-OrangePI-Zero23-enable-ths-hdmi-audio.patch
PATCHFILES += 0642-arm64-dts-allwinner-h616-add-Tanix-TX6s-TVbox.patch
PATCHFILES += 0643-arm64-dts-allwinner-h616-add-Tanix-TX6s-axp313-TVbox.patch
PATCHFILES += 0644-arm64-dts-allwinner-h313-add-x96q-TVbox.patch
PATCHFILES += 0645-arm64-dts-allwinner-h313-add-x96q-lpddr3-TVbox.patch
PATCHFILES += 0647-arm64-dts-allwinner-h618-add-vontar-h618-TVbox.patch
PATCHFILES += 0648-arm64-dts-allwinner-h618-add-opi-2w.patch
PATCHFILES += 0650-arm64-dts-allwinner-h313-Tanix-TX1-TVbox.patch
PATCHFILES += 0651-arm64-dts-allwinner-h313-add-x96q-v5.1-TVbox.patch
endif
#------------------------------------------------------------

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
# https://github.com/Kwiboo/linux-rockchip/commits/linuxtv-rkvdec-hevc-v1 6.11.2023
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
PATCHFILES += 0749-phy-rockchip-phy-add-rockchip-inno-usb3.patch
PATCHFILES += 0750-arm64-dts-rockchip-enable-inno-usb3-beelinkA1-roc-cc.patch
PATCHFILES += 0753-arm64-dts-rockchip-rk3399-radxa-rockpi-bc-remove-wifi-compatible.patch
PATCHFILES += 0754-arm64-dts-rockchip-rk33xx-set-userled-to-mmc.patch
PATCHFILES += 0755-arm64-dts-rockchip-rk3399-add-orangepi-4-and-4-lts.patch
PATCHFILES += 0756-arm64-dts-rockchip-rk33xx-add-eth-wifi-aliases.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Rockchip 356x patches -----------------------------------------
PATCHFILES += 0800-Enable-rk356x-PCIe-controller.patch
PATCHFILES += 0801-net-wireless-backport-aic8800-sdio-v2024_0327_3561b08f.patch
PATCHFILES += 0802-net-wireless-mm2-fixes-aic8800-sdio-v2024_0327_3561b08f.patch
PATCHFILES += 0803-net-wireless-backport-aic8800-usb-v2024_0116_ec460377.patch
PATCHFILES += 0804-net-wireless-mm2-fixes-aic8800-usb-v2024_0116_ec460377.patch
PATCHFILES += 0805-media-rockchip-introduce-rkvdec2-driver.patch
PATCHFILES += 0806-media-rockchip-rkvdec2-add-hevc-support.patch
# device-tree patches
PATCHFILES += 0831-arm64-dts-rockchip-enable-usb2-usb3-sata-audio-in-rk35xx.dtsi.patch
PATCHFILES += 0832-arm64-dtsi-rockchip-rk356x-disable-vepu-rga-enable-dfi.patch
PATCHFILES += 0833-arm64-dts-rockchip-enable-Quartz64-A-usb2-usb3-pcie-audio.patch
PATCHFILES += 0836-arm64-dts-rockchip-add-dts-for-x96-x6.patch
PATCHFILES += 0840-arm64-dts-rockchip-add-dts-for-rock3b.patch
PATCHFILES += 0841-arm64-dts-rockchip-increas-alarm-cpu-temp-to-85.patch
PATCHFILES += 0842-arm64-dts-rockchip-Quartz64-B-fix-Eth-enable-hdmi-audio.patch
PATCHFILES += 0843-arm64-dts-rockchip-rock3a-fix-mdio-reset-disable-uart-bt.patch
PATCHFILES += 0845-arm64-dts-rockchip-add-dts-for-rock3c.patch
PATCHFILES += 0846-arm64-dts-rockchip-rk35xx-set-userled-to-mmc.patch
PATCHFILES += 0847-arm64-dts-rockchip-add-dts-for-urve-pi.patch
PATCHFILES += 0848-arm64-dts-rockchip-add-dts-for-opi-3b.patch
PATCHFILES += 0849-arm64-dts-rockchip-add-dts-for-zero3.patch
PATCHFILES += 0850-arm64-dts-rockchip-rk356x-add-eth-wifi-aliases.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- RaspberryPI patches -----------------------------------------
# Hack for adding H264 v4l2 decoding on RPI
PATCHFILES += 0900-rpi-vc04_services-add_h~l2-m2m_decode-15062024.patch
PATCHFILES += 0901-rpi-vc04_services-bcm2835-codec-remove-isp-formats.patch
PATCHFILES += 0902-media-add-rpivid-driver.patch
PATCHFILES += 0905-drivers-add-rpi5-clk-pinctrl-mmc-pwm-net-usb-pci-rp1.patch
PATCHFILES += 0906-gpu-drm-vc4-add-rpi5-support.patch
PATCHFILES += 0907-hack-dma-vc4-add-rpi5-audio-support.patch
# device-tree patches
PATCHFILES += 0950-arm64-dts-brcm-set-userled-to-mmc.patch
PATCHFILES += 0951-arm64-dts-brcm-add-rpi5-dt.patch
PATCHFILES += 0952-arm64-dts-broadcom-Add-in-DRM-pipeline-to-2712.patch
PATCHFILES += 0953-arm64-dts-add-rpivid-rpi4-rpi5.patch
PATCHFILES += 0955-arm64-dts-add-audio-support-rpi5.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Rockchip 3588 patches -----------------------------------------
PATCHFILES += 1002-irqchip-fix-its-timeout-issue.patch
PATCHFILES += 1005-crypto-rockchip-rk3688-add-crypto-support.patch
PATCHFILES += 1006-char-hw_random-add-rk3588s-support.patch
PATCHFILES += 1007-media-hantro-g1-add-video-decoder-support-v1.patch
PATCHFILES += 1011-math.h-add-DIV_ROUND_UP_NO_OVERFLOW.patch
PATCHFILES += 1012-clk-divider-Fix-divisor-masking-on-64-bit-platforms.patch
PATCHFILES += 1013-clk-composite-replace-open-coded-abs_diff.patch
PATCHFILES += 1014-clk-rockchip-rk3588-drop-unused-code.patch
PATCHFILES += 1015-clk-rockchip-handle-missing-clocks-with-EPROBE_DEFER.patch
PATCHFILES += 1016-clk-rockchip-rk3588-register-GATE_LINK-later.patch
PATCHFILES += 1017-clk-rockchip-expose-rockchip_clk_set_lookup.patch
PATCHFILES += 1018-clk-rockchip-fix-error-for-unknown-clocks.patch
PATCHFILES += 1019-clk-rockchip-implement-linked-gate-clock-support.patch
PATCHFILES += 1020-clk-rockchip-rk3588-drop-RK3588_LINKED_CLK.patch
PATCHFILES += 1021-phy-rockchip-samsung-hdptx-Add-FRL-EARC-supp.patch
PATCHFILES += 1022-phy-rockchip-samsung-hdptx-Add-clock-provide.patch
PATCHFILES += 1023-phy-rockchip-samsung-hdptx-Add-verbose-l.patch
PATCHFILES += 1024-drm-rockchip-vop2-Improve-display-modes-handling.patch
PATCHFILES += 1025-drm-bridge-dw-hdmi-Simplify-clock-handling.patch
PATCHFILES += 1026-drm-bridge-dw-hdmi-Move-common-data-to-separate-head.patch
PATCHFILES += 1027-drm-bridge-dw-hdmi-Commonize-dw_hdmi_i2c_adapter.patch
PATCHFILES += 1028-drm-bridge-dw-hdmi-Commonize-AVI-infoframe-setup.patch
PATCHFILES += 1029-drm-bridge-dw-hdmi-Commonize-vmode-setup.patch
PATCHFILES += 1030-drm-bridge-dw-hdmi-Commonize-hdmi_data_info-setup.patch
PATCHFILES += 1031-drm-bridge-dw-hdmi-Commonize-dw_hdmi_connector_creat.patch
PATCHFILES += 1032-drm-rockchip-dw_hdmi-Use-modern-drm_device-based-log.patch
PATCHFILES += 1033-drm-rockchip-dw_hdmi-Simplify-clock-handling.patch
PATCHFILES += 1034-drm-rockchip-dw_hdmi-Use-devm_regulator_get_enable.patch
PATCHFILES += 1035-drm-bridge-synopsys-Add-DW-HDMI-QP-TX-controller-dri.patch
PATCHFILES += 1036-drm-rockchip-dw_hdmi-Add-basic-RK3588-support.patch
PATCHFILES += 1037-drm-rockchip-dw_hdmi-rockchip-Simplify-hack-to-pass-pixel-clock-r.patch
PATCHFILES += 1038-drm-rochchip-dw_hdmi-rockchip-HPD-cleanup.patch
PATCHFILES += 1039-drm-vop2-add-clock-resets-support.patch
# hdmi audio support
PATCHFILES += 1040-ASoC-rockchip-add-machine-driver-for-hdmi-audio.patch
PATCHFILES += 1041-ASoC-rockchip-hdmi-support-dts-specified-daifmt.patch
PATCHFILES += 1042-ASoC-rockchip-hdmi-Fix-potential-NULL-point-referenc.patch
PATCHFILES += 1043-ASoC-rockchip-i2s-tdm-Add-support-for-Digital-Loopba.patch
PATCHFILES += 1044-ASoC-rockchip-i2s-tdm-Add-support-for-PATHx-controls.patch
PATCHFILES += 1045-drm-bridge-synopsys-add-audio-support-in-dw-hdmi-qp.patch
PATCHFILES += 1046-drm-bridge-synopsys-dw-hdmi-qp-workaround-for-hisense-tv.patch
# PATCHFILES += 1047-drm-bridge-synopsys-dw-hdmi-qp-add-cec-wip.patch
PATCHFILES += 1048-net-ethernet-add-yt6801-gige-pcie-controller.patch
PATCHFILES += 1049-net-ethernet-yt6801-gige-pcie-silence-debug-msgs.patch
# dt patches
PATCHFILES += 1070-arm64-dtsi-rk3588s-add-vop2-clock-resets.patch
PATCHFILES += 1071-arm64-dtsi-rockchip-3588s-add-cpufreq-support.patch
PATCHFILES += 1072-arm64-dtsi-rockchip-3588s-add-crypto-support.patch
PATCHFILES += 1073-arm64-dtsi-rockchip-3588s-add-hw_rng-support.patch
PATCHFILES += 1074-arm64-dtsi-rockchip-3588s-add-hdmi0-bridge.patch
PATCHFILES += 1075-arm64-dtsi-rockchip-3588s-add-rkvdec2.patch
PATCHFILES += 1076-arm64-dtsi-rockchip-3588s-add-hdmi-audio.patch
PATCHFILES += 1077-arm64-dtsi-rockchip-3588-add-hdmi1-bridge.patch
# PATCHFILES += 1078-arm64-dtsi-rockchip-3588s-enable-cec-on-hdmi0.patch
PATCHFILES += 1080-arm64-dts-rockchip-rk3588-rock5x-add-cpufreq-support.patch
PATCHFILES += 1081-arm64-dts-rockchip-rk3588-opi5x-rock5x-enable-gpu-nodes.patch
PATCHFILES += 1082-arm64-dts-rockchip-rk3588-opi5x-rock5x-make-led-mmc0-act.patch
PATCHFILES += 1083-arm64-dts-add-hdmi0-nodes-rock5x-orange5x.patch
PATCHFILES += 1084-arm64-dts-add-rock5c-dt.patch
PATCHFILES += 1085-arm64-dts-rockchip-rk3588-opi5x-add-missing-nodes.patch
PATCHFILES += 1086-arm64-dts-rockchip-rk3588-rock5ab-add-missing-nodes.patch
PATCHFILES += 1087-arm64-dts-rockchip-rock5x-opi5x-add-rkvdec2.patch
PATCHFILES += 1088-arm64-dts-add-hdmi-audio-nodes-rock5x-orange5x.patch
PATCHFILES += 1089-arm64-dts-enable-pwm-fan-rock5x-orange5x.patch
PATCHFILES += 1090-arm64-dts-rockchip-add-rock5itx-board.patch
PATCHFILES += 1091-arm64-dts-rockchip-add-opi5pro-board.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Rockchip 3528 patches -----------------------------------------
PATCHFILES += 1100-dt-bindings-clock-add-rk3528-clock-definitions.patch
PATCHFILES += 1101-clk-rockchip-add-clock-controller-for-the-RK3528.patch
PATCHFILES += 1102-pinctrl-rockchip-add-rk3528-support.patch
PATCHFILES += 1103-dt-bindings-power-add-RK3528-SoCs-header-for-idle.patch
PATCHFILES += 1104-ethernet-stmmac-dwmac-rk3528-add-GMAC-support.patch
PATCHFILES += 1105-soc-rockchip-power-domain-add-rk3528-support.patch
PATCHFILES += 1106-phy-rockchip-inno-usb2-add-phy-support-for-rk3528.patch
PATCHFILES += 1108-thermal-rockchip-add-support-for-rk3528.patch
PATCHFILES += 1109-phy-rockchip-naneng-combphy-add-support-for-rk3528.patch
PATCHFILES += 1110-phy-rockchip-inno-hdmi-add-support-for-rk3528.patch
PATCHFILES += 1111-drm-rockchip-dw_hdmi-add-support-for-rk3528.patch
PATCHFILES += 1113-nvmem-rockchip-otp-add-support-for-rk3528.patch
PATCHFILES += 1114-sound-soc-codecs-add-rk3528-support.patch
PATCHFILES += 1115-hack-hack-gpu-drm-rockchip-rockchip_vop2_reg-add-rk3528.patch
# device-tree patches
PATCHFILES += 1150-arm64-dtsi-rockchip-add-3528.dtsi.patch
PATCHFILES += 1151-arm64-dts-rockchip-add-dts-for-vontar_r3.patch
PATCHFILES += 1152-arm64-dts-rockchip-rk3528-add-dts-for-rock2a.patch
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

