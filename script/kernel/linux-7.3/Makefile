
ifeq (1,1)
#--Use this for SCM mainline official x.y.z kernel --------
MASTER_SITES        = https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/snapshot/
DISTFILES           = $(DISTNAME).tar.gz $(CONFIGFILE)
WORKSRC             = $(WORKDIR)/linux-$(LINUX_VERSION)
#----------------------------------------------------------
endif

ifeq (0,1)
#--Use this for SCM given commit kernel -------------------
MASTER_SITES        = https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/snapshot/
GITHASH             = 
DISTFILES           = $(GITHASH).tar.gz $(CONFIGFILE)
WORKSRC             = $(WORKDIR)/$(GITHASH)
#----------------------------------------------------------
endif

ifeq (0,1)
#--Use this for github x.y.z kernel -----------------------
MASTER_SITES       += https://github.com/torvalds/linux/archive/
DISTFILES           = v$(LINUX_VERSION).tar.gz $(CONFIGFILE)
WORKSRC             = $(WORKDIR)/linux-$(LINUX_VERSION)
#----------------------------------------------------------
endif

ifeq (0,1)
#--Use this for github given commit kernel -------------------
MASTER_SITES       += https://github.com/torvalds/linux/archive/
DISTFILES           = $(GITHASH).zip $(CONFIGFILE)
WORKSRC             = $(WORKDIR)/linux-$(GITHASH)
#----------------------------------------------------------
endif

GARNAME = linux
GARVERSION = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),$(if $(filter-out 0,$(LINUX_TEENY_VERSION)),.$(LINUX_TEENY_VERSION)))$(LINUX_EXTRA_VERSION)
CATEGORIES = kernel-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)

CONFIGFILE = linux-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)-$(GARCH_FAMILY)-$(GARCH).config

PATCHFILES  = linux-7.3.patch.gar
PATCHFILES += linux-7.3-perl.patch.gar
PATCHFILES += linux-7.3-defaults.patch

ifeq (1,1)

PATCHFILES += 0106-net-brcm80211-brcmfmac-pcie-stop-loading-txcap_blob-fw.patch
PATCHFILES += 0107-OF-add-DT-Overlay-using-configfs-interface.patch
PATCHFILES += 0108-drivers-led-add-openvfd-g6de4e217b.patch
PATCHFILES += 0109-block-add-led-showing-block-activity.patch

ifeq (1,1)
# Misc panfrost patches
PATCHFILES += 0110-drivers-net-wireless-brcmfmac-add-ap6330-firmware.patch
endif

PATCHFILES += 0111-fs-ovelays-move-xino-msg-to-debug.patch

ifeq (1,1)
# Switch GPU DVFS governors default as 'performance'
PATCHFILES += 0125-drm-lima-dvfs-switch-gov-to-performance.patch
PATCHFILES += 0126-drm-panfrost-dvfs-switch-gov-to-performance.patch
endif



# patches numbering:
# 1000-1999: amlogic
#   1000-1199: gxl/gxm .c code (drivers, etc)
#     1200-1299: dtsi
#     1300-1399: dts
#   1400-1499: g12/sm1 .c code (drivers, etc)
#     1500-1599: dtsi
#     1600-1699: dts
#   1700-1799: s4/sc2/t7 .c code (drivers, etc)
#     1800-1899: dtsi
#     1900-1999: dts

# 2000-2999: alwinner
#   2000-2199: h6 .c code (drivers, etc)
#     2200-2299: dtsi
#     2300-2399: dts
#   2400-2499: h616 .c code (drivers, etc)
#     2500-2599: dtsi
#     2600-2699: dts
#   2700-2799: a523/h733 .c code (drivers, etc)
#     2800-2899: dtsi
#     2900-2999: dts

# 3000-3999: rockchip
#   3000-3199: rk33xx .c code (drivers, etc)
#     3200-3299: dtsi
#     3300-3399: dts
#   3400-3599: rk35xx .c code (drivers, etc)
#     3600-3699: dtsi
#     3700-3799: dts

# 4000-4999: broadcomm
#   4000-4199: rpi4 .c code (drivers, etc)
#     4200-4299: dtsi
#     4300-4399: dts
#   4400-4499: rpi5 .c code (drivers, etc)
#     4500-4599: dtsi
#     4600-4699: dts

# 5000-5999: qualcomm
#   5000-5199: rpi4 .c code (drivers, etc)
#     5200-5299: dtsi
#     5300-5399: dts

