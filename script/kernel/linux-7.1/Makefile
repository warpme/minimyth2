
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

PATCHFILES  = linux-7.1.patch.gar
PATCHFILES += linux-7.1-perl.patch.gar
PATCHFILES += linux-7.1-defaults.patch

ifeq (1,1)

PATCHFILES += 0001-net-brcm80211-brcmfmac-pcie-stop-loading-txcap_blob-fw.patch
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
# https://patchwork.linuxtv.org/project/linux-media/list/?series=25684 
PATCHFILES += 1715-firmware-meson-sm-Add-video-firmware-loading-SMC-call-v5.patch
PATCHFILES += 1716-firmware-meson-sm-video-firmware-loading-via-secure-monitor-v5.patch
PATCHFILES += 1717-media-dt-bindings-Add-Amlogic-V4L2-video-decoder-v5.patch
PATCHFILES += 1718-decoder-Add-V4L2-stateless-H.264-decoder-driver-v5.patch
PATCHFILES += 1720-media-aml-vdec-debug-print-first-16b-of-fw-from-amrisc.patch
# s4/sc2 dtsi additions
PATCHFILES += 1800-arm64-dtsi-meson-s4-Add-USB2-support.patch
PATCHFILES += 1801-arm64-dtsi-amlogic-Add-Amlogic-S4-Audio-v6.patch
PATCHFILES += 1802-arm64-dtsi-amlogic-add-Amlogic-S4-hdmi-audio.patch
PATCHFILES += 1803-arm64-dtsi-amlogic-s4-add-drm-support-v2.patch
PATCHFILES += 1804-arm64-dtsi-amlogic-s4-add-gpu-support.patch
PATCHFILES += 1805-arm64-dtsi-amlogic-sc2-add-initial-dtsi.patch
PATCHFILES += 1806-arm64-dtsi-amlogic-s4-add-cpu_temp_sensor-support.patch
PATCHFILES += 1807-arm64-dts-amlogic-Add-video-decoder-driver-support-for-S4-SOCs-v5.patch
PATCHFILES += 1808-arm64-dtsi-amlogic-s4-add-saradc-vrtc-uarta-mmc-clocks-fix.patch
PATCHFILES += 1809-arm64-dtsi-amlogic-s4-hack-stop-thermal-shutdowns.patch
PATCHFILES += 1810-arm64-dtsi-amlogic-s4-add-cpu-dvfs.patch
# PATCHFILES += 1811-arm64-dtsi-amlogic-s4-wip-add-cec.patch
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
PATCHFILES += 2015-net-wireless-add-xr819-support-07072021.patch
PATCHFILES += 2016-iommu-sun50i-Allow-page-sizes-multiple-of-4096.patch
PATCHFILES += 2017-drm-sun4i-Add-support-for-DE33-CSC.patch
PATCHFILES += 2018-drm-sun4i-vi_layer-Limit-formats-for-DE33.patch
PATCHFILES += 2019-clk-sunxi-ng-de2-Export-register-regmap-for-DE33.patch
PATCHFILES += 2020-drm-sun4i-Add-planes-driver.patch
PATCHFILES += 2021-drm-sun4i-switch-DE33-to-new-bindings.patch
PATCHFILES += 2024-HACK-clk-sunxi-ng-unify-parent-for-HDMI-clocks.patch
PATCHFILES += 2025-asoc-sun4i-i2s-WiP-multi-channel.patch
PATCHFILES += 2026-media-cedrus-Don-t-CPU-map-source-buffers.patch
PATCHFILES += 2027-media-Add-NV12-and-P010-AFBC-compressed-formats.patch
PATCHFILES += 2028-media-cedrus-add-format-filtering-based-on-depth-and.patch
PATCHFILES += 2029-media-cedrus-Increase-H6-clock-rate.patch
PATCHFILES += 2030-drm-dw-hdmi-cec-sleep-100ms-on-error.patch
PATCHFILES += 2031-mmc-sunxi-fix-unusuable-eMMC-on-some-H6-boards-by-di.patch
PATCHFILES += 2032-bluetooth-btrtl-add-hci-ver-rtl8822cs.patch
PATCHFILES += 2033-h6-add-sun50i-di-deinterlace-WiP.patch
# h6 board dts additions
PATCHFILES += 2300-arm64-dts-allwinner-h6-Protect-SCP-clock.patch
PATCHFILES += 2301-arm64-dts-allwinner-h6-Add-SCPI-protocol.patch
PATCHFILES += 2302-arm64-dts-allwinner-h6-dtsi-add-sound-node.patch
PATCHFILES += 2303-arm64-dts-allwinner-h6-Fix-Cedrus-IOMMU-again.patch
PATCHFILES += 2304-arm64-dts-allwinner-h6.dtsi-add-ac200-nodes.patch
PATCHFILES += 2305-arm64-dts-allwinner-gs1-fixes.patch
PATCHFILES += 2306-arm64-dts-allwinner-tanix-tx6-additions.patch
PATCHFILES += 2307-arm64-dts-allwinner-add-Eeachlink-H6-Mini.patch
PATCHFILES += 2308-arm64-dts-allwinner-opi3-fixes.patch
PATCHFILES += 2309-arm64-dts-allwinner-h6-add-deinterlace-node.patch
PATCHFILES += 2310-arm64-dts-allwinner-add-orangepi-3-lts.patch
# h616 drivers additions
PATCHFILES += 2401-drivers-thermal-allwinner-add-h616-ths-support.patch
PATCHFILES += 2402-media-cedrus-add-H616-variant.patch
PATCHFILES += 2403-soc-sunxi-sram-Add-SRAM-C1-H616-handling.patch
PATCHFILES += 2404-dma-sun6i-dma-add-h616-support.patch
PATCHFILES += 2405-drm-sun4i-Add-H616-TCON-TV-support.patch
PATCHFILES += 2406-srm-sun4i-Add-support-for-H616-HDMI-PHY.patch
PATCHFILES += 2407-drm-sun4i-Add-compatible-for-H616-display-engine.patch
PATCHFILES += 2409-drivers-iommu-sun50i-iommu-fix-iommu-on-h616.patch
PATCHFILES += 2410-sound-soc-sunxi-add-codec-driver-for-h616.patch
PATCHFILES += 2411-sound-soc-add-sunxi_v2-for-h616-ahub.patch
PATCHFILES += 2412-sound-soc-sunxi-hack-to-fix-oops-on-cards-caps-query.patch
PATCHFILES += 2413-net-wireless-add-uwe5622-support-v20231020.patch
PATCHFILES += 2414-clk-sunxi-ng-ccu-sun6i-rtc-fix-32k-clk.patch
PATCHFILES += 2415-clk-sunxi-ng-ccu-hack-fix-too-slow-hdmi-audio.patch
PATCHFILES += 2416-regulator-add-mmc-high-speed-SD-UHS-modes-support.patch
PATCHFILES += 2417-drvers-of-add-dt-overlay-configfs-interface.patch
PATCHFILES += 2418-drv-rtc-sun6i-add-support-rtc-without-external-losc.patch
PATCHFILES += 2419-mmc-pwrseq_simple-fix-add-support-for-one-reset-control.patch
# h616 dtsi additions
PATCHFILES += 2500-arm64-dtsi-allwinner-h616-Add-display-pipeline.patch
PATCHFILES += 2501-arm64-dtsi-allwinner-h616-Add-hdmi-audio.patch
PATCHFILES += 2502-arm64-dtsi-allwinner-h616.dtsi-add-emac1.patch
PATCHFILES += 2503-arm64-dtsi-allwinner-h616.dtsi-add-cpu-gpu-dvfs-opp.patch
PATCHFILES += 2504-arm64-dtsi-allwinner-h616.dtsi-add-vdec.patch
PATCHFILES += 2505-arm64-dtsi-allwinner-h616.dtsi-fix-x96q-failing-mmc3.patch
PATCHFILES += 2506-arm64-dtsi-allwinner-h616.dtsi-enable-highspeedx-on-mmc0.patch
PATCHFILES += 2507-arm64-dtsi-allwinner-h616-add-PWM-nodes.patch
PATCHFILES += 2508-arm64-dtsi-allwinner-h616.dtsi-add-i2c-uart-pinctrl.patch
PATCHFILES += 2509-arm64-dtsi-allwinner-h616-add-ac300-network.dtsi.patch
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
# add hdmi
PATCHFILES += 2721-clk-sunxi-ng-sun55i-a523-add-HDMI-TMDS-clock.patch
PATCHFILES += 2722-clk-sunxi-ng-sun55i-a523-keep-the-IOMMU-clock-always.patch
ifeq (0,1)
# disabled currently as it breaks h616 hdmi ...
PATCHFILES += 2723-drm-sun4i-add-the-sun55i-A523-v35x-DE33-display-engi.patch
PATCHFILES += 2724-drm-sun4i-sun8i_hdmi_phy-add-H616-and-A523-HDMI-PHY-.patch
PATCHFILES += 2727-drm-sun4i-sun55i_de-fix-HDMI-page-flip-tearing-with-.patch
PATCHFILES += 2728-drm-sun4i-sun55i_de-re-issue-full-RCQ-reloads-after-.patch
PATCHFILES += 2729-drm-sun4i-sun55i_de-bypass-the-VSU-for-unscaled-laye.patch
PATCHFILES += 2730-drm-sun4i-sun8i_hdmi_phy-demote-Inno-PHY-register-du.patch
endif
PATCHFILES += 2731-clk-sunxi-ng-sun55i-a523-add-the-IOMMU-bus-reset.patch
PATCHFILES += 2732-iommu-sun50i-add-support-for-the-A523-sun55i.patch
# cedrus
PATCHFILES += 2733-media-cedrus-add-A523-sun55i-variant.patch
# a523 dtsi additions
PATCHFILES += 2800-arm64-dtsi-allwinner-add-gmac1-fixup-gmac0-in-a523.patch
PATCHFILES += 2801-arm64-dtsi-allwinner-add-ths-support-v2.patch
PATCHFILES += 2802-arm64-dtsi-allwinner-add-cpufreq-support.patch
PATCHFILES += 2803-arm64-dtsi-allwinner-a523-add-the-HDMI-display-pipeli.patch
# PATCHFILES += 2804-arm64-dtsi-allwinner-a523-make-mmc-high-speed-working.patch
PATCHFILES += 2805-arm64-dtsi-allwinner-a523-add-the-IOMMU-nodes.patch
PATCHFILES += 2806-arm64-dtsi-allwinner-a523-add-Cedrus-nodes.patch
# a523 board dts additions
PATCHFILES += 2900-arm64-dts-allwinner-h728-x96q-pro-plus-improvements.patch
PATCHFILES += 2901-arm64-dts-allwinner-t527-orangepi-4a-dts-improvements.patch
PATCHFILES += 2902-arm64-dts-allwinner-a527-Radxa-A5E-improvements.patch
PATCHFILES += 2903-arm64-dts-allwinner-a523-enable-hdmi.patch
# PATCHFILES += 2804-arm64-dtsi-allwinner-a523-make-mmc-high-speed-working.patch
#------------------------------------------------------------
endif

