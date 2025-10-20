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

PATCHFILES  = linux-6.17.patch.gar
PATCHFILES += linux-6.17-perl.patch.gar
PATCHFILES += linux-6.17-defaults.patch

ifeq (1,1)

PATCHFILES += 0001-net-wireless-rtw88-fix-wrong-hw.ver.patch
PATCHFILES += 0108-drivers-led-add-openvfd-g3118dda3.patch
PATCHFILES += 0109-drivers-mmc-add-disk-activity-support.patch

ifeq (1,1)
# Misc panfrost patches
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
PATCHFILES += 0511-drm-sun4i-add-csc-yuv-afbc-support.patch
PATCHFILES += 0540-drm-bridge-dw-hdmi-add-mtmdsclock-parameter-to-phy-c.patch
PATCHFILES += 0541-drm-bridge-dw-hdmi-support-configuring-phy-for-deep-.patch
PATCHFILES += 0542-drm-sun4i-dw-hdmi-Switch-to-bridge-functions.patch
PATCHFILES += 0543-drm-sun8i-dw-hdmi-switch-to-devm_drm_bridge_alloc.patch
PATCHFILES += 0547-drm-dw-hdmi-cec-sleep-100ms-on-error.patch
PATCHFILES += 0548-drm-bridge-dw-hdmi-fix-4k60-modes-on-some-tv.patch
PATCHFILES += 0549-drm-bridge-synopsys-Fix-CEC-not-working-after-power.patch
PATCHFILES += 0550-HACK-clk-sunxi-ng-unify-parent-for-HDMI-clocks.patch
PATCHFILES += 0552-asoc-sun4i-i2s-WiP-multi-channel.patch
PATCHFILES += 0553-media-cedrus-Don-t-CPU-map-source-buffers.patch
PATCHFILES += 0554-media-Add-NV12-and-P010-AFBC-compressed-formats.patch
PATCHFILES += 0555-media-cedrus-add-format-filtering-based-on-depth-and.patch
PATCHFILES += 0557-media-cedrus-Increase-H6-clock-rate.patch
PATCHFILES += 0560-mmc-sunxi-fix-unusuable-eMMC-on-some-H6-boards-by-di.patch
PATCHFILES += 0561-bluetooth-btrtl-add-hci-ver-rtl8822cs.patch
PATCHFILES += 0562-h6-add-sun50i-di-deinterlace-WiP.patch
# device-tree patches
PATCHFILES += 0570-arm64-dts-allwinner-h6-Protect-SCP-clock.patch
PATCHFILES += 0571-arm64-dts-allwinner-h6-Add-SCPI-protocol.patch
PATCHFILES += 0572-arm64-dts-allwinner-h6-dtsi-add-sound-node.patch
PATCHFILES += 0573-arm64-dts-allwinner-h6-Fix-Cedrus-IOMMU-again.patch
PATCHFILES += 0574-arm64-dts-allwinner-h6.dtsi-add-ac200-nodes.patch
PATCHFILES += 0575-arm64-dts-allwinner-gs1-fixes.patch
PATCHFILES += 0576-arm64-dts-allwinner-tanix-tx6-additions.patch
PATCHFILES += 0577-arm64-dts-allwinner-add-Eeachlink-H6-Mini.patch
PATCHFILES += 0580-arm64-dts-allwinner-opi3-fixes.patch
PATCHFILES += 0582-arm64-dts-allwinner-h6-add-deinterlace-node.patch
PATCHFILES += 0583-arm64-dts-allwinner-add-orangepi-3-lts.patch
#------------------------------------------------------------
endif