ifeq (1,1)
#-- Amlogic patches -----------------------------------------
# gxl/gxm drivers additions
PATCHFILES += 1000-drm-meson-swap-primary-overlay-zpos.patch
# board dts additions
PATCHFILES += 1001-arm64-meson-add-Amlogic-Meson-GX-PM-Suspend.patch
PATCHFILES += 1300-arm64-dts-meson-gxm-add-beelink-gt1.patch
PATCHFILES += 1301-arm64-dts-meson-gxl-disable-cvbs-on-meson-gx-p23x-q20x-boards.patch
PATCHFILES += 1302-arm64-dtsi-meson-add-support-for-GX-PM-and-Virtual-rtc.patch
PATCHFILES += 1303-arm64-dtsi-meson-gx-increase-dma-pool-to-896MB.patch
PATCHFILES += 1400-media-cec-platform-meson-ao-cec-g12a-fix-debu.patch
# stateless vdec 20.09.2026 https://github.com/gusbourg/vim3-vdec-stateless
PATCHFILES += 1410-media-add-MESON_AM21C-fourcc.patch
PATCHFILES += 1411-media-amlogic-stateless-vdec-gusbourg-20092026-g4eae00d0.patch
# g12/sm1 dtsi additions
PATCHFILES += 1500-arm64-dtsi-meson-g12-increase-dma-pool-to-896MB.patch.patch
# g12/sm1 board dts additions
PATCHFILES += 1600-arm64-dts-meson-sm1-add-support-for-TX5-plus.patch
PATCHFILES += 1601-arm64-dts-meson-sm1-disable-cvbs-on-meson-sm1-ac2xx-boards.patch
PATCHFILES += 1602-arm64-dts-meson-sm1-disable-cap_highspeed-on-sdcard.patch
PATCHFILES += 1603-arm64-dts-meson-sm1-x96air-add-vfd.patch
PATCHFILES += 1604-arm64-dts-amlogic-meson-sm1-khadas-vim3l-dec-sd-clk-add-improvements.patch
# s4/sc2 drivers additions
PATCHFILES += 1700-soc-amlogic-meson-gx-socinfo-add-s905x4w2y4.patch
PATCHFILES += 1701-mmc-meson-gx-Add-support-for-Meson-S4.patch
PATCHFILES += 1702-reset-reset-meson-add-support-for-Amlogic-SC2.patch
PATCHFILES += 1703-irqchip-meson-gpio-Add-support-for-meson-SC2-.patch
PATCHFILES += 1704-dt-bindings-clock-meson-Add-audio-power-domain-for-S4-soc-v6.patch
PATCHFILES += 1705-dt-bindings-Asoc-axg-audio-Add-S4-audio-tocodec-v6.patch
PATCHFILES += 1706-ASoC-meson-g12a-toacodec-Add-S4-tocodec-driver-v6.patch
PATCHFILES += 1707-clk-meson-axg_audio-add-S4-support-v6.patch
PATCHFILES += 1708-ASoC-meson-add-s4-tohdmitx-control.patch
PATCHFILES += 1709-soc-amlogic-meson-clk-measure-Add-support-for.patch
PATCHFILES += 1710-drm-meson-add-s4-drm-driver.patch
PATCHFILES += 1711-phy-amlogic-meson-g12a-usb2-add-support-for-M.patch
PATCHFILES += 1712-net-wireless-broadcom-add-sdio-ID-43342.patch
PATCHFILES += 1713-gpu-panfrost-add-meson-s4-support.patch
PATCHFILES += 1714-thermal-amlogic-add-meson-s4-variant.patch
# v8 https://patchwork.linuxtv.org/project/linux-media/list/?series=29680
PATCHFILES += 1715-firmware-meson-sm-Add-video-firmware-loading-SMC-call-v8.patch
PATCHFILES += 1716-firmware-meson-sm-video-firmware-loading-via-secure-monitor-v8.patch
PATCHFILES += 1717-media-dt-bindings-Add-Amlogic-V4L2-video-decoder-v8.patch
PATCHFILES += 1718-decoder-Add-V4L2-stateless-H.264-decoder-driver-v8.patch
# s4/sc2 dtsi additions
PATCHFILES += 1800-arm64-dtsi-meson-s4-Add-USB2-support.patch
PATCHFILES += 1801-arm64-dtsi-amlogic-Add-Amlogic-S4-Audio-v6.patch
PATCHFILES += 1802-arm64-dtsi-amlogic-add-Amlogic-S4-hdmi-audio.patch
PATCHFILES += 1803-arm64-dtsi-amlogic-s4-add-drm-support-v2.patch
PATCHFILES += 1804-arm64-dtsi-amlogic-s4-add-gpu-support.patch
PATCHFILES += 1805-arm64-dtsi-amlogic-sc2-add-initial-dtsi.patch
PATCHFILES += 1806-arm64-dtsi-amlogic-s4-add-cpu_temp_sensor-support.patch
PATCHFILES += 1807-arm64-dts-amlogic-Add-video-decoder-driver-support-for-S4-SOCs-v7.patch
PATCHFILES += 1809-arm64-dtsi-amlogic-s4-hack-stop-thermal-shutdowns.patch
PATCHFILES += 1810-arm64-dtsi-amlogic-s4-add-cpu-dvfs.patch
# not works. for future work PATCHFILES += 1811-arm64-dtsi-amlogic-s4-wip-add-cec.patch
# s4/sc2 board dts additions
PATCHFILES += 1900-arm64-dts-amlogic-meson-s4-s805x2-aq222-add-audio.patch
PATCHFILES += 1901-arm64-dts-amlogic-meson-s4-s805x2-aq222-add-drm.patch
PATCHFILES += 1902-arm64-dts-amlogic-meson-s4-add-AP201-Ref-Board.patch
PATCHFILES += 1903-arm64-dts-amlogic-meson-sc2-add-s905x4-ah212-board.patch
PATCHFILES += 1904-arm64-dts-amlogic-meson-s4-add-khadas-vim1s-board.patch
PATCHFILES += 1905-arm64-dts-amlogic-meson-s4-s805x2-aq222-add-WIP-cpu-dfvs.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Allwinner H6 patches -----------------------------------------
# h6 drivers additions
PATCHFILES += 2000-rtc-sun6i-Allow-RTC-wakeup-after-shutdown.patch
PATCHFILES += 2001-firmware-arm_scpi-Support-unidirectional-mailbox-cha.patch
PATCHFILES += 2002-drv-clk-gate-add-regmap-gate-support.patch
PATCHFILES += 2003-drv-mfd-ac200-add-support.patch
PATCHFILES += 2004-drv-mfd-ac200-add-ephy-syscon.patch
PATCHFILES += 2005-drivers-h616-wip-add-usb-emac2-support.patch
PATCHFILES += 2008-pwm-Add-Allwinner-s-D1-T113-S3-R329-SoCs-PWM-support.patch
PATCHFILES += 2009-pwm-sun20i-modify-for-h616-support.patch
PATCHFILES += 2010-pwm-sun20i-Add-support-for-bypass.patch
PATCHFILES += 2011-net-wireless-add-xr819-support-07072021.patch
# drm 
PATCHFILES += 2014-clk-sunxi-ng-de2-Fix-Display-Engine-3.3-definitions.patch
PATCHFILES += 2015-clk-sunxi-ng-de2-Export-register-regmap-for-DE33.patch
PATCHFILES += 2016-drm-sun4i-Add-support-for-DE33-CSC.patch
PATCHFILES += 2017-drm-sun4i-vi_layer-Limit-formats-for-DE33.patch
PATCHFILES += 2018-drm-sun4i-Add-planes-driver.patch
PATCHFILES += 2019-drm-sun4i-switch-DE33-to-new-bindings.patch
# other fixes
PATCHFILES += 2025-asoc-sun4i-i2s-WiP-multi-channel.patch
PATCHFILES += 2030-drm-dw-hdmi-cec-sleep-100ms-on-error.patch
PATCHFILES += 2031-mmc-sunxi-fix-unusuable-eMMC-on-some-H6-boards-by-di.patch
PATCHFILES += 2032-bluetooth-btrtl-add-hci-ver-rtl8822cs.patch
PATCHFILES += 2033-h6-add-sun50i-di-deinterlace-WiP.patch
PATCHFILES += 2034-Revert-drm-sun4i-dw-hdmi-Fix-ddc-en-GPIO-consumer-co.patch
# cedrus vc-1 support
PATCHFILES += 2049-iommu-sun50i-Allow-page-sizes-multiple-of-4096.patch
PATCHFILES += 2050-media-cedrus-Don-t-CPU-map-source-buffers.patch
PATCHFILES += 2051-media-Add-VC-1-parsed-slice.patch
PATCHFILES += 2052-media-cedrus-Add-VC-1-decoding-support.patch
PATCHFILES += 2053-media-cedrus-vc1-program-EPHS-before-consuming-the-b.patch
PATCHFILES += 2054-media-cedrus-vc1-fix-the-MVMODE-hardware-code-mappin.patch
PATCHFILES += 2055-media-cedrus-vc1-Handle-skipped-pictures-without-the.patch
PATCHFILES += 2056-media-cedrus-vc1-Advertise-whole-source-buffer-to-th.patch
PATCHFILES += 2057-media-cedrus-vc1-Skip-the-picture-header-24-bits-at-.patch
PATCHFILES += 2058-media-cedrus-vc1-Fix-interlaced-field-IC-backup-luma.patch
PATCHFILES += 2059-media-cedrus-vc1-increase-MV-buffer-size-to-112KB.patch
PATCHFILES += 2060-media-cedrus-vc1-single-contiguous-aux-buffer-alloca.patch
PATCHFILES += 2061-media-cedrus-vc1-BITS_LEN-from-slice-bit_size-raw_co.patch
PATCHFILES += 2062-media-cedrus-vc1-INTENCOMP-I-frame-self-ref-ts-0-fix.patch
PATCHFILES += 2063-media-cedrus-vc1-reject-Main-profile-intensity-compe.patch
PATCHFILES += 2064-media-cedrus-vc1-fix-field-intensity-compensation-sl.patch
# h6 dtsi additions
PATCHFILES += 2300-arm64-dtsi-allwinner-h6-Protect-SCP-clock.patch
PATCHFILES += 2301-arm64-dtsi-allwinner-h6-Add-SCPI-protocol.patch
PATCHFILES += 2302-arm64-dtsi-allwinner-h6-dtsi-add-sound-node.patch
PATCHFILES += 2303-arm64-dtsi-allwinner-sun50i-h6-Add-missing-SRAM-regio.patch
PATCHFILES += 2304-arm64-dtsi-allwinner-sun50i-h6-Add-missing-IOMMU-for-.patch
PATCHFILES += 2304-arm64-dtsi-allwinner-h6-add-ac200-nodes.patch
# h6 board dts additions
PATCHFILES += 2305-arm64-dts-allwinner-gs1-fixes.patch
PATCHFILES += 2306-arm64-dts-allwinner-tanix-tx6-additions.patch
PATCHFILES += 2307-arm64-dts-allwinner-add-Eeachlink-H6-Mini.patch
PATCHFILES += 2308-arm64-dts-allwinner-opi3-fixes.patch
PATCHFILES += 2309-arm64-dts-allwinner-h6-add-deinterlace-node.patch
PATCHFILES += 2310-arm64-dts-allwinner-add-orangepi-3-lts.patch
# h616 drivers additions
PATCHFILES += 2401-drivers-thermal-allwinner-add-h616-ths-support.patch
PATCHFILES += 2403-soc-sunxi-sram-Add-SRAM-C1-H616-handling.patch
# drm
PATCHFILES += 2405-drm-sun4i-Add-support-for-H616-TCON-TOP.patch
PATCHFILES += 2406-drm-sun4i-tcon-Add-support-for-R40-LCD.patch
PATCHFILES += 2407-drm-sun4i-Add-H616-TCON-TV-support.patch
PATCHFILES += 2408-drm-sun4i-Add-support-for-H616-HDMI-PHY.patch
PATCHFILES += 2409-drm-sun4i-Add-compatible-for-H616-display-engine.patch
# audio
PATCHFILES += 2410-sound-soc-sunxi-add-codec-driver-for-h616.patch
PATCHFILES += 2411-sound-soc-add-sunxi_v2-for-h616-ahub.patch
PATCHFILES += 2412-sound-soc-sunxi-hack-to-fix-oops-on-cards-caps-query.patch
# other fixes
PATCHFILES += 2413-net-wireless-add-uwe5622-support-v20231020.patch
PATCHFILES += 2414-clk-sunxi-ng-ccu-sun6i-rtc-fix-32k-clk.patch
PATCHFILES += 2415-clk-sunxi-ng-ccu-hack-fix-too-slow-hdmi-audio.patch
PATCHFILES += 2416-regulator-add-mmc-high-speed-SD-UHS-modes-support.patch
PATCHFILES += 2418-drv-rtc-sun6i-add-support-rtc-without-external-losc.patch
PATCHFILES += 2419-mmc-pwrseq_simple-fix-add-support-for-one-reset-control.patch
# h616 cedrus improvements (vp9 ,etc)
PATCHFILES += 2429-drivers-staging-media-sunxi-cedrus-add-H616-variant.patch
PATCHFILES += 2431-iommu-sun50i-support-DRAM-above-the-32-bit-boundary.patch
PATCHFILES += 2433-media-cedrus-Add-VP9-decoding-support.patch
PATCHFILES += 2434-media-cedrus-Add-P010-capture-format-and-shared-10-b.patch
PATCHFILES += 2435-media-cedrus-Add-VP9-P010-output-support.patch
PATCHFILES += 2436-media-cedrus-Add-H265-P010-output-support.patch
PATCHFILES += 2437-media-cedrus-Name-H616-VP9-mode-register-bits.patch
PATCHFILES += 2438-media-Add-NV12-and-P010-AFBC-compressed-formats.patch
PATCHFILES += 2439-media-cedrus-add-format-filtering-based-on-depth-and.patch
PATCHFILES += 2440-media-cedrus-Filter-P010-by-depth-like-AFBC-formats.patch
PATCHFILES += 2441-media-cedrus-Implement-AFBC-YUV420-output-for-VP9.patch
# h616 dtsi additions
PATCHFILES += 2500-arm64-dtsi-allwinner-h616-Add-display-pipeline.patch
PATCHFILES += 2501-arm64-dtsi-allwinner-h616-Add-hdmi-audio.patch
PATCHFILES += 2502-arm64-dtsi-allwinner-h616.dtsi-add-emac1.patch
PATCHFILES += 2503-arm64-dtsi-allwinner-h616.dtsi-add-cpu-gpu-dvfs-opp.patch
PATCHFILES += 2505-arm64-dtsi-allwinner-h616.dtsi-fix-x96q-failing-mmc3.patch
PATCHFILES += 2506-arm64-dtsi-allwinner-h616.dtsi-enable-highspeedx-on-mmc0.patch
PATCHFILES += 2507-arm64-dtsi-allwinner-h616-add-PWM-nodes.patch
PATCHFILES += 2508-arm64-dtsi-allwinner-h616.dtsi-add-i2c-uart-pinctrl.patch
PATCHFILES += 2509-arm64-dtsi-allwinner-h616-add-ac300-network.dtsi.patch
PATCHFILES += 2512-arm64-dtsi-allwinner-h616-add-video-engine.patch
# h616 board dts additions
PATCHFILES += 2600-arm64-dts-allwinner-h616-opi-zero23-improvements.patch
PATCHFILES += 2601-arm64-dts-allwinner-h616-add-Tanix-TX6s-TVbox.patch
PATCHFILES += 2602-arm64-dts-allwinner-h616-add-Tanix-TX6s-axp313-TVbox.patch
PATCHFILES += 2603-arm64-dts-allwinner-h313-add-x96q-TVbox.patch
PATCHFILES += 2604-arm64-dts-allwinner-h313-add-x96q-lpddr3-TVbox.patch
PATCHFILES += 2605-arm64-dts-allwinner-h618-add-vontar-h618-TVbox.patch
PATCHFILES += 2606-arm64-dts-allwinner-h618-improve-opi-2w.patch
PATCHFILES += 2607-arm64-dts-allwinner-h313-improve-tanix-tx1.patch
PATCHFILES += 2608-arm64-dts-allwinner-h313-add-x96q-v5.1-TVbox.patch
PATCHFILES += 2609-arm64-dts-allwinner-h616-add-pendoo-x12pro-tvbox.patch
PATCHFILES += 2610-arm64-dts-allwinner-h618-improve-transpeed-8k618-tvbox.patch
PATCHFILES += 2611-arm64-dts-allwinner-h313-h616-h618-add-cpu-overclock-via-overlays.patch
PATCHFILES += 2612-arm64-dts-allwinner-h313-h616-h618-add-gpu-overclock-via-overlays.patch
# a523 drivers additions
PATCHFILES += 2700-axp20x-HACK-mfd-and-multiple-axp-on-the-bus.patch
PATCHFILES += 2701-regulator-axp20x-force-polyphase-setup-for-axp323.patch
PATCHFILES += 2702-thermal-drivers-sun8i-add-initial-support-for-ths-v2.patch
PATCHFILES += 2703-add-initial-cpufreq-support.patch
PATCHFILES += 2704-net-drivers-stmmac-add-25M-phy-clock-support.patch
PATCHFILES += 2705-clk-sunxi-ng-ccu-sun55i-make-mmc-high-speed-working.patch
PATCHFILES += 2706-pinctrl-sunxi-A523-fix-voltage-withstand-encoding.patch
# hdmi
ifeq (0,1)
# to do update to 7.3 kernel
PATCHFILES += 2720-drm-sun4i-planes-Add-A523-plane-driver-compatible.patch
PATCHFILES += 2721-drm-sun4i-mixer-Add-A523-mixer-compatible.patch
PATCHFILES += 2722-drm-sun4i-tcon-top-Add-A523-TCON-TOP-support.patch
PATCHFILES += 2723-drm-sun4i-tcon-Add-A523-TCON-LCD-and-TV-compatibles.patch
PATCHFILES += 2724-drm-sun4i-Add-A523-HDMI-PHY-driver.patch
PATCHFILES += 2725-drm-sun4i-Add-A523-dw-hdmi-compatible.patch
PATCHFILES += 2726-drm-sun4i-Add-compatible-for-A523-display-engine.patch
endif
# a523 dtsi additions
PATCHFILES += 2800-arm64-dtsi-allwinner-add-gmac1-fixup-gmac0-in-a523.patch
PATCHFILES += 2801-arm64-dtsi-allwinner-add-ths-support-v2.patch
PATCHFILES += 2802-arm64-dtsi-allwinner-add-cpufreq-support.patch
PATCHFILES += 2803-arm64-dtsi-allwinner-a523-Add-display-pipeline.patch
# a523 board dts additions
# todo PATCHFILES += 2900-arm64-dts-allwinner-h728-x96q-pro-plus-improvements.patch
PATCHFILES += 2901-arm64-dts-allwinner-t527-orangepi-4a-dts-improvements.patch
PATCHFILES += 2902-arm64-dts-allwinner-a527-Radxa-A5E-improvements.patch
# PATCHFILES += 2903-arm64-dts-allwinner-a527-Enable-HDMI-on-Radxa-Cubie-.patch
#------------------------------------------------------------
endif