ifeq (1,1)
#-- Rockchip 33x patches -----------------------------------------
# rk33xx drivers additions
PATCHFILES += 3000-v4l2-wip-iep-driver.patch
PATCHFILES += 3001-drm-rockchip-vop-add-immutable-zpos-property-fix-z-order.patch
PATCHFILES += 3002-drm-rockchip-vop2-rk356x-reorder-wins-fix-osd-in-drm-planes.patch
PATCHFILES += 3003-phy-rockchip-phy-add-rockchip-inno-usb3.patch
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
PATCHFILES += 3401-net-wireless-backport-aic8800-sdio-v2025_0926_91c9dae5-mm2.patch
PATCHFILES += 3401-net-wireless-backport-aic8800-sdio-v2025_0926_91c9dae5-mm2-fix-kernel7.1.patch
PATCHFILES += 3402-net-wireless-backport-aic8800-usb-v2025_0926_91c9dae5-mm2.patch
PATCHFILES += 3402-net-wireless-backport-aic8800-usb-v2025_0926_91c9dae5-mm2-fix-kernel7.1.patch
PATCHFILES += 3403-math.h-add-DIV_ROUND_UP_NO_OVERFLOW.patch
PATCHFILES += 3404-clk-divider-Fix-divisor-masking-on-64-bit-platforms.patch
PATCHFILES += 3405-clk-composite-replace-open-coded-abs_diff.patch
PATCHFILES += 3406-mfd-rk8xx-Fix-shutdown-handler.patch
PATCHFILES += 3407-net-ethernet-add-yt6801-gige-pcie-controller.patch
PATCHFILES += 3408-net-phy-realtek-Reset-after-clock-enable.patch
PATCHFILES += 3409-net-phy-realtek-re-init-after-reset.patch
PATCHFILES += 3410-clk-rockchip-rk3588-Don-t-change-PLL-rates-w.patch