ifeq (1,1)
#-- Allwinner H616 patches -----------------------------------------
PATCHFILES += 0600-drivers-h616-wip-add-usb-emac2-support.patch
PATCHFILES += 0601-drivers-thermal-allwinner-add-h616-ths-support.patch
PATCHFILES += 0602-media-cedrus-add-H616-variant.patch
PATCHFILES += 0603-soc-sunxi-sram-Add-SRAM-C1-H616-handling.patch
PATCHFILES += 0604-dma-sun6i-dma-add-h616-support.patch
PATCHFILES += 0610-drm-sun4i-add-sun50i-h616-hdmi-phy-support.patch
PATCHFILES += 0615-drivers-iommu-sun50i-iommu-fix-iommu-on-h616.patch
PATCHFILES += 0620-sound-soc-sunxi-add-codec-driver-for-h616.patch
PATCHFILES += 0621-sound-soc-add-sunxi_v2-for-h616-ahub.patch
PATCHFILES += 0623-sound-soc-sunxi-hack-to-fix-oops-on-cards-caps-query.patch
PATCHFILES += 0630-net-wireless-add-uwe5622-support-v20231020.patch
PATCHFILES += 0631-clk-sunxi-ng-ccu-sun6i-rtc-fix-32k-clk.patch
PATCHFILES += 0632-clk-sunxi-ng-ccu-hack-fix-too-slow-hdmi-audio.patch
PATCHFILES += 0633-regulator-add-mmc-high-speed-SD-UHS-modes-support.patch
PATCHFILES += 0635-drvers-of-add-dt-overlay-configfs-interface.patch
PATCHFILES += 0636-drv-rtc-sun6i-add-support-rtc-without-external-losc.patch
# dtsi patches
PATCHFILES += 0640-arm64-dts-allwinner-h616.dtsi-add-audio-hdmi-vdec.patch
PATCHFILES += 0641-arm64-dts-allwinner-h616.dtsi-add-cpu-gpu-dvfs-opp.patch
PATCHFILES += 0642-arm64-dts-allwinner-h616.dtsi-add-emac1.patch
PATCHFILES += 0643-arm64-dts-allwinner-h616.dtsi-fix-x96q-failing-mmc3.patch
PATCHFILES += 0644-arm64-dts-allwinner-h616.dtsi-enable-highspeedx-on-mmc0.patch
# dts patches
PATCHFILES += 0644-arm64-dts-allwinner-h616-OrangePI-Zero23-enable-ths-hdmi-audio.patch
PATCHFILES += 0645-arm64-dts-allwinner-h616-add-Tanix-TX6s-TVbox.patch
PATCHFILES += 0646-arm64-dts-allwinner-h616-add-Tanix-TX6s-axp313-TVbox.patch
PATCHFILES += 0647-arm64-dts-allwinner-h313-add-x96q-TVbox.patch
PATCHFILES += 0648-arm64-dts-allwinner-h313-add-x96q-lpddr3-TVbox.patch
PATCHFILES += 0649-arm64-dts-allwinner-h618-add-vontar-h618-TVbox.patch
PATCHFILES += 0650-arm64-dts-allwinner-h618-improve-opi-2w.patch
PATCHFILES += 0651-arm64-dts-allwinner-h313-improve-tanix-tx1.patch
PATCHFILES += 0652-arm64-dts-allwinner-h313-add-x96q-v5.1-TVbox.patch
PATCHFILES += 0653-arm64-dts-allwinner-h616-add-pendoo-x12pro-tvbox.patch
PATCHFILES += 0654-arm64-dts-allwinner-h618-improve-transpeed-8k618-tvbox.patch
PATCHFILES += 0655-arm64-dts-allwinner-h313-h616-h618-add-cpu-overclock-via-overlays.patch
PATCHFILES += 0656-arm64-dts-allwinner-h313-h616-h618-add-gpu-overclock-via-overlays.patch
#------------------------------------------------------------
endif