ifeq (1,1)
#-- Rockchip 33x patches -----------------------------------------
# rk33xx drivers additions
PATCHFILES += 3000-v4l2-wip-iep-driver.patch
PATCHFILES += 3001-drm-rockchip-vop-add-immutable-zpos-property-fix-z-order.patch
PATCHFILES += 3002-drm-rockchip-vop2-rk356x-reorder-wins-fix-osd-in-drm-planes.patch
PATCHFILES += 3003-phy-rockchip-phy-add-rockchip-inno-usb3.patch
# drm: bridge: dw_hdmi: Misc enable/disable, CEC and EDID cleanup
# https://patchwork.kernel.org/project/linux-rockchip/list/?series=1077110
PATCHFILES += 3010-drm-bridge-dw_hdmi-Disable-scrambler-feature-when-not-supported.patch
PATCHFILES += 3011-drm-bridge-dw_hdmi-Only-notify-connected-status-on-HPD-interrupt.patch
PATCHFILES += 3012-drm-bridge-dw_hdmi-Call-poweron-poweroff-from-atomic-enable-disable.patch
PATCHFILES += 3013-drm-bridge-dw_hdmi-Use-passed-mode-instead-of-stored-previous_mode.patch
PATCHFILES += 3014-drm-bridge-dw_hdmi-Fold-poweron-and-setup-functions.patch
PATCHFILES += 3015-drm-bridge-dw_hdmi-Remove-previous_mode-and-mode_set.patch
PATCHFILES += 3016-drm-bridge-dw_hdmi-Invalidate-CEC-phys-addr-from-connector-detect.patch
PATCHFILES += 3017-drm-bridge-dw_hdmi-Remove-cec_notifier_mutex.patch
PATCHFILES += 3018-drm-bridge-dw_hdmi-Use-delayed_work-to-debounce-hotplug-event.patch
PATCHFILES += 3019-drm-bridge-dw_hdmi-Use-drm_connector_helper_hpd_irq_event.patch
PATCHFILES += 3020-drm-bridge-dw_hdmi-Extract-dw_hdmi_connector_status_update.patch
PATCHFILES += 3021-drm-bridge-dw_hdmi-Use-dw_hdmi_connector_status_update.patch
# rk33xx dtsi additions
PATCHFILES += 3200-arm64-dtsi-rockchip-rk3328-enable-dwc3simple-for-usb-boot.patch
PATCHFILES += 3201-arm64-dtsi-rockchip-rk3399-enable-dwc3simple-for-usb-boot.patch
PATCHFILES += 3202-arm64-dtsi-rockchip-rk3399-rise-alert-crit-cpu-temps.patch
PATCHFILES += 3203-arm64-dtsi-rockchip-rk3328-rk3399-add-soft-reset.patch
PATCHFILES += 3204-phy-rockchip-phy-add-rockchip-inno-usb3.patch
# rk33xx board dts additions
PATCHFILES += 3300-arm64-dts-rockchip-var-fixes-from-libreelec.patch
PATCHFILES += 3301-arm64-dts-rockchip-beelink-a1-enable-openvfd.patch
PATCHFILES += 3302-arm64-dts-rockchip-beelink-a1-bump-cpu-gpu-freqs.patch
PATCHFILES += 3303-arm64-dts-rockchip-beelink-a1-limit-sdmmc-clk-to-35MHz.patch
PATCHFILES += 3304-arm64-dts-rockchip-beelink-a1-limit-emmc-speed-to-fix-emmc-booting.patch
PATCHFILES += 3305-arm64-dts-rockchip-rk3328-enable-inno-usb3-on-various-boards.patch
PATCHFILES += 3306-arm64-dts-rockchip-rk3399-radxa-rockpi-bc-remove-wifi-compatible.patch
PATCHFILES += 3307-arm64-dts-rockchip-rk33xx-set-userled-to-mmc.patch
PATCHFILES += 3308-arm64-dts-rockchip-rk3399-add-orangepi-4-and-4-lts.patch
PATCHFILES += 3309-arm64-dts-rockchip-rk33xx-add-eth-wifi-aliases.patch
PATCHFILES += 3310-arm64-dts-rockchip-rk3399-orangepi-4-lts-add-fan-support.patch
PATCHFILES += 3311-arm64-dts-rockchip-rk3328-rk3566-add-cpu-gpu-overclock-overlays.patch
#-- Rockchip 35x patches -----------------------------------------
# rk35xx drivers additions
PATCHFILES += 3400-Enable-rk356x-PCIe-controller.patch
PATCHFILES += 3401-net-wireless-backport-aic8800-sdio-v2026_0123_5f7be68d-mm2.patch
PATCHFILES += 3402-net-wireless-backport-aic8800-usb-v2026_0123_5f7be68d-mm2.patch
PATCHFILES += 3403-math.h-add-DIV_ROUND_UP_NO_OVERFLOW.patch
PATCHFILES += 3404-clk-divider-Fix-divisor-masking-on-64-bit-platforms.patch
PATCHFILES += 3405-clk-composite-replace-open-coded-abs_diff.patch
PATCHFILES += 3406-mfd-rk8xx-Fix-shutdown-handler.patch
PATCHFILES += 3407-net-ethernet-add-yt6801-gige-pcie-controller.patch
PATCHFILES += 3408-net-phy-realtek-Reset-after-clock-enable.patch
PATCHFILES += 3409-net-phy-realtek-re-init-after-reset.patch
# drm enhacements from collabora rockchip-devel tree 14.09.2026
# phy
PATCHFILES += 3420-phy-rockchip-inno-usb2-add-soft-vbusvalid-control.patch
PATCHFILES += 3422-phy-rockchip-usbdp-Update-mode_change-after-error-ha.patch
PATCHFILES += 3423-phy-rockchip-usbdp-Do-not-lose-USB3-PHY-status.patch
PATCHFILES += 3424-phy-rockchip-usbdp-Fix-devm_clk_bulk_get_all-check.patch
PATCHFILES += 3425-phy-rockchip-usbdp-Handle-missing-clock-names-DT-pro.patch
PATCHFILES += 3426-phy-rockchip-usbdp-Drop-seamless-DP-takeover.patch
PATCHFILES += 3427-phy-rockchip-usbdp-Keep-clocks-running-on-PHY-re-ini.patch
PATCHFILES += 3428-phy-rockchip-usbdp-Amend-SSC-modulation-deviation.patch
PATCHFILES += 3429-phy-rockchip-usbdp-Fix-LFPS-detect-threshold-control.patch
PATCHFILES += 3430-phy-rockchip-usbdp-Add-missing-mode_change-update.patch
PATCHFILES += 3431-phy-rockchip-usbdp-Support-single-lane-DP.patch
PATCHFILES += 3432-phy-rockchip-usbdp-Limit-DP-lane-count-to-muxed-lane.patch
PATCHFILES += 3433-phy-rockchip-usbdp-Rename-DP-lane-functions.patch
PATCHFILES += 3434-phy-rockchip-usbdp-Use-FIELD_PREP_WM16_CONST.patch
PATCHFILES += 3435-phy-rockchip-usbdp-Cleanup-DP-lane-selection-functio.patch
PATCHFILES += 3436-phy-rockchip-usbdp-Register-DP-aux-bridge.patch
PATCHFILES += 3437-phy-rockchip-usbdp-Drop-DP-HPD-handling.patch
PATCHFILES += 3438-phy-rockchip-usbdp-Rename-mode_change-to-phy_needs_r.patch
PATCHFILES += 3439-phy-rockchip-usbdp-Re-init-the-PHY-on-orientation-ch.patch
PATCHFILES += 3440-phy-rockchip-usbdp-Factor-out-lane_mux_sel-setup.patch
PATCHFILES += 3441-phy-rockchip-usbdp-Properly-handle-TYPEC_STATE_SAFE-.patch
PATCHFILES += 3442-phy-rockchip-usbdp-Use-guard-functions-for-mutex.patch
PATCHFILES += 3443-phy-rockchip-usbdp-Hold-mutex-in-DP-PHY-configure.patch
PATCHFILES += 3444-phy-rockchip-usbdp-Add-some-extra-debug-messages.patch
PATCHFILES += 3445-phy-rockchip-usbdp-Avoid-xHCI-SErrors.patch
PATCHFILES += 3446-phy-rockchip-usbdp-Handle-rk_udphy_reset_deassert-er.patch
PATCHFILES += 3447-phy-rockchip-usbdp-Only-enable-USB3-when-not-in-high.patch
PATCHFILES += 3448-phy-core-add-notifier-infrastructure.patch
PATCHFILES += 3449-phy-rockchip-usbdp-Add-phy-reset-notification-suppor.patch
PATCHFILES += 3450-phy-rockchip-usbdp-Drop-EPROBE_DEFER-hack.patch
PATCHFILES += 3451-phy-rockchip-usbdp-Rename-mode-to-hw_mode.patch
PATCHFILES += 3452-phy-rockchip-usbdp-Fix-power-state-handling.patch
PATCHFILES += 3453-phy-rockchip-usbdp-Re-init-PHY-on-mux-change.patch
PATCHFILES += 3454-phy-rockchip-usbdp-Add-USB-C-state-without-DP-enable.patch
# drm
PATCHFILES += 3460-MERGED-drm-bridge-synopsys-dw-dp-Remove-redundant-de.patch
PATCHFILES += 3461-MERGED-drm-scdc-helper-Don-t-use-ssize_t-return-type.patch
PATCHFILES += 3462-MERGED-drm-scdc-helper-Add-scdc_status-debugfs-entry.patch
PATCHFILES += 3463-MERGED-drm-scdc-helper-Implement-parsing-and-printin.patch
PATCHFILES += 3464-MERGED-drm-debugfs-Move-HDMI-debugfs-registration-to.patch
PATCHFILES += 3465-MERGED-drm-display-hdmi-state-helper-Init-SCDC-debug.patch
PATCHFILES += 3466-MERGED-drm-bridge-dw-hdmi-qp-use-drm_hdmi_acr_get_n_.patch
PATCHFILES += 3467-drm-rockchip-vop2-Add-clock-rate-mode-check.patch
PATCHFILES += 3468-drm-bridge-synopsys-dw-dp-Register-DP-AUX-on-bridge-.patch
PATCHFILES += 3469-drm-bridge-synopsys-dw-dp-Fix-incorrect-resource-lif.patch
PATCHFILES += 3470-drm-bridge-synopsys-dw-dp-Fix-error-handling-for-DP-.patch
PATCHFILES += 3471-drm-bridge-synopsys-dw-dp-Document-missing-reset-lin.patch
PATCHFILES += 3472-drm-bridge-synopsys-dw-dp-Add-missing-mutex-cleanups.patch
PATCHFILES += 3473-drm-bridge-synopsys-dw-dp-Fix-AUX-transfer-timeout-r.patch
PATCHFILES += 3474-drm-bridge-synopsys-dw-dp-Fix-support-for-short-I2C-.patch
PATCHFILES += 3475-drm-bridge-synopsys-dw-dp-Free-output_fmts-when-none.patch
PATCHFILES += 3476-drm-bridge-synopsys-dw-dp-Support-MEDIA_BUS_FMT_FIXE.patch
PATCHFILES += 3477-drm-bridge-synopsys-dw-dp-Add-follow-up-bridge-suppo.patch
PATCHFILES += 3478-drm-bridge-Add-out-of-band-HPD-notify-handler.patch
PATCHFILES += 3479-drm-bridge-synopsys-dw-dp-Support-software-triggered.patch
PATCHFILES += 3480-drm-rockchip-dw_dp-Implement-out-of-band-HPD-handlin.patch
PATCHFILES += 3481-drm-bridge-synopsys-dw-dp-Add-Runtime-PM-support.patch
PATCHFILES += 3482-drm-rockchip-dw_dp-Add-runtime-PM-support.patch
PATCHFILES += 3483-drm-rockchip-dw_dp-Add-system-PM-support.patch
PATCHFILES += 3484-drm-bridge-synopsys-dw-dp-Protect-sdp_reg_bank-from-.patch
PATCHFILES += 3485-drm-bridge-synopsys-dw-dp-Drop-useless-reservation-o.patch
PATCHFILES += 3486-drm-bridge-synopsys-dw-dp-Clear-only-enabled-SDPs-on.patch
PATCHFILES += 3487-drm-bridge-synopsys-dw-dp-Use-regmap_set_bits-in-dw_.patch
PATCHFILES += 3488-drm-bridge-synopsys-dw-dp-Add-audio-support.patch
PATCHFILES += 3489-drm-bridge-aux-hpd-bridge-Add-drm_dev_has_dp_hpd_bri.patch
PATCHFILES += 3490-drm-bridge-Implement-generic-USB-Type-C-DP-HPD-bridg.patch
PATCHFILES += 3491-drm-display-Add-soft-depend-for-aux-hpd-typec-dp-bri.patch
PATCHFILES += 3492-drm-rockchip-Select-SND_SOC_HDMI_CODEC-for-ROCKCHIP_.patch
PATCHFILES += 3493-drm-rockchip-Select-SND_SOC_HDMI_CODEC-for-ROCKCHIP_.patch
PATCHFILES += 3494-drm-connector-Cache-out-of-band-hotplug-events.patch
PATCHFILES += 3495-drm-connector-hdmi-Handle-reset-state-allocation-fai.patch
# usbdp
PATCHFILES += 3540-usb-dwc3-rockchip-introduce-glue-driver.patch
PATCHFILES += 3541-usb-dwc3-core-add-post-PHY-registration-hook-for-pla.patch
PATCHFILES += 3542-usb-dwc3-rockchip-support-PHY-reset-notifications.patch
PATCHFILES += 3543-usb-dwc3-rockchip-fix-USB-C-reconnect-in-gadget-mode.patch
PATCHFILES += 3544-usb-typec-tcpm-Also-use-SNK_WAIT_CAPABILITIES_TIMEOU.patch
PATCHFILES += 3545-usb-typec-tcpm-log-when-VDM-AMS-state-machine-is-can.patch
PATCHFILES += 3546-usb-typec-tcpm-allocate-pd_list-entries-non-device-m.patch
PATCHFILES += 3547-usb-typec-tcpm-add-device-managed-port-registration.patch
PATCHFILES += 3548-usb-typec-fusb302-Switch-to-device-managed-resources.patch
PATCHFILES += 3549-usb-typec-fusb302-rename-init_gpio-into-fusb302_init.patch
PATCHFILES += 3550-usb-typec-fusb302-move-gpio_int_n-into-function-loca.patch
PATCHFILES += 3551-usb-typec-fusb302-rework-gpio_int_n_irq-handling.patch
PATCHFILES += 3552-usb-typec-fusb302-drop-custom-gpio-interrupt-logic.patch
PATCHFILES += 3553-usb-typec-fusb302-drop-explicit-DRM-DP-HPD-bridge-su.patch
PATCHFILES += 3554-usb-typec-mux-initialize-orientation-switch-array.patch
PATCHFILES += 3555-usb-typec-mux-initialize-mux-switch-array.patch
# misc additions
PATCHFILES += 3559-media-rkvdec-fix-PM-runtime-teardown-ordering-in-remove.patch
PATCHFILES += 3560-mmc-sdhci-of-dwcmshc-Reduce-clock-reduction-print-le.patch
PATCHFILES += 3561-drm-rockchip-vop2-rk3588-reorder-wins-fix-kodi-playback-in-drm-planes.patch
PATCHFILES += 3562-drm-rockchip-set-dma-mask-to-64-bit.patch
PATCHFILES += 3565-media-rkvdec-remove-vb2_is_busy-check-in-rkvdec_s_ct.patch
PATCHFILES += 3566-media-v4l2-core-Initialize-h264-frame_mbs_only_flag-as-1.patch
PATCHFILES += 3568-mfd-khadas-mcu-add-edge2-support.patch
PATCHFILES += 3569-media-rkvdec-prime-VDPU383-deblock-warmup-rk3576.patch
# vp9 from https://github.com/beryllium-org/linux-beryllium/commits/7.1-vp9-stride/
PATCHFILES += 3570-media-rkvdec-add-VP9-VDPU381-decoder-support.patch
PATCHFILES += 3571-media-rkvdec-vp9-fix-altref-vscale-and-segmap-size-for-2K-decode.patch
PATCHFILES += 3572-media-rkvdec-vdpu381-add-VP9-profile-2-10bit-support.patch
PATCHFILES += 3573-media-rkvdec-vdpu381-vp9-use-the-real-buffer-stride.patch
# rkvdec on 356x
PATCHFILES += 3574-media-rkvdec-Add-support-for-the-VDPU346-variant.patch
# rk35xx dtsi additions
PATCHFILES += 3600-arm64-dts-rockchip-enable-usb2-usb3-sata-audio-in-rk35xx.dtsi.patch
PATCHFILES += 3601-arm64-dtsi-rockchip-rk356x-disable-vepu-rga-enable-dfi.patch
PATCHFILES += 3602-arm64-dtsi-rockchip-rk356x-enable-dwc3simple-for-usb-boot.patch
PATCHFILES += 3603-arm64-dtsi-rk3588s-add-vop2-clock-resets.patch
PATCHFILES += 3604-arm64-dtsi-rockchip-rk3588-enable-dwc3simple-for-usb-boot.patch
PATCHFILES += 3605-arm64-dtsi-rockchip-rk356x-add-rkvdec2-video-decoder-nodes.patch
PATCHFILES += 3607-arm64-dtsi-rk3588s-increas-vop-clk.patch
PATCHFILES += 3608-arm64-dtsi-rk3588-enable-dp0-dp1-audio-support.patch
PATCHFILES += 3610-arm64-dtsi-rockchip-rk3576-enable-dwc3simple-for-usb-boot.patch
PATCHFILES += 3612-arm64-dtsi-rk3576-add-DP-sound-nodes.patch
# rk3588 overlays
PATCHFILES += 3650-arm64-dts-rockchip-rk3588-add-useful-overlays.patch
# rk35xx board dts additions
PATCHFILES += 3700-arm64-dts-rockchip-enable-Quartz64-A-usb2-usb3-pcie-audio.patch
PATCHFILES += 3701-arm64-dts-rockchip-add-dts-for-x96-x6.patch
PATCHFILES += 3702-arm64-dts-rockchip-improve-dts-for-rock3b.patch
PATCHFILES += 3703-arm64-dts-rockchip-increas-alarm-cpu-temp-to-85.patch
PATCHFILES += 3704-arm64-dts-rockchip-Quartz64-B-fix-Eth-enable-hdmi-audio.patch
PATCHFILES += 3705-arm64-dts-rockchip-rock3a-fix-mdio-reset-disable-uart-bt.patch
PATCHFILES += 3706-arm64-dts-rockchip-improve-dts-for-rock3c.patch
PATCHFILES += 3707-arm64-dts-rockchip-rk35xx-set-userled-to-mmc.patch
PATCHFILES += 3708-arm64-dts-rockchip-add-dts-for-urve-pi.patch
PATCHFILES += 3709-arm64-dts-rockchip-improve-dts-for-opi-3b-v1.1.patch
PATCHFILES += 3710-arm64-dts-rockchip-improve-dts-for-zero3.patch
PATCHFILES += 3711-arm64-dts-rockchip-rk356x-add-eth-wifi-aliases.patch
PATCHFILES += 3712-arm64-dts-rockchip-rk3588s-rock5a-dts-improvements.patch
PATCHFILES += 3713-arm64-dts-rockchip-rk3588-rock5b-dts-improvements.patch
PATCHFILES += 3714-arm64-dts-rockchip-rk3588s-rock5c-dts-improvements.patch
PATCHFILES += 3715-arm64-dts-rockchip-rk3588-rock5itx-dts-improvements.patch
PATCHFILES += 3716-arm64-dts-rockchip-rk3588s-opi5-dts-improvements.patch
PATCHFILES += 3717-arm64-dts-rockchip-rk3588-opi5plus-dts-improvements.patch
PATCHFILES += 3719-arm64-dts-rockchip-rk3588s-add-nanopi-m6-dts.patch
PATCHFILES += 3720-arm64-dts-rockchip-rk3588s-nanopc-r6s-dts-improvements.patch
PATCHFILES += 3721-arm64-dts-rockchip-rk3588-nanopc-t6-dtsi-improvements.patch
PATCHFILES += 3722-arm64-dts-rockchip-rk3588-add-rock5t-dt.patch
PATCHFILES += 3723-arm64-dts-rockchip-rk3588-khadas-edge2-dts-improvements.patch
PATCHFILES += 3724-arm64-dts-rockchip-rk3588-rock5b-t-wip-typec-dp-support.patch
PATCHFILES += 3725-arm64-dts-add-nanopi-m5-dts-improvements.patch
PATCHFILES += 3726-arm64-dts-rock4d-improvements.patch
PATCHFILES += 3727-arm64-dts-rk3576-nanopi-r76s-improvements.patch
PATCHFILES += 3731-arm64-dts-rockchip-describe-PCIe-RTL8125-Ethernet-on-NanoPC-T6.patch
PATCHFILES += 3732-arm64-dts-rockchip-describe-PCIe-RTL8125-Ethernet-on-Radxa-ROCK-5b5t.patch
PATCHFILES += 3733-arm64-dts-rockchip-describe-PCIe-RTL8125-Ethernet-on-Radxa-ROCK-5-itx.patch
PATCHFILES += 3738-arm64-dts-rockchip-describe-PCIe-RTL8125-Ethernet-on-orangepi-5-plus.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Broadcom patches -----------------------------------------
# bcm2711 drivers additions
PATCHFILES += 4000-rpi-vc04_services-sync-to-downstream-04022026.patch
PATCHFILES += 4001-media-add-rpi4-v4l2m2m-decoder.patch
PATCHFILES += 4002-media-add-rpivid-driver.patch
PATCHFILES += 4003-nvmem-raspberrypi-add-nvmem-driver-for-accessing-OTP.patch
PATCHFILES += 4004-dmaengine-add-support-for-BCM2708.patch
PATCHFILES += 4005-media-ioctl-add-pixel-formats-NV12MT_COL128-and-NV12.patch
PATCHFILES += 4006-media-v4l2-add-single-planar-NV12-column-formats.patch
PATCHFILES += 4007-drm-increase-plane_mask-to-64bit.patch
PATCHFILES += 4008-char-add-vc_mem-driver-for-querying-firmware.patch
PATCHFILES += 4009-clk-bcm-changes-to-get-rpi4-v4l2m2m-working.patch
# bcm2711 dtsi additions
PATCHFILES += 4200-arm64-dts-brcm-rpi4-set-led-to-disk-activity-mmc0-alias.patch
PATCHFILES += 4201-arm64-dts-brcm-rpi4-incr-cma-to-384M.patch
PATCHFILES += 4202-arm64-dts-brcm-rpi4-add-rpivid.patch
# bcm2712 drivers additions
PATCHFILES += 4401-drivers-clk-add-rp1-support.patch
PATCHFILES += 4402-drivers-dma-add-rp1-support.patch
PATCHFILES += 4403-drivers-mfd-add-rp1-support.patch
PATCHFILES += 4405-drivers-net-add-rp1-support.patch
PATCHFILES += 4406-drivers-spi-add-rp1-support.patch
PATCHFILES += 4407-drivers-pwm-add-rp1-support.patch
PATCHFILES += 4408-drivers-hwmon-add-rp1-support.patch
PATCHFILES += 4409-drivers-thermal-add-rp1-support.patch
PATCHFILES += 4410-gpu-drm-vc4-add-rpi5-support.patch
PATCHFILES += 4411-drm-vc4-hdmi-hack-for-rpi4-rpi5-audio.patch
PATCHFILES += 4412-mailbox-Add-RP1-mailbox-support.patch
PATCHFILES += 4413-firmware-Add-an-RP1-firmware-interface-over-mbox.patch
PATCHFILES += 4414-misc-Add-RP1-PIO-driver.patch
PATCHFILES += 4415-pwm-Add-pwm-pio-rp1-driver.patch
PATCHFILES += 4416-pinctrl-Reinstate-the-downstream-pinctrl-rp1-driver.patch
# bcm2712 dtsi additions
PATCHFILES += 4500-arm64-2712dtsi-add-uart-mmc2-pins-ths-sensor.patch
PATCHFILES += 4501-arm64-2712dtsi-add-gpu-rpivid.patch
PATCHFILES += 4502-arm64-2712dtsi-add-dma32-dma40-for-audio.patch
PATCHFILES += 4503-arm64-2712dtsi-add-thermal-zones.patch
PATCHFILES += 4504-arm64-2712dtsi-incr-cma-to-384M.patch
# bcm2712 board dts additions
PATCHFILES += 4505-arm64-rpi-5-b-switch-to-downstream-dts.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Qualcomm patches -----------------------------------
# qcs6490/sc8280xp additions
# toshiba tc956x a.k.a. qps615 driver
ifeq (1,1)
PATCHFILES += 5051-net-pcs-pcs-xpcs-regmap-support-XPCS-memory-mapped-M.patch
PATCHFILES += 5052-net-pcs-pcs-xpcs-select-operating-mode-for-10G-baseR.patch
PATCHFILES += 5053-net-pcs-pcs-xpcs-Preserve-BMCR_ANENBLE-during-link-u.patch
PATCHFILES += 5054-net-stmmac-dma-create-a-separate-dma_device-pointer.patch
PATCHFILES += 5056-net-stmmac-dwxgmac2-Add-XGMAC-3.01a-support.patch
PATCHFILES += 5057-net-stmmac-dwxgmac2-export-symbols-for-XGMAC-3.01a-D.patch
PATCHFILES += 5058-dt-bindings-net-toshiba-tc965x-dwmac-add-TC956x-Ethe.patch
PATCHFILES += 5059-gpio-tc956x-add-TC956x-QPS615-support.patch
PATCHFILES += 5060-net-stmmac-tc956x-add-TC956x-QPS615-support.patch
PATCHFILES += 5061-misc-tc956x_pci-add-TC956x-QPS615-support.patch
PATCHFILES += 5062-net-stmmac-tc956x-fix-with-7.3kernel-compability.patch
endif
# clk patches
PATCHFILES += 5070-0016-clk-qcom-gcc-sc7280-Allow-PCIe_0-GDSC-to-enter-reten.patch
PATCHFILES += 5071-0017-clk-qcom-gcc-sc7280-Add-missing-GDSC-flags.patch
PATCHFILES += 5072-0018-clk-qcom-gcc-sc7280-Add-runtime-PM.patch
PATCHFILES += 5073-0050-clk-qcom-clk-rcg2-fix-clk_rcg2_calc_mnd-producing-wr.patch
PATCHFILES += 5074-0051-clk-qcom-clk-rcg2-use-64-bit-arithmetic-in-set_duty_.patch
PATCHFILES += 5075-0052-clk-qcom-clk-branch-calculate-timeout-based-on-clock.patch
PATCHFILES += 5076-0053-clk-qcom-clk-rcg2-calculate-timeout-based-on-clock-f.patch
PATCHFILES += 5077-0054-clk-qcom-clk-rcg2-fix-set_duty_cycle-integer-overflo.patch
PATCHFILES += 5078-0055-clk-qcom-gcc-sc7280-switch-GP-clocks-to-clk_rcg2_gp_.patch
# remoteproc patches
PATCHFILES += 5086-0004-remoteproc-qcom-Check-glink-edge-in-glink_subdev_sto.patch
#PATCHFILES += 5088-0276-remoteproc-qcom_q6v5_pas-attach-to-preloaded-firmwar.patch
# firmware patches
PATCHFILES += 5100-0008-dt-bindings-firmware-qcom-scm-Add-qcom-shm-bridge-vm.patch
PATCHFILES += 5101-0009-wip-firmware-qcom-tzmem-Use-self-owner-bits-when-run.patch
PATCHFILES += 5102-0027-firmware-qcom-scm-Allow-QSEECOM-for-Radxa-Dragon-Q6A.patch
PATCHFILES += 5103-0033-firmware-qcom-scm-Add-SCM-storage-interface-support.patch
PATCHFILES += 5104-0061-firmware-qcom-scm-Add-Radxa-Dragon-Q8B-to-SCM-storag.patch
PATCHFILES += 5105-0062-firmware-qcom-scm-Allow-QSEECOM-for-Radxa-Dragon-Q8B.patch
PATCHFILES += 5106-0014-soc-qcom-geni-se-Add-MODULE_FIRMWARE-macro.patch
PATCHFILES += 5107-0235-firmware-qcom-scm-Allow-QSEECOM-for-Radxa-CM-Q64.patch
# phy patches
PATCHFILES += 5115-0012-phy-qcom-qmp-ufs-Fix-HS-G4-PHY-init-table-for-sc7280.patch
# drm patches
PATCHFILES += 5121-0032-drm-msm-dp-Delay-applying-clock-defaults-until-PHY-i.patch
PATCHFILES += 5124-0066-drm-bridge-simple-add-the-Chrontel-CH7218A-DP-to-HDM.patch