# drm enhacements from collabora
# https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commits/eec645fc0f6a12c1daa8a0e7d9a9c4a5b5875e3b
PATCHFILES += 3430-drm-rockchip-vop2-Add-clock-resets-support.patch
PATCHFILES += 3431-drm-rockchip-vop2-Add-core-reset-support.patch
PATCHFILES += 3432-drm-rockchip-dw_dp-Switch-to-drmm_kzalloc.patch
PATCHFILES += 3433-drm-rockchip-dw_dp-Fix-null-ptr-deref-in-dw_dp_remov.patch
PATCHFILES += 3434-drm-rockchip-dw_hdmi_qp-Switch-to-drmm_encoder_init.patch
PATCHFILES += 3435-RFC-drm-rockchip-vop2-Add-clock-rate-mode-check.patch
PATCHFILES += 3436-phy-rockchip-samsung-hdptx-Fix-rate-recalculation-fo.patch
PATCHFILES += 3437-phy-rockchip-samsung-hdptx-Handle-uncommitted-PHY-co.patch
PATCHFILES += 3438-phy-rockchip-samsung-hdptx-Drop-TMDS-rate-setup-work.patch
PATCHFILES += 3439-phy-rockchip-samsung-hdptx-Drop-restrict_rate_change.patch
PATCHFILES += 3440-phy-rockchip-samsung-hdptx-Simplify-GRF-access-with-.patch
PATCHFILES += 3441-phy-rockchip-samsung-hdptx-Consistently-use-bitfield.patch
PATCHFILES += 3442-DEBUG-phy-rockchip-samsung-hdptx-Add-verbose-logging.patch
PATCHFILES += 3443-drm-rockchip-dw_dp-Simplify-error-handling.patch
PATCHFILES += 3444-drm-bridge-synopsys-dw-dp-Support-unregistering-the-.patch
PATCHFILES += 3445-drm-rockchip-dw_dp-Release-core-resources.patch
PATCHFILES += 3446-drm-bridge-synopsys-dw-dp-Simplify-driver-data-setti.patch
PATCHFILES += 3447-drm-bridge-synopsys-dw-dp-Support-MEDIA_BUS_FMT_FIXE.patch
PATCHFILES += 3448-drm-bridge-synopsys-dw-dp-Add-follow-up-bridge-suppo.patch
PATCHFILES += 3449-drm-bridge-Add-out-of-band-HPD-notify-handler.patch
PATCHFILES += 3450-drm-bridge-synopsys-dw-dp-Support-software-triggered.patch
PATCHFILES += 3451-drm-rockchip-dw_dp-Implement-out-of-band-HPD-handlin.patch
PATCHFILES += 3452-drm-bridge-synopsys-dw-dp-Add-Runtime-PM-support.patch
PATCHFILES += 3453-drm-rockchip-dw_dp-Add-runtime-PM-support.patch
PATCHFILES += 3454-drm-bridge-synopsys-dw-dp-Add-audio-support.patch
PATCHFILES += 3455-phy-hdmi-Add-optional-FRL-TxFFE-config-options.patch
PATCHFILES += 3456-phy-rockchip-samsung-hdptx-Add-support-for-FRL-TxFFE.patch
PATCHFILES += 3457-WIP-update-fixes-phy-rockchip-samsung-hdptx-Handle-P.patch
# PATCHFILES += 3458-DEBUG-drm-rockchip-vop2-Log-DCLK-setup.patch
PATCHFILES += 3459-drm-bridge-Remove-redundant-error-check-in-drm_bridg.patch
PATCHFILES += 3460-drm-bridge-Add-detect_ctx-hook-and-drm_bridge_detect.patch
PATCHFILES += 3461-drm-bridge-connector-Use-cached-connector-status-in-.patch
PATCHFILES += 3462-drm-bridge-connector-Switch-to-.detect_ctx-for-conne.patch
PATCHFILES += 3463-drm-bridge-dw-hdmi-qp-Add-HDMI-2.0-SCDC-scrambling-a.patch
PATCHFILES += 3464-drm-bridge-dw-hdmi-qp-Rate-limit-i2c-read-error-mess.patch
PATCHFILES += 3465-drm-rockchip-dw_hdmi_qp-Add-missing-newlines-in-dev_.patch
PATCHFILES += 3466-drm-rockchip-dw_hdmi_qp-Use-local-dev-variable-consi.patch
PATCHFILES += 3467-drm-rockchip-dw_hdmi_qp-Register-HPD-IRQ-after-conne.patch
PATCHFILES += 3468-drm-bridge-synopsys-dw-dp-Drop-useless-memory-alloca.patch
PATCHFILES += 3469-drm-rockchip-dw_hdmi_qp-Restrict-HPD-event-to-the-af.patch
PATCHFILES += 3470-drm-display-scdc-Convert-bit-field-macros-to-use-BIT.patch
PATCHFILES += 3471-drm-display-scdc-Add-HDMI-2.1-FRL-register-definitio.patch
PATCHFILES += 3472-drm-display-scdc-helper-Add-FRL-link-training-contro.patch
PATCHFILES += 3473-drm-display-hdmi-Provide-hook-for-HDMI-2.1-FRL-mode-.patch
PATCHFILES += 3474-drm-display-bridge-connector-Wire-up-rate-validation.patch
PATCHFILES += 3475-drm-rockchip-vop2-Scale-ACLK-rate-up-for-RK3588-FRL-.patch
PATCHFILES += 3476-drm-rockchip-dw_hdmi_qp-Consolidate-link-config-into.patch
PATCHFILES += 3477-drm-bridge-dw-hdmi-qp-Log-resolution-and-refresh-rat.patch
PATCHFILES += 3478-drm-bridge-dw-hdmi-qp-Replace-sentinel-entries-with-.patch
PATCHFILES += 3479-drm-bridge-dw-hdmi-qp-Add-HDMI-2.1-FRL-support.patch
PATCHFILES += 3480-drm-bridge-dw-hdmi-qp-Add-TxFFE-level-control-suppor.patch
PATCHFILES += 3481-drm-rockchip-dw_hdmi_qp-Wire-up-FRL-operating-mode.patch
PATCHFILES += 3482-drm-rockchip-dw_hdmi_qp-Wire-up-TxFFE-level-adjustme.patch
PATCHFILES += 3483-drm-rockchip-Select-SND_SOC_HDMI_CODEC-for-ROCKCHIP_.patch
PATCHFILES += 3484-drm-rockchip-Select-SND_SOC_HDMI_CODEC-for-ROCKCHIP_.patch
# misc usbc/usbdp fixes
# revert this to make apply 3510..3537 without errors
PATCHFILES += 3505-revert-usb-typec-fusb302-Fix-resource-leak-when-devm_drm_dp_hpd_bridge_add-fails.patch
# fixes from collabora rockchip-devel branch
PATCHFILES += 3510-DEBUG-usb-typec-tcpm-also-log-to-dmesg.patch
PATCHFILES += 3511-DEBUG-usb-typec-fusb302-also-log-to-dmesg.patch
PATCHFILES += 3512-phy-rockchip-inno-usb2-add-soft-vbusvalid-control.patch
PATCHFILES += 3513-phy-rockchip-usbdp-Do-not-loose-USB3-PHY-status.patch
PATCHFILES += 3514-phy-rockchip-usbdp-Keep-clocks-running-on-PHY-re-ini.patch
PATCHFILES += 3515-phy-rockchip-usbdp-Amend-SSC-modulation-deviation.patch
PATCHFILES += 3516-phy-rockchip-usbdp-Fix-LFPS-detect-threshold-control.patch
PATCHFILES += 3517-phy-rockchip-usbdp-Add-missing-mode_change-update.patch
PATCHFILES += 3518-phy-rockchip-usbdp-Support-single-lane-DP.patch
PATCHFILES += 3519-phy-rockchip-usbdp-Rename-DP-lane-functions.patch
PATCHFILES += 3520-phy-rockchip-usbdp-Use-FIELD_PREP_WM16_CONST.patch
PATCHFILES += 3521-phy-rockchip-usbdp-Cleanup-DP-lane-selection-functio.patch
PATCHFILES += 3522-phy-rockchip-usbdp-Register-DP-aux-bridge.patch
PATCHFILES += 3523-phy-rockchip-usbdp-Drop-DP-HPD-handling.patch
PATCHFILES += 3524-phy-rockchip-usbdp-Rename-mode_change-to-phy_needs_r.patch
PATCHFILES += 3525-phy-rockchip-usbdp-Re-init-the-PHY-on-orientation-ch.patch
PATCHFILES += 3526-phy-rockchip-usbdp-Factor-out-lane_mux_sel-setup.patch
PATCHFILES += 3527-phy-rockchip-usbdp-Use-guard-functions-for-mutex.patch
PATCHFILES += 3529-usb-typec-tcpm-Also-use-SNK_WAIT_CAPABILITIES_TIMEOU.patch
PATCHFILES += 3530-usb-typec-tcpm-log-when-VDM-AMS-state-machine-is-can.patch
PATCHFILES += 3531-DEBUG-usb-typec-altmode-displayport-print-message-on.patch
PATCHFILES += 3532-usb-typec-tcpm-add-device-managed-port-registration.patch
PATCHFILES += 3533-usb-typec-fusb302-Fix-resource-handling.patch
PATCHFILES += 3534-usb-typec-fusb302-rename-init_gpio-into-fusb302_init.patch
PATCHFILES += 3535-usb-typec-fusb302-move-gpio_int_n-into-function-loca.patch
PATCHFILES += 3536-usb-typec-fusb302-rework-gpio_int_n_irq-handling.patch
PATCHFILES += 3537-usb-typec-fusb302-drop-custom-gpio-interrupt-logic.patch
PATCHFILES += 3538-usb-typec-tcpm-Fix-VDM-type-for-Enter-Mode-commands.patch
# misc additions
PATCHFILES += 3560-mmc-sdhci-of-dwcmshc-Reduce-clock-reduction-print-le.patch
PATCHFILES += 3561-drm-rockchip-vop2-rk3588-reorder-wins-fix-kodi-playback-in-drm-planes.patch
PATCHFILES += 3562-drm-rockchip-set-dma-mask-to-64-bit.patch
PATCHFILES += 3563-iommu-Add-verisilicon-IOMMU-driver.patch
PATCHFILES += 3564-media-rockchip-rkvdec-vdpu381-add-vp9-support-v9.patch
PATCHFILES += 3565-media-rkvdec-remove-vb2_is_busy-check-in-rkvdec_s_ct.patch
PATCHFILES += 3566-media-v4l2-core-Initialize-h264-frame_mbs_only_flag-as-1.patch
PATCHFILES += 3567-media-verisilicon-AV1-Restore-IOMMU-context-before-d.patch
PATCHFILES += 3568-mfd-khadas-mcu-add-edge2-support.patch
PATCHFILES += 3569-media-rkvdec-prime-VDPU383-deblock-warmup-rk3576.patch
# rk35xx dtsi additions
PATCHFILES += 3600-arm64-dts-rockchip-enable-usb2-usb3-sata-audio-in-rk35xx.dtsi.patch
PATCHFILES += 3601-arm64-dtsi-rockchip-rk356x-disable-vepu-rga-enable-dfi.patch
PATCHFILES += 3602-arm64-dtsi-rockchip-rk356x-enable-dwc3simple-for-usb-boot.patch
PATCHFILES += 3603-arm64-dtsi-rk3588s-add-vop2-clock-resets.patch
PATCHFILES += 3604-arm64-dtsi-rockchip-rk3588-enable-dwc3simple-for-usb-boot.patch
PATCHFILES += 3605-arm64-dtsi-rockchip-rk356x-add-rkvdec2-video-decoder-nodes.patch
PATCHFILES += 3607-arm64-dtsi-rk3588s-increas-vop-clk.patch
PATCHFILES += 3608-arm64-dtsi-rk3588-enable-dp0-dp1-audio-support.patch
# PATCHFILES += 3609-arm64-dtsi-rockchip-disable-vpu121.patch
PATCHFILES += 3610-arm64-dtsi-rockchip-rk3576-enable-dwc3simple-for-usb-boot.patch
PATCHFILES += 3611-arm64-dtsi-rk3588-add-av1-iommu-nodes.patch
PATCHFILES += 3612-arm64-dtsi-rk3576-add-DP-sound-nodes.patch

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
PATCHFILES += 3718-arm64-dts-rockchip-rk3588s-add-opi5pro-dts.patch
PATCHFILES += 3719-arm64-dts-rockchip-rk3588s-add-nanopi-m6-dts.patch
PATCHFILES += 3720-arm64-dts-rockchip-rk3588s-nanopc-r6s-dts-improvements.patch
PATCHFILES += 3721-arm64-dts-rockchip-rk3588-nanopc-t6-dtsi-improvements.patch
PATCHFILES += 3722-arm64-dts-rockchip-rk3588-add-rock5t-dt.patch
PATCHFILES += 3723-arm64-dts-rockchip-rk3588-khadas-edge2-dts-improvements.patch
PATCHFILES += 3724-arm64-dts-rockchip-rk3588-rock5b-t-wip-typec-dp-support.patch
PATCHFILES += 3725-arm64-dts-add-nanopi-m5-dts-improvements.patch
PATCHFILES += 3726-arm64-dts-rock4d-improvements.patch
PATCHFILES += 3727-arm64-dts-add-rk3576-nanopi-r76s-dt.patch
PATCHFILES += 3728-arm64-dts-rk3576-boards-add-frl-enable-gpios.patch
PATCHFILES += 3729-arm64-dts-rk3588-boards-add-frl-enable-gpios.patch
PATCHFILES += 3730-arm64-dts-rk3588s-boards-add-frl-enable-gpios.patch
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
PATCHFILES += 5051-net-pcs-pcs-xpcs-regmap-support-XPCS-memory-mapped-M.patch
PATCHFILES += 5052-net-pcs-pcs-xpcs-select-operating-mode-for-10G-baseR.patch
PATCHFILES += 5053-net-pcs-pcs-xpcs-Preserve-BMCR_ANENBLE-during-link-u.patch
PATCHFILES += 5054-net-stmmac-dma-create-a-separate-dma_device-pointer.patch
PATCHFILES += 5055-net-stmmac-dwxgmac2-Add-multi-MSI-interrupt-mode.patch
PATCHFILES += 5056-net-stmmac-dwxgmac2-Add-XGMAC-3.01a-support.patch
PATCHFILES += 5057-net-stmmac-dwxgmac2-export-symbols-for-XGMAC-3.01a-D.patch
PATCHFILES += 5058-dt-bindings-net-toshiba-tc965x-dwmac-add-TC956x-Ethe.patch
PATCHFILES += 5059-gpio-tc956x-add-TC956x-QPS615-support.patch
PATCHFILES += 5060-net-stmmac-tc956x-add-TC956x-QPS615-support.patch
PATCHFILES += 5061-misc-tc956x_pci-add-TC956x-QPS615-support.patch
PATCHFILES += 5062-net-stmmac-tc956x-fix-with-7.1kernel-compability.patch
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
PATCHFILES += 5085-0003-remoteproc-core-Attach-rproc-asynchronously-in-rproc.patch
PATCHFILES += 5086-0004-remoteproc-qcom-Check-glink-edge-in-glink_subdev_sto.patch
PATCHFILES += 5087-0006-remoteproc-qcom-pas-Add-late-attach-support-for-subs.patch
PATCHFILES += 5088-0276-remoteproc-qcom_q6v5_pas-attach-to-preloaded-firmwar.patch
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
PATCHFILES += 5116-0088-phy-qcom-qmp-combo-Move-pipe_clk-on-off-to-common.patch
# drm patches
PATCHFILES += 5121-0032-drm-msm-dp-Delay-applying-clock-defaults-until-PHY-i.patch
PATCHFILES += 5124-0066-drm-bridge-simple-add-the-Chrontel-CH7218A-DP-to-HDM.patch
PATCHFILES += 5125-0077-drm-msm-dp-fix-HPD-state-status-bit-shift-value.patch
PATCHFILES += 5126-0078-drm-msm-dp-Fix-the-ISR_-enum-values.patch
PATCHFILES += 5127-0079-drm-msm-dp-Read-DPCD-and-sink-count-in-bridge-detect.patch
PATCHFILES += 5128-0080-drm-msm-dp-Move-link-training-to-atomic_enable.patch
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
PATCHFILES += 5174-0067-review-later-drm-bridge-simple-bridge-keep-powered-d.patch
PATCHFILES += 5175-0072-ACPI-platform_profile-Make-legacy-sysfs-optional.patch
PATCHFILES += 5176-0073-platform_profile-Move-core-out-of-ACPI.patch
PATCHFILES += 5177-0075-platform-arm64-Add-Radxa-SVC-GLINK-driver.patch
PATCHFILES += 5178-0112-interconnect-qcom-sc8280xp-Enable-QoS-configuration.patch
PATCHFILES += 5179-0114-of-property-Create-devlink-between-PCI-Host-bridge-a.patch
PATCHFILES += 5180-0118-iommu-arm-smmu-qcom-Ensure-smmu-is-powered-up-in-set.patch
PATCHFILES += 5181-0171-ufs-core-Configure-only-active-lanes-during-link.patch
PATCHFILES += 5182-0172-ufs-ufs-qcom-Enable-Auto-Hibern8-clock-request-suppo.patch
PATCHFILES += 5183-0178-dmaengine-qcom-gpi-set-DMA_PRIVATE-capability.patch
PATCHFILES += 5184-0224-media-uapi-Add-MEDIA_BUS_FMT_SENSOR_DATA-media-bus-f.patch
PATCHFILES += 5185-0231-iio-adc-qcom-spmi-adc5-add-ADC7-GPIO1-GPIO4.patch
PATCHFILES += 5186-0245-usb-typec-tcpm-support-skipping-VSafe0V-check.patch
PATCHFILES += 5187-0268-ufs-qcom-add-PA_TACTIVATE-quirk-for-Kioxia-THGJFGT1E.patch
PATCHFILES += 5188-0308-HACK-disable-fake-battery-device-on-pmic-glink.patch
# dtsi additions
PATCHFILES += 5220-arm64-dtsi-qcom-kodiak-Add-I2C-aliases-for-CCI.patch
PATCHFILES += 5221-arm64-dtsi-qcom-kodiak-Mark-secondary-USB-controller-as-wakeup-source.patch
PATCHFILES += 5222-arm64-dtsi-qcom-sc7280-Fix-PDC-reg-size-to-single-APSS-DRV-region.patch
# sc8280 dtsi additions
PATCHFILES += 5250-arm64-dtsi-qcom-sc8280xp-improvements-for-dragon-q8b.patch
# board dts additions
PATCHFILES += 5300-arm64-dts-qcom-qcs6490-radxa-dragon-q6a-Enable-UFS-controller.patch
PATCHFILES += 5301-arm64-dts-qcom-qcs6490-radxa-dragon-q6a-Enable-USB-3.0-and-HDMI-ports.patch
PATCHFILES += 5302-arm64-dts-qcom-qcs6490-radxa-dragon-q6a-Use-board-specific-CDSP-firmware.patch
PATCHFILES += 5303-arm64-dts-qcom-qcs6490-radxa-dragon-q6a-Drop-QSPI-node-and-reserve-its-pins.patch
PATCHFILES += 5304-arm64-dts-qcom-qcs6490-radxa-dragon-q6a-Correct-GPIO_27-label.patch
PATCHFILES += 5305-arm64-dts-qcom-qcs6490-radxa-dragon-q6a-Align-reserved-memory-with-latest-firmware-map.patch
PATCHFILES += 5306-arm64-dts-qcom-qcs6490-radxa-dragon-q6a-factor-out-common-board-dtsi.patch
PATCHFILES += 5307-arm64-dts-qcom-qcs6490-radxa-dragon-q6a-add-LPASS-CPU-audio-variant.patch
PATCHFILES += 5308-arm64-dts-qcom-qcs6490-radxa-dragon-q6a-change-led-fn.patch
PATCHFILES += 5309-arm64-dts-qcom-qcs6490-radxa-dragon-q6a-finetune-display-pipeline.patch
PATCHFILES += 5310-arm64-dts-qcom-qcs6490-radxa-dragon-q6a-add-missing-pcie-regulators-disable-eud.patch
# sc8280 boards dts additions
PATCHFILES += 5350-arm64-dts-qcom-sc8280xp-add-dragon-q8b.patch
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