ifeq (1,1)
#-- Rockchip 33x patches -----------------------------------------
PATCHFILES += 0722-v4l2-wip-iep-driver.patch
PATCHFILES += 0725-drm-rockchip-vop-add-immutable-zpos-property-fix-z-order.patch
PATCHFILES += 0727-drm-rockchip-vop2-rk356x-reorder-wins-fix-osd-in-drm-planes.patch
# dtsi patches
PATCHFILES += 0738-arm64-dtsi-rockchip-rk3399-rise-alert-crit-cpu-temps.patch
PATCHFILES += 0739-arm64-dtsi-rockchip-rk3328-rk3399-add-soft-reset.patch
# dts patches
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
PATCHFILES += 0758-arm64-dts-rockchip-rk3328-rk3566-add-cpu-gpu-overclock-overlays.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Rockchip 356x patches -----------------------------------------
PATCHFILES += 0800-Enable-rk356x-PCIe-controller.patch
PATCHFILES += 0801-net-wireless-backport-aic8800-sdio-v2025_0410_gb99ca8b6-mm2.patch
PATCHFILES += 0803-net-wireless-backport-aic8800-usb-v2025_0410_gb99ca8b6-mm2.patch
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
PATCHFILES += 0848-arm64-dts-rockchip-improve-dts-for-opi-3b-v1.1.patch
PATCHFILES += 0849-arm64-dts-rockchip-improve-dts-for-zero3.patch
PATCHFILES += 0850-arm64-dts-rockchip-rk356x-add-eth-wifi-aliases.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- RaspberryPI patches -----------------------------------------
# Hack for adding H264 v4l2 decoding on RPI
PATCHFILES += 0900-rpi-vc04_services-add_h~l2-m2m_decode-15062024.patch
PATCHFILES += 0902-media-add-rpivid-driver.patch
# add rpi5 rp1 support
PATCHFILES += 0932-drivers-pci-add-rp1-support.patch
PATCHFILES += 0933-drivers-clk-add-rp1-support.patch
PATCHFILES += 0934-drivers-pinctrl-add-rp1-support.patch
PATCHFILES += 0935-drivers-dma-add-rp1-support.patch
PATCHFILES += 0936-drivers-irqchip-add-rp1-support.patch
PATCHFILES += 0937-drivers-phy-add-rp1-support.patch
PATCHFILES += 0938-drivers-mfd-add-rp1-support.patch
PATCHFILES += 0939-drivers-pmdomain-add-rp1-support.patch
PATCHFILES += 0940-drivers-mmc-add-rp1-support.patch
PATCHFILES += 0941-drivers-i2c-add-rp1-support.patch
PATCHFILES += 0942-drivers-usb-add-rp1-support.patch
PATCHFILES += 0943-drivers-net-add-rp1-support.patch
PATCHFILES += 0944-drivers-spi-add-rp1-support.patch
PATCHFILES += 0945-drivers-pwm-add-rp1-support.patch
PATCHFILES += 0946-drivers-hwmon-add-rp1-support.patch
PATCHFILES += 0947-drivers-thermal-add-rp1-support.patch
# unify rpi3 rpi4 rpi5 vc4 support
PATCHFILES += 0948-gpu-drm-vc4-add-rpi5-support.patch
# add iommu - not works correctly
#PATCHFILES += 0949-drivers-iommu-add-bcm2712-iommu.patch
# device-tree patches
PATCHFILES += 0970-arm64-dts-brcm-rpi4-set-led-to-disk-activity-mmc0-alias.patch
PATCHFILES += 0971-arm64-dts-brcm-rpi5-add-rp1-usb-eth-pwm.patch
PATCHFILES += 0972-arm64-dts-brcm-rpi5-fix-hdmi-audio.patch
PATCHFILES += 0973-arm64-dts-brcm-rpi5-add-v3d.patch
PATCHFILES += 0974-arm64-dts-brcm-rpi4-add-rpivid.patch
PATCHFILES += 0975-arm64-dts-brcm-rpi5-add-rpivid.patch
# PATCHFILES += 0976-arm64-dts-brcm-rpi5-add-iommu.patch
PATCHFILES += 0977-arm64-dts-brcm-rpi5-incr-cma-to-384M.patch
PATCHFILES += 0978-arm64-dts-brcm-rpi5-add-fan-support.patch
PATCHFILES += 0979-arm64-dts-brcm-rpi4-incr-cma-to-384M.patch
PATCHFILES += 0980-arm64-dts-brcm-rpi5-add-wifi-bt-support.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Rockchip 3588 patches -----------------------------------------
PATCHFILES += 1000-math.h-add-DIV_ROUND_UP_NO_OVERFLOW.patch
PATCHFILES += 1001-clk-divider-Fix-divisor-masking-on-64-bit-platforms.patch
PATCHFILES += 1002-clk-composite-replace-open-coded-abs_diff.patch
PATCHFILES += 1004-mfd-rk8xx-Fix-shutdown-handler.patch
PATCHFILES += 1005-net-ethernet-add-yt6801-gige-pcie-controller.patch
PATCHFILES += 1006-net-ethernet-yt6801-gige-pcie-silence-debug-msgs.patch
PATCHFILES += 1007-net-stmmac-dwmac-rk-fix-disabling-set_clock_selection.patch
PATCHFILES += 1008-net-phy-realtek-reset-after-clock-enable.patch
PATCHFILES += 1009-pci-dw-rockchip-add-system-pm-support.patch
# drm improvements
PATCHFILES += 1010-drm-rockchip-vop2-Add-clock-resets-support.patch
PATCHFILES += 1011-drm-rockchip-vop2-Add-core-reset-support.patch
# add dp support v7 https://patchwork.kernel.org/project/linux-rockchip/list/?series=994484
PATCHFILES += 1012-drm-bridge-synopsys-Add-DW-DPTX-Controller-support-l.patch
PATCHFILES += 1013-drm-rockchip-Add-RK3588-DPTX-output-support.patch
PATCHFILES += 1014-drm-birdge-simple-bridge-Add-support-for-radxa-ra620.patch
# cec support v4 https://patchwork.kernel.org/project/linux-rockchip/list/?series=998607
PATCHFILES += 1015-drm-bridge-dw-hdmi-qp-Add-CEC-support-v4.patch
PATCHFILES += 1016-drm-bridge-dw-hdmi-qp-Fixup-timer-base-setup-v4.patch
PATCHFILES += 1017-drm-rockchip-dw_hdmi_qp-Improve-error-handling-with-dev_err_probe-v4.patch
PATCHFILES += 1018-drm-rockchip-dw_hdmi_qp-Provide-CEC-IRQ-in-dw_hdmi_qp_plat_data-v4.patch
PATCHFILES += 1019-drm-rockchip-dw_hdmi_qp-Provide-ref-clock-rate-in-dw_hdmi_qp_plat_data-v4.patch
# fix for swiotlb buffer is full
PATCHFILES += 1020-drm-rockchip-set-dma-mask-to-64-bit.patch
# var fixes for hdptx https://patchwork.kernel.org/project/linux-rockchip/list/?series=998158
PATCHFILES += 1021-phy-rockchip-samsung-hdptx-Fix-reported-clock-rate-i.patch
PATCHFILES += 1022-phy-rockchip-samsung-hdptx-Reduce-ROPLL-loop-bandwid.patch
PATCHFILES += 1023-phy-rockchip-samsung-hdptx-Prevent-Inter-Pair-Skew-f.patch
# var fixes
PATCHFILES += 1024-phy-rockchip-samsung-hdptx-Use-usleep_range-instead-.patch
PATCHFILES += 1025-phy-rockchip-samsung-hdptx-Fix-coding-style-alignmen.patch
PATCHFILES += 1026-phy-rockchip-samsung-hdptx-Consistently-use-rk_-hdpt.patch
PATCHFILES += 1027-phy-rockchip-samsung-hdptx-Enable-lane-output-in-com.patch
PATCHFILES += 1028-phy-rockchip-samsung-hdptx-Cleanup-_cmn_init_seq-lis.patch
PATCHFILES += 1029-phy-rockchip-samsung-hdptx-Compute-clk-rate-from-PLL.patch
PATCHFILES += 1030-phy-rockchip-samsung-hdptx-Drop-hw_rate-driver-data.patch
PATCHFILES += 1030-phy-rockchip-samsung-hdptx-Switch-to-driver-specific.patch
PATCHFILES += 1031-phy-rockchip-samsung-hdptx-Extend-rk_hdptx_phy_verif.patch
# add high color support v2 https://patchwork.kernel.org/project/linux-rockchip/list/?series=995176 
PATCHFILES += 1033-drm-rockchip-vop2-Check-bpc-before-switching-DCLK-so.patch
PATCHFILES += 1034-drm-bridge-dw-hdmi-qp-Handle-platform-supported-form.patch
PATCHFILES += 1035-drm-rockchip-dw_hdmi_qp-Switch-to-phy_configure.patch
PATCHFILES += 1036-drm-rockchip-dw_hdmi_qp-Use-bit-macros-for-RK3576-re.patch
PATCHFILES += 1037-drm-rockchip-dw_hdmi_qp-Add-high-color-depth-support.patch
# extra drm additions
PATCHFILES += 1038-drm-bridge-add-scramb-support.patch
PATCHFILES += 1039-WIP-YUV420-drm-rockchip-vop2-Add-YUV420-output-forma.patch
PATCHFILES += 1040-WIP-YUV420-drm-rockchip-dw_hdmi_qp-Add-YUV420-output.patch
# add frl support v4 https://patchwork.kernel.org/project/linux-rockchip/list/?series=998198
PATCHFILES += 1041-phy-hdmi-Add-HDMI-2.1-FRL-configuration-options.patch
PATCHFILES += 1042-phy-rockchip-samsung-hdptx-Add-HDMI-2.1-FRL-support.patch
PATCHFILES += 1043-drm-bridge-add-frl-support.patch
PATCHFILES += 1044-DEBUG-phy-rockchip-samsung-hdptx-Add-verbose-logging.patch
# misc fixes and additions
PATCHFILES += 1046-pm-devfreq-rockchip-dfi-add-support-for-lpddr5.patch
# usb-c dp alt mode support
PATCHFILES += 1047-phy-rockchip-inno-usb2-add-soft-vbusvalid-control.patch
PATCHFILES += 1048-phy-rockchip-usbdp-move-orientation-handling-further.patch
PATCHFILES += 1049-phy-rockchip-usbdp-reset-USB3-and-reinit-on-orientat.patch
# make kodi workig ok
PATCHFILES += 1051-drm-rockchip-vop2-rk3588-reorder-wins-fix-kodi-playback-in-drm-planes.patch
PATCHFILES += 1052-usb-typec-fusb302-and-tcpm-debug-logs-to-msg.patch
# rkvdec2 h264 hevc support
PATCHFILES += 1054-bitmap-introduce-hardware-specific-bitfield-operatio.patch
# https://gitlab.collabora.com/detlev/linux/-/commits/add-v4l2-st-lt-ref-set-support-v3 7.08.2025
PATCHFILES += 1055-media-v4l2-ctrls-Add-hevc_ext_sps_-ls-t_rps-controls.patch
# https://gitlab.collabora.com/detlev/linux/-/commits/add-vdpu381-and-383-to-rkvdec-v3 21.09.2025
PATCHFILES += 1056-media-rockchip-rkvdec-add-vdpu381-and-383-to-rkvdec-v3-21092025.patch
PATCHFILES += 1057-media-rockchip-rkvdec-vdpu381-and-383-v3-fixup-21092025-to-6.17.patch
PATCHFILES += 1058-media-rkvdec-fix-rkvdec_enum_coded_fmt_desc-rebase-mistake.patch
PATCHFILES += 1059-media-rkvdec-fix-typos-in-vdpu381-vdpu383-hevc.patch
PATCHFILES += 1060-media-rkvdec-fixup-image-formats.patch
# fix dw-hdmi spurious irg on resume
PATCHFILES += 1075-drm-bridge-dw-hdmi-qp-fix-spurious-IRQ-on-resume.patch
# fix mmc cqe
PATCHFILES += 1076-mmc-sdhci-of-dwcmshc-add-command-queue-support.patch
# fix from armbian for initialize h264 frame_mbs_only_flag as 1
PATCHFILES += 1078-media-v4l2-core-Initialize-h264-frame_mbs_only_flag-as-1.patch
# fix for green screen on chrominium
PATCHFILES += 1079-media-rkvdec-remove-vb2_is_busy-check-in-rkvdec_s_ct.patch
# dtsi additions
PATCHFILES += 1080-arm64-dtsi-rk3588s-add-vop2-clock-resets.patch
PATCHFILES += 1081-arm64-dtsi-rockchip-add-dw-dp-nodes.patch
PATCHFILES += 1082-arm64-dtsi-rockchip-add-the-vdpu381-video-decoders.patch
PATCHFILES += 1083-arm64-dtsi-rockchip-rk3288-add-vdec-node.patch
PATCHFILES += 1084-arm64-dtsi-rockchip-rk356x-add-rkvdec2-video-decoder-nodes.patch
PATCHFILES += 1085-arm64-dtsi-rk3588-enable-emmc-cqe.patch
# dts patches
PATCHFILES += 1087-arm64-dts-rockchip-rk3588s-rock5a-dts-improvements.patch
PATCHFILES += 1088-arm64-dts-rockchip-rk3588-rock5b-dts-improvements.patch
PATCHFILES += 1089-arm64-dts-rockchip-rk3588s-rock5c-dts-improvements.patch
PATCHFILES += 1090-arm64-dts-rockchip-rk3588-rock5itx-dts-improvements.patch
PATCHFILES += 1091-arm64-dts-rockchip-rk3588s-opi5-dts-improvements.patch
PATCHFILES += 1092-arm64-dts-rockchip-rk3588-opi5plus-dts-improvements.patch
PATCHFILES += 1093-arm64-dts-rockchip-rk3588s-add-opi5pro-dts.patch
PATCHFILES += 1094-arm64-dts-rockchip-rk3588s-add-nanopi-m6-dts.patch
PATCHFILES += 1095-arm64-dts-rockchip-rk3588s-nanopc-r6s-dts-improvements.patch
PATCHFILES += 1096-arm64-dts-rockchip-rk3588-nanopc-t6-dtsi-improvements.patch
PATCHFILES += 1097-arm64-dts-rockchip-rk3588-add-rock5t-dt.patch
# for testing rkvdec h264
# PATCHFILES += 1099-arm64-dtsi-rockchip-disable-vpu121.patch