ifeq (0,1)
# todo for 7.3 kernel
PATCHFILES += 5131-0087-drm-msm-dp-add-DisplayPort-CEC-Tunneling-over-AUX-su.patch
PATCHFILES += 5132-0140-drm-msm-dp-Do-not-fail-audio-prepare-when-DP-is-inac.patch
PATCHFILES += 5133-0141-fixup-drm-msm-dp-Add-DisplayPort-CEC-tunneling-over-.patch
PATCHFILES += 5134-0142-drm-msm-dp-Keep-branch-sink-count-in-sync.patch
PATCHFILES += 5135-0143-drm-msm-dpu-Reassert-core-clock-rate-on-runtime-resu.patch
PATCHFILES += 5136-0144-drm-msm-dpu-Clear-stale-DSC-resources-during-modeset.patch
PATCHFILES += 5137-0145-drm-msm-dp-Fix-parity-calculation-for-multi-byte-pay.patch
PATCHFILES += 5138-0179-drm-msm-dp-add-missing-drm_edid_connector_update-bef.patch
PATCHFILES += 5139-0232-drm-msm-dsi-enable-continuous-clock-for-SC7280-DSI-P.patch
PATCHFILES += 5141-0275-drm-msm-dpu-cap-DSPP-reservations-by-hardware-count.patch
PATCHFILES += 5142-drm-msm-dp-revert-g5043357e75b-to-fix-non-working-cec.patch
endif

# network misc patches
PATCHFILES += 5150-0069-net-phy-qca808x-add-DT-configurable-LED-preset-modes.patch
PATCHFILES += 5151-0108-net-phy-qcom-qca808x-add-Wake-on-LAN-support.patch
PATCHFILES += 5152-0119-net-stmmac-tc956x-Add-shutdown-callback-to-suspend-t.patch
PATCHFILES += 5153-0166-net-stmmac-dwmac-tc956x-Read-MAC-address-from-firmwa.patch
PATCHFILES += 5154-0038-r8169-Remove-the-check-of-a-register-to-enable-ASPM-.patch
# pci patches
PATCHFILES += 5160-0065-PCI-pwrctrl-tc9563-Make-error-teardown-safe.patch
PATCHFILES += 5161-0115-PCI-qcom-Restrict-PERST-parsing-to-PCI-bridge-nodes.patch
PATCHFILES += 5162-0120-PCI-of-Avoid-config-reads-for-disabled-bridge-nodes.patch
PATCHFILES += 5163-0123-PCI-pwrctrl-tc9563-Add-AXI-half-frequency-support.patch
PATCHFILES += 5164-0163-PCI-qcom-Override-NO_SNOOP-attribute-for-SC8280XP-pl.patch
# various drivers patches
PATCHFILES += 5170-0031-driver-core-platform-Add-option-to-skip-delay-applyi.patch
PATCHFILES += 5171-0034-mtd-devices-Add-Qualcomm-SCM-storage-driver.patch
PATCHFILES += 5172-0035-spi-geni-qcom-Implement-max_transfer_size-for-GPI-DM.patch
PATCHFILES += 5173-0057-pwm-clk-pwm-add-GPIO-and-pinctrl-support-for-constan.patch
#todo PATCHFILES += 5174-0067-review-later-drm-bridge-simple-bridge-keep-powered-d.patch
PATCHFILES += 5175-0072-ACPI-platform_profile-Make-legacy-sysfs-optional.patch
PATCHFILES += 5176-0073-platform_profile-Move-core-out-of-ACPI.patch
PATCHFILES += 5177-0075-platform-arm64-Add-Radxa-SVC-GLINK-driver.patch
PATCHFILES += 5179-0114-of-property-Create-devlink-between-PCI-Host-bridge-a.patch
PATCHFILES += 5184-0224-media-uapi-Add-MEDIA_BUS_FMT_SENSOR_DATA-media-bus-f.patch
PATCHFILES += 5185-0231-iio-adc-qcom-spmi-adc5-add-ADC7-GPIO1-GPIO4.patch
PATCHFILES += 5186-0245-usb-typec-tcpm-support-skipping-VSafe0V-check.patch
PATCHFILES += 5187-0268-ufs-qcom-add-PA_TACTIVATE-quirk-for-Kioxia-THGJFGT1E.patch
PATCHFILES += 5188-0308-HACK-disable-fake-battery-device-on-pmic-glink.patch
PATCHFILES += 5189-platform-radxa-svc-add-discoverable-sensor-hwmon-support.patch
#iris patches
PATCHFILES += 5234-0218-media-qcom-iris-Add-SC8280XP-platform-data.patch
PATCHFILES += 5243-0294-media-qcom-iris-print-firmware-SFR-message-on-system.patch
PATCHFILES += 5244-0295-media-qcom-iris-align-HEVC-decoder-internal-buffer-s.patch
PATCHFILES += 5245-0296-media-qcom-iris-allocate-partial-decode-buffer-only-.patch
# dtsi additions
PATCHFILES += 5320-arm64-dtsi-qcom-kodiak-Add-I2C-aliases-for-CCI.patch
PATCHFILES += 5321-arm64-dtsi-qcom-kodiak-Mark-secondary-USB-controller-as-wakeup-source.patch
# sc8280 dtsi additions
PATCHFILES += 5350-arm64-dtsi-qcom-sc8280xp-improvements-for-dragon-q8b.patch
PATCHFILES += 5351-arm64-dtsi-qcom-sc8280xp-reduce-cpufreqs-levels-to-get-stats-working.patch
# board dts additions
PATCHFILES += 5400-arm64-dts-qcom-qcs6490-improvements-dragon-q6a.patch
# sc8280 boards dts additions
PATCHFILES += 5450-arm64-dts-qcom-sc8280xp-add-dragon-q8b.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Allwinner A733 patches -----------------------------------
# kernal, device drivers
# clk
PATCHFILES += 6000-dt-bindings-clk-sun60i-a733-ccu-Add-allwinner-A733-s.patch
PATCHFILES += 6001-clk-sunxi-ng-sdm-Add-dual-patterns-support.patch
PATCHFILES += 6002-clk-sunxi-ng-a733-Add-PRCM-CCU.patch
PATCHFILES += 6003-clk-sunxi-ng-a733-Add-PLL-clocks-support.patch
PATCHFILES += 6004-clk-sunxi-ng-a733-Add-bus-clocks-support.patch
PATCHFILES += 6005-clk-sunxi-ng-a733-Add-mod-clocks-support.patch
PATCHFILES += 6006-clk-sunxi-ng-a733-Add-bus-clock-gates.patch
PATCHFILES += 6007-clk-sunxi-ng-a733-Add-reset-lines.patch
PATCHFILES += 6008-clk-sunxi-ng-a733-mark-the-CPUS-bus-gate-as-critical.patch
PATCHFILES += 6009-clk-sunxi-ng-a733-keep-the-MSI-Lite-bus-clocks-runni.patch
PATCHFILES += 6010-clk-sunxi-ng-a733-keep-the-USB-bus-fabric-clock-runn.patch
PATCHFILES += 6011-clk-sunxi-ng-a733-the-USB-reference-clocks-have-a-ga.patch
PATCHFILES += 6012-dt-bindings-clock-add-the-Allwinner-A733-SerDes-subs.patch
PATCHFILES += 6013-clk-sunxi-ng-add-the-Allwinner-A733-SerDes-subsystem.patch
PATCHFILES += 6014-dt-bindings-clock-sun60i-a733-serdes-ccu-add-the-PCI.patch
PATCHFILES += 6015-clk-sunxi-ng-sun60i-a733-serdes-add-the-PCIe-gate-an.patch
PATCHFILES += 6016-clk-sunxi-ng-a733-feed-the-GPU-bus-gate-from-the-GPU.patch
PATCHFILES += 6017-dt-bindings-clock-add-the-Allwinner-A733-CPU-clock-c.patch
PATCHFILES += 6018-clk-sunxi-ng-add-support-for-the-A733-CPU-clock-cont.patch
# applied by 2014 PATCHFILES += 6019-clk-sunxi-ng-de2-Fix-Display-Engine-3.3-definitions.patch
# applied by 2015 PATCHFILES += 6020-clk-sunxi-ng-de2-Export-register-regmap-for-DE33.patch
# needed for testing PATCHFILES += 6021-clk-sunxi-ng-de2-Allow-H616-writeback-routing-regist.patch
PATCHFILES += 6022-clk-sunxi-ng-a733-keep-the-display-fabric-clocks-run.patch
PATCHFILES += 6023-clk-sunxi-ng-de2-Add-A733-display-clocks.patch
PATCHFILES += 6024-clk-sunxi-ng-sun60i-a733-Keep-the-video-output-regis.patch
PATCHFILES += 6025-clk-sunxi-ng-sun60i-a733-Let-the-GPU-clock-retune-it.patch
# pinctrl
PATCHFILES += 6030-pinctrl-sunxi-rename-SUNXI_PINCTRL_NEW_REG_LAYOUT.patch
PATCHFILES += 6031-pinctrl-sunxi-only-use-PortK-special-handling-on-A52.patch
PATCHFILES += 6032-pinctrl-sunxi-refactor-IRQ-register-accessors.patch
PATCHFILES += 6033-pinctrl-sunxi-support-A733-generation-MMIO-register-.patch
PATCHFILES += 6034-pinctrl-sunxi-add-support-for-set-clear-regs.patch
PATCHFILES += 6035-pinctrl-sunxi-a523-r-add-a733-r-compatible-string.patch
PATCHFILES += 6036-pinctrl-sunxi-Add-support-for-the-Allwinner-A733.patch
PATCHFILES += 6037-pinctrl-sunxi-keep-the-new-disabled-mux-value-for-bo.patch
PATCHFILES += 6038-pinctrl-sunxi-fix-EINT-bank-indexing-for-SoCs-with-e.patch
PATCHFILES += 6039-pinctrl-sunxi-a733-fix-the-GPIO-withstand-voltage-en.patch
# dmaengine
PATCHFILES += 6045-dmaengine-sun6i-dma-Refactor-to-support-A733-interru.patch
PATCHFILES += 6046-dmaengine-sun6i-dma-Support-variable-address-widths-.patch
PATCHFILES += 6047-dmaengine-sun6i-dma-Add-num_channels_per_reg-for-fle.patch
PATCHFILES += 6048-dmaengine-sun6i-dma-Implement-support-for-Allwinner-.patch
# mfd pmic
PATCHFILES += 6055-mfd-axp20x-Constify-axp313-and-axp717-cells.patch
PATCHFILES += 6056-mfd-axp20x-i2c-Fix-i2c-instantiation.patch
PATCHFILES += 6057-mfd-axp20x-Add-support-for-AXP318W-PMIC.patch
PATCHFILES += 6058-regulator-axp20x-add-support-for-the-AXP318W.patch
# mmc
PATCHFILES += 6065-mmc-sunxi-Use-readl_poll_timeout.patch
PATCHFILES += 6066-mmc-sunxi-Name-cleared-IDMA-status-bits.patch
PATCHFILES += 6067-mmc-sunxi-Propagate-clock-phase-errors.patch
PATCHFILES += 6068-mmc-sunxi-Double-the-module-clock-for-UHS-DDR50.patch
PATCHFILES += 6069-mmc-sunxi-Add-A523-clock-phases.patch
PATCHFILES += 6070-mmc-sunxi-Add-A523-delay-chain-tuning.patch
# usb, eth
PATCHFILES += 6075-phy-sun4i-usb-request-the-PHY-resets-shared.patch
PATCHFILES += 6076-phy-allwinner-add-the-A733-SerDes-combo-PHY-driver.patch
PATCHFILES += 6080-usb-dwc3-of-simple-add-the-Allwinner-A733.patch
PATCHFILES += 6081-PCI-dwc-add-the-Allwinner-A733-host-controller-glue.patch
PATCHFILES += 6085-net-stmmac-Add-support-for-Allwinner-A733-GMAC210.patch
PATCHFILES += 6086-cpufreq-sun50i-add-support-for-the-Allwinner-A733.patch
PATCHFILES += 6087-thermal-drivers-sun8i-add-support-for-the-Allwinner-.patch
PATCHFILES += 6088-net-stmmac-dwmac-sun8i-Add-support-for-H616-EMAC1.patch
PATCHFILES += 6089-soc-sunxi-sram-Expose-the-HDMI-resistance-calibratio.patch
# iommu
# applied by 2431 PATCHFILES += 6095-iommu-sun50i-Support-DRAM-above-4-GiB.patch
PATCHFILES += 6096-iommu-sun50i-Rate-limit-page-fault-messages.patch
# dtsi
PATCHFILES += 6200-arm64-dtsi-allwinner-a733-add-initial-dtsi.patch
PATCHFILES += 6201-arm64-dtsi-allwinner-a733-add-cpu-opp-dtsi.patch
#PATCHFILES += 6205-arm64-dtsi-allwinner-a733-add-display-engine.patch
#PATCHFILES += 6206-arm64-dtsi-allwinner-a733-Add-HDMI.patch
#PATCHFILES += 6207-arm64-dtsi-allwinner-a733-Add-the-system-controller.patch
#PATCHFILES += 6208-arm64-dtsi-allwinner-a733-Clock-the-TCON-TV.patch
#PATCHFILES += 6209-arm64-dtsi-allwinner-a733-Scale-the-GPU-with-load.patch
# boards dts
PATCHFILES += 6250-arm64-dts-allwinner-add-radxa-ciube-a7a-initial-dts.patch
#PATCHFILES += 6251-arm64-dts-allwinner-a733-cubie-a7a-enable-the-displa.patch
#PATCHFILES += 6252-arm64-dts-allwinner-Enable-HDMI-on-the-Cubie-A7A.patch
#PATCHFILES += 6253-arm64-dts-allwinner-cubie-a7a-Name-the-GPU-supply.patch
PATCHFILES += 6254-arm64-dts-allwinner-cubie-a7a-Keep-EEE-off-on-the-et.patch
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
	lib/libzstd \