#------------------------------------------------------------
endif

ifeq (1,1)
#-- Allwinner A523/T527/H728 --------------------------------
PATCHFILES += 1101-axp20x-HACK-mfd-and-multiple-axp-on-the-bus.patch
PATCHFILES += 1104-regulator-axp20x-force-polyphase-setup-for-axp323.patch
PATCHFILES += 1140-net-drivers-stmmac-add-initial-support-for-a523-gmac1-v2.patch
PATCHFILES += 1141-thermal-drivers-sun8i-add-initial-support-for-ths-v2.patch
PATCHFILES += 1142-add-initial-cpufreq-support.patch
PATCHFILES += 1143-pci-add-sunxi-pcie-support.patch
PATCHFILES += 1144-phy-allwinner-add-sunxi-inno-combophy.patch
PATCHFILES += 1145-clk-sunxi-ng-add-enable-pcie-ccu-clocks.patch
PATCHFILES += 1146-net-drivers-stmmac-add-25M-phy-clock-support.patch
# dtsi additions
PATCHFILES += 1151-arm64-dtsi-allwinner-add-gmac1-fixup-gmac0-in-a523.patch
PATCHFILES += 1153-arm64-dtsi-allwinner-add-ths-support-v2.patch
PATCHFILES += 1154-arm64-dtsi-allwinner-add-cpufreq-support.patch
PATCHFILES += 1157-arm64-dtsi-allwinner-add-pcie-nodes.patch
# boards additions
PATCHFILES += 1170-arm64-dts-allwinner-h728-x96q-pro-plus-improvements.patch
PATCHFILES += 1172-arm64-dts-allwinner-t527-orangepi-4a-dts-improvements.patch
PATCHFILES += 1173-arm64-dts-allwinner-a527-Radxa-A5E-improvements.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Rockchip 3576 patches -----------------------------------------
# misc fixes
PATCHFILES += 1214-mmc-core-add-force-io-to-1.8v-quirk.patch
# dtsi additions
PATCHFILES += 1261-arm64-dtsi-rockchip-add-the-vdpu383-video-decoder.patch
PATCHFILES += 1266-arm64-dtsi-rockchip-Add-thermal-nodes-to-RK3576.patch
PATCHFILES += 1267-arm64-dtsi-rockchip-Add-thermal-trim-OTP-and-tsadc-nodes.patch
PATCHFILES += 1268-arm64-dtsi-rockchip-enable-RK3576-watchdog.patch
# bards dt additions/patches
PATCHFILES += 1280-arm64-dts-add-nanopi-m5-dts-improvements.patch
PATCHFILES += 1281-arm64-dts-rock4d-improvements.patch
PATCHFILES += 1282-arm64-dts-add-rk3576-nanopi-r76s-dt.patch
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