DEPENDS = \
	kernel-headers/linux-headers \
	firmware/firmware \

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = custom cpupower tmon
INSTALL_SCRIPTS   = custom cpupower tmon

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

build-cpupower:
	@$(CONFIGURE_ENV) $(MAKE) $(BUILD_ARGS) -C $(WORKSRC)/tools/power/cpupower
	@$(MAKECOOKIE)

install-cpupower: build-cpupower
	@$(CONFIGURE_ENV) $(MAKE) $(BUILD_ARGS) -C $(WORKSRC)/tools/power/cpupower install
	@$(MAKECOOKIE)

build-tmon:
	@$(CONFIGURE_ENV) $(MAKE) $(BUILD_ARGS) -C $(WORKSRC)/tools/thermal/tmon
	@$(MAKECOOKIE)

install-tmon: build-tmon
	@$(CONFIGURE_ENV) $(MAKE) $(BUILD_ARGS) -C $(WORKSRC)/tools/thermal/tmon install INSTALL_ROOT=$(DESTDIR)
	@$(MAKECOOKIE)

pre-install:
	@rm -f  $(DESTDIR)$(LINUX_DIR)/Image
	@rm -f  $(DESTDIR)$(LINUX_DIR)/zImage
	@rm -f  $(DESTDIR)$(LINUX_DIR)/uImage
	@rm -f  $(DESTDIR)$(LINUX_DIR)/Image.gz
	@rm -f  $(DESTDIR)$(LINUX_DIR)/System.map
	@rm -f  $(DESTDIR)$(LINUX_DIR)/vmlinuz
	@rm -rf $(DESTDIR)$(LINUX_DIR)/dtbs*
	@rm -rf $(DESTDIR)$(LINUX_MODULESPREFIX)/*
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
	@rm -rf ../.linux-$(LINUX_FULL_VERSION)
	@mkdir -p ../.linux-$(LINUX_FULL_VERSION)
	@cp -rf ../linux-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)/* ../.linux-$(LINUX_FULL_VERSION)/
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
	@cp -f ./files/$(CONFIGFILE) $(CONFIGFILE).before.menuconfig; \
	 cp -f $(WORKSRC)/.config ./files/$(CONFIGFILE); \
	 echo "edited .config saved as $(CONFIGFILE) in package/files dir ... "; \
	 cp -f $(WORKSRC)/.config $(CONFIGFILE).after.menuconfig; \
	 echo "edited .config saved as $(CONFIGFILE).after.menuconfig in package dir ... "; \
	 $(MAKE) diffconfig

defconfig: configure
	@$(CONFIGURE_ENV) $(MAKE) $(CONFIGURE_ARGS) -C $(WORKSRC) savedefconfig
	@mv $(WORKSRC)/defconfig $(CONFIGFILE).defconfig; \
	 echo "defconfig saved as $(CONFIGFILE).defconfig in package dir ... "; \
	 echo -n "Done! Press <Enter> to exit ... "; read

diffconfig: configure
	@cd $(WORKSRC); \
	 if [ -e .config.old ]; then \
	   echo "---- changes in .config by last menuconfig run BEGIN ---- "; \
	   $(PYTHON3) scripts/diffconfig .config.old .config > ../../../$(CONFIGFILE).diff; cat ../../../$(CONFIGFILE).diff; \
	   echo "---- changes in .config by last menuconfig run END ------ "; \
	 else \
	   echo -n "No old .config found to compare. Run first 'make menuconfig' or 'make mergeconfig' ... "; \
	 fi; \
	 echo -n "Done! Press <Enter> to exit ... "; read

mergeconfig: configure
	@export ARCH=$(GARCH_FAMILY); \
	 cd $(WORKSRC); \
	 if [ -e ../../../config.fragment ]; then \
	   cp -f .config config.old; scripts/kconfig/merge_config.sh .config ../../../config.fragment; \
	   cp -f .config ../../../$(CONFIGFILE).after.mergeconfig; \
	    echo "merged config saved in: tree root as .config and also as $(CONFIGFILE).after.mergeconfig in package dir ... "; \
	 else \
	   echo -n "No config.fragment found to merge. Provide it before running 'make mergeconfig' ... "; \
	 fi; \
	 echo -n "Done! Press <Enter> to exit ... "; read
