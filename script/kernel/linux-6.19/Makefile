
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

PATCHFILES  = linux-6.19.patch.gar
PATCHFILES += linux-6.19-perl.patch.gar
PATCHFILES += linux-6.19-defaults.patch

ifeq (1,1)

PATCHFILES += 0001-net-brcm80211-brcmfmac-pcie-stop-loading-txcap_blob-fw.patch

PATCHFILES += 0108-drivers-led-add-openvfd-g3118dda3.patch
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

ifeq (1,1)
#-- Amlogic patches -----------------------------------------
# Fixes non-working EGLFS DRM_PRIME/DRM Planes on all Amlogic
PATCHFILES += 0301-drm-meson-swap-primary-overlay-zpos.patch
# preparation for s4/sc2
PATCHFILES += 0305-soc-amlogic-meson-gx-socinfo-add-s905x4w2y4.patch
PATCHFILES += 0306-mmc-meson-gx-Add-support-for-Meson-S4.patch
PATCHFILES += 0308-reset-reset-meson-add-support-for-Amlogic-SC2.patch
PATCHFILES += 0309-irqchip-meson-gpio-Add-support-for-meson-SC2-.patch
# s4 analog audio v6 https://patchwork.kernel.org/project/linux-amlogic/list/?series=1046918
PATCHFILES += 0310-dt-bindings-clock-meson-Add-audio-power-domain-for-S4-soc-v6.patch
PATCHFILES += 0311-dt-bindings-Asoc-axg-audio-Add-S4-audio-tocodec-v6.patch
PATCHFILES += 0312-ASoC-meson-g12a-toacodec-Add-S4-tocodec-driver-v6.patch
PATCHFILES += 0313-clk-meson-axg_audio-add-S4-support-v6.patch
# s4 hdmi ausio
PATCHFILES += 0314-ASoC-meson-add-s4-tohdmitx-control.patch
# s4 clk for hdmi
PATCHFILES += 0320-clk-amlogic-add-video-related-clocks-for-S4-SoC.patch
PATCHFILES += 0321-soc-amlogic-meson-clk-measure-Add-support-for.patch
# s4 hdmi
PATCHFILES += 0325-drm-meson-add-s4-drm-driver.patch
# cpu dvfs support
PATCHFILES += 0330-clk-meson-meson8b-move-CPU-clock-rate-change-logic-to-cpufreq.patch
PATCHFILES += 0331-cpufreq-Add-driver-for-Meson8-8b-8m2.patch
PATCHFILES += 0332-firmware-meson_sm-Add-CPU-DVFS-table-index-bin-support.patch
PATCHFILES += 0333-cpufreq-Add-driver-for-Meson-s4.patch
# misc
PATCHFILES += 0340-phy-amlogic-meson-g12a-usb2-add-support-for-M.patch
PATCHFILES += 0342-net-wireless-broadcom-add-sdio-ID-43342.patch
PATCHFILES += 0343-media-cec-platform-meson-ao-cec-g12a-fix-debu.patch
PATCHFILES += 0344-gpu-panfrost-add-meson-s4-support.patch
PATCHFILES += 0345-thermal-amlogic-add-meson-s4-variant.patch
PATCHFILES += 0346-arm64-meson-add-Amlogic-Meson-GX-PM-Suspend.patch
# s4 videodecoder v4 https://patchwork.kernel.org/project/linux-amlogic/list/?series=1053774
PATCHFILES += 0350-media-dt-bindings-Add-Amlogic-V4L2-video-decoder-v4.patch
PATCHFILES += 0351-decoder-Add-V4L2-stateless-H.264-decoder-driver-v4.patch
PATCHFILES += 0352-media-aml-vdec-6.19-fixups.patch
# only for debugging....
PATCHFILES += 0353-media-aml-vdec-debug-print-first-16b-of-fw-from-amrisc.patch
# dtsi patches
PATCHFILES += 0360-arm64-dtsi-meson-add-support-for-GX-PM-and-Virtual-rtc.patch
PATCHFILES += 0361-arm64-dtsi-meson-s4-Add-USB2-support.patch
PATCHFILES += 0362-arm64-dtsi-amlogic-Add-Amlogic-S4-Audio-v6.patch
PATCHFILES += 0363-arm64-dtsi-amlogic-add-Amlogic-S4-hdmi-audio.patch
PATCHFILES += 0363-arm64-dtsi-meson-gx-increase-dma-pool-to-896MB.patch
PATCHFILES += 0364-arm64-dtsi-meson-g12-increase-dma-pool-to-896MB.patch.patch
PATCHFILES += 0365-arm64-dtsi-amlogic-s4-add-drm-support-v2.patch
PATCHFILES += 0366-arm64-dtsi-amlogic-s4-add-gpu-support.patch
PATCHFILES += 0367-arm64-dtsi-amlogic-sc2-add-initial-dtsi.patch
PATCHFILES += 0368-arm64-dtsi-amlogic-s4-add-cpu_temp_sensor-support.patch
PATCHFILES += 0369-arm64-dtsi-amlogic-Add-video-decoder-driver-support-for-S4-SOCs-v4.patch
PATCHFILES += 0370-arm64-dtsi-amlogic-s4-add-saradc-vrtc-uarta-mmc-clocks-fix.patch
PATCHFILES += 0371-arm64-dtsi-amlogic-s4-hack-stop-thermal-shutdowns.patch
PATCHFILES += 0372-arm64-dtsi-amlogic-s4-add-cpu-dvfs.patch
# cec not works 0373-arm64-dtsi-amlogic-s4-wip-add-cec.patch
# devices dts
PATCHFILES += 0380-arm64-dts-meson-gxm-add-beelink-gt1.patch
PATCHFILES += 0381-arm64-dts-meson-sm1-add-support-for-TX5-plus.patch
PATCHFILES += 0382-arm64-dts-meson-sm1-disable-cvbs-on-meson-sm1-ac2xx-boards.patch
PATCHFILES += 0383-arm64-dts-meson-sm1-disable-cap_highspeed-on-sdcard.patch
PATCHFILES += 0384-arm64-dts-meson-sm1-x96air-add-vfd.patch
PATCHFILES += 0385-arm64-dts-meson-gxl-disable-cvbs-on-meson-gx-p23x-q20x-boards.patch
PATCHFILES += 0386-arm64-dts-amlogic-meson-s4-s805x2-aq222-add-audio.patch
PATCHFILES += 0387-arm64-dts-amlogic-meson-s4-s805x2-aq222-add-drm.patch
PATCHFILES += 0388-arm64-dts-amlogic-meson-s4-add-AP201-Ref-Board.patch
PATCHFILES += 0389-arm64-dts-amlogic-meson-sc2-add-s905x4-ah212-board.patch
PATCHFILES += 0390-arm64-dts-amlogic-meson-s4-add-khadas-vim1s-board.patch
PATCHFILES += 0391-arm64-dts-amlogic-meson-sm1-khadas-vim3l-dec-sd-clk-add-improvements.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Allwinner H6 patches -----------------------------------------
PATCHFILES += 0501-pinctrl-sunxi-add-GPIO-get_direction-callback.patch
PATCHFILES += 0502-rtc-sun6i-Allow-RTC-wakeup-after-shutdown.patch
PATCHFILES += 0503-firmware-arm_scpi-Support-unidirectional-mailbox-cha.patch
PATCHFILES += 0504-revert-stop-exporting-phy_driver_register-unregister-for-ac200.patch
PATCHFILES += 0504-mfd-add-AC200.patch
PATCHFILES += 0505-net-phy-Add-support-for-AC200-EPHY.patch
PATCHFILES += 0506-net-wireless-add-xr819-support-07072021.patch
PATCHFILES += 0510-iommu-sun50i-Allow-page-sizes-multiple-of-4096.patch
# drm patches
PATCHFILES += 0520-drm-sun4i-Add-support-for-DE33-CSC.patch
PATCHFILES += 0521-drm-sun4i-vi_layer-Limit-formats-for-DE33.patch
PATCHFILES += 0522-clk-sunxi-ng-de2-Export-register-regmap-for-DE33.patch
PATCHFILES += 0523-drm-sun4i-Add-planes-driver.patch
PATCHFILES += 0524-drm-sun4i-switch-DE33-to-new-bindings.patch
# various fixes
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
# drm patches
PATCHFILES += 0610-drm-sun4i-Add-H616-TCON-TV-support.patch
PATCHFILES += 0611-srm-sun4i-Add-support-for-H616-HDMI-PHY.patch
PATCHFILES += 0612-drm-sun4i-Add-compatible-for-H616-display-engine.patch
# fix issue on systems with 4G ram
PATCHFILES += 0615-drivers-iommu-sun50i-iommu-fix-iommu-on-h616.patch
# add hdmi audio support
PATCHFILES += 0620-sound-soc-sunxi-add-codec-driver-for-h616.patch
PATCHFILES += 0621-sound-soc-add-sunxi_v2-for-h616-ahub.patch
PATCHFILES += 0623-sound-soc-sunxi-hack-to-fix-oops-on-cards-caps-query.patch
# various additions
PATCHFILES += 0630-net-wireless-add-uwe5622-support-v20231020.patch
PATCHFILES += 0631-clk-sunxi-ng-ccu-sun6i-rtc-fix-32k-clk.patch
PATCHFILES += 0632-clk-sunxi-ng-ccu-hack-fix-too-slow-hdmi-audio.patch
PATCHFILES += 0633-regulator-add-mmc-high-speed-SD-UHS-modes-support.patch
PATCHFILES += 0635-drvers-of-add-dt-overlay-configfs-interface.patch
PATCHFILES += 0636-drv-rtc-sun6i-add-support-rtc-without-external-losc.patch
# dtsi patches
PATCHFILES += 0640-arm64-dtsi-allwinner-h616-Add-display-pipeline.patch
PATCHFILES += 0641-arm64-dtsi-allwinner-h616-Add-hdmi-audio.patch
PATCHFILES += 0642-arm64-dtsi-allwinner-h616.dtsi-add-emac1.patch
PATCHFILES += 0643-arm64-dtsi-allwinner-h616.dtsi-add-cpu-gpu-dvfs-opp.patch
PATCHFILES += 0644-arm64-dtsi-allwinner-h616.dtsi-add-vdec.patch
PATCHFILES += 0647-arm64-dtsi-allwinner-h616.dtsi-fix-x96q-failing-mmc3.patch
PATCHFILES += 0648-arm64-dtsi-allwinner-h616.dtsi-enable-highspeedx-on-mmc0.patch
# dts patches
PATCHFILES += 0664-arm64-dts-allwinner-h616-OrangePI-Zero23-enable-ths-hdmi-audio.patch
PATCHFILES += 0665-arm64-dts-allwinner-h616-add-Tanix-TX6s-TVbox.patch
PATCHFILES += 0666-arm64-dts-allwinner-h616-add-Tanix-TX6s-axp313-TVbox.patch
PATCHFILES += 0667-arm64-dts-allwinner-h313-add-x96q-TVbox.patch
PATCHFILES += 0668-arm64-dts-allwinner-h313-add-x96q-lpddr3-TVbox.patch
PATCHFILES += 0669-arm64-dts-allwinner-h618-add-vontar-h618-TVbox.patch
PATCHFILES += 0670-arm64-dts-allwinner-h618-improve-opi-2w.patch
PATCHFILES += 0671-arm64-dts-allwinner-h313-improve-tanix-tx1.patch
PATCHFILES += 0672-arm64-dts-allwinner-h313-add-x96q-v5.1-TVbox.patch
PATCHFILES += 0673-arm64-dts-allwinner-h616-add-pendoo-x12pro-tvbox.patch
PATCHFILES += 0674-arm64-dts-allwinner-h618-improve-transpeed-8k618-tvbox.patch
PATCHFILES += 0675-arm64-dts-allwinner-h313-h616-h618-add-cpu-overclock-via-overlays.patch
PATCHFILES += 0676-arm64-dts-allwinner-h313-h616-h618-add-gpu-overclock-via-overlays.patch
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
PATCHFILES += 0801-net-wireless-backport-aic8800-sdio-v2025_0926_91c9dae5-mm2.patch
PATCHFILES += 0803-net-wireless-backport-aic8800-usb-v2025_0926_91c9dae5-mm2.patch
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
PATCHFILES += 0900-rpi-vc04_services-sync-to-downstream-04022026.patch
PATCHFILES += 0901-media-add-rpi4-v4l2m2m-decoder.patch
PATCHFILES += 0902-media-add-rpivid-driver.patch
PATCHFILES += 0903-nvmem-raspberrypi-add-nvmem-driver-for-accessing-OTP.patch
PATCHFILES += 0904-dmaengine-add-support-for-BCM2708.patch
PATCHFILES += 0905-media-ioctl-add-pixel-formats-NV12MT_COL128-and-NV12.patch
PATCHFILES += 0906-media-v4l2-add-single-planar-NV12-column-formats.patch
PATCHFILES += 0907-drm-increase-plane_mask-to-64bit.patch
PATCHFILES += 0908-char-add-vc_mem-driver-for-querying-firmware.patch
PATCHFILES += 0909-clk-bcm-changes-to-get-rpi4-v4l2m2m-working.patch
# add rpi5 rp1 support
PATCHFILES += 0932-drivers-pci-add-rp1-support.patch
PATCHFILES += 0933-drivers-clk-add-rp1-support.patch
PATCHFILES += 0934-drivers-pinctrl-add-rp1-support.patch
PATCHFILES += 0935-drivers-dma-add-rp1-support.patch
PATCHFILES += 0936-drivers-irqchip-add-rp1-support.patch
PATCHFILES += 0937-drivers-phy-add-rp1-support.patch
PATCHFILES += 0938-drivers-mfd-add-rp1-support.patch
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
PATCHFILES += 0949-drm-vc4-hdmi-hack-for-rpi4-rpi5-audio.patch
# device-tree patches
PATCHFILES += 0970-arm64-dts-brcm-rpi4-set-led-to-disk-activity-mmc0-alias.patch
PATCHFILES += 0971-arm64-dts-brcm-rpi5-add-rp1-usb-eth-pwm.patch
PATCHFILES += 0972-arm64-dts-brcm-rpi5-fix-hdmi-audio.patch
PATCHFILES += 0973-arm64-dts-brcm-rpi5-add-v3d.patch
PATCHFILES += 0974-arm64-dts-brcm-rpi4-add-rpivid.patch
PATCHFILES += 0975-arm64-dts-brcm-rpi5-add-rpivid.patch
PATCHFILES += 0977-arm64-dts-brcm-rpi5-incr-cma-to-384M.patch
PATCHFILES += 0978-arm64-dts-brcm-rpi5-add-fan-support.patch
PATCHFILES += 0979-arm64-dts-brcm-rpi4-incr-cma-to-384M.patch
PATCHFILES += 0980-arm64-dts-brcm-rpi5-add-wifi-bt-support.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Rockchip 3588 patches -----------------------------------------
# based on https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commits/rockchip-devel 2.02.2026
# misc fixes
PATCHFILES += 1000-math.h-add-DIV_ROUND_UP_NO_OVERFLOW.patch
PATCHFILES += 1001-clk-divider-Fix-divisor-masking-on-64-bit-platforms.patch
PATCHFILES += 1002-clk-composite-replace-open-coded-abs_diff.patch
PATCHFILES += 1003-phy-rockchip-inno-usb2-add-soft-vbusvalid-control.patch
PATCHFILES += 1004-mfd-rk8xx-Fix-shutdown-handler.patch
PATCHFILES += 1005-net-ethernet-add-yt6801-gige-pcie-controller.patch
PATCHFILES += 1006-net-phy-realtek-Reset-after-clock-enable.patch
PATCHFILES += 1007-net-phy-realtek-re-init-after-reset.patch
PATCHFILES += 1008-MERGED-mmc-dw_mmc-rockchip-Fix-runtime-PM-support-fo.patch
PATCHFILES += 1009-mmc-sdhci-of-dwcmshc-Reduce-clock-reduction-print-le.patch
# pci improvements
PATCHFILES += 1010-PCI-dw-rockchip-Rename-rockchip_pcie_get_ltssm-funct.patch
PATCHFILES += 1011-PCI-dw-rockchip-Support-get_ltssm-operation.patch
PATCHFILES += 1012-Revert-PCI-dw-rockchip-Simplify-regulator-setup-with.patch
PATCHFILES += 1013-PCI-dw-rockchip-Move-devm_phy_get-out-of-phy_init.patch
PATCHFILES += 1014-PCI-dw-rockchip-Add-helper-function-for-enhanced-LTS.patch
PATCHFILES += 1015-PCI-dw-rockchip-Add-helper-function-for-controller-m.patch
PATCHFILES += 1016-PCI-dw-rockchip-Add-helper-function-for-DDL-indicato.patch
PATCHFILES += 1017-PCI-dw-rockchip-Add-pme_turn_off-support.patch
PATCHFILES += 1018-PCI-dw-rockchip-Add-system-PM-support.patch
PATCHFILES += 1019-PCI-host-common-Add-an-API-to-check-for-any-device-u.patch
PATCHFILES += 1020-PCI-qcom-Check-for-the-presence-of-a-device-instead-.patch
PATCHFILES += 1021-PCI-dwc-Check-for-the-device-presence-during-suspend.patch
PATCHFILES += 1022-PCI-dw-rockchip-Fix-LTSSM-set-functions.patch
PATCHFILES += 1023-WIP-PCI-dw-rockchip-port-some-suspend-code-from-vend.patch
PATCHFILES += 1024-PCI-dw-rockchip-Add-phy_calibrate-to-check-PHY-lock-.patch
PATCHFILES += 1025-phy-rockchip-snps-pcie3-Add-phy_calibrate-support.patch
PATCHFILES += 1026-phy-rockchip-snps-pcie3-Increase-sram-init-timeout.patch
PATCHFILES += 1027-phy-rockchip-snps-pcie3-Check-more-sram-init-status-.patch
PATCHFILES += 1028-phy-rockchip-snps-pcie3-Only-check-PHY1-status-when-.patch
# drm improvements
PATCHFILES += 1030-MERGED-phy-hdmi-Add-HDMI-2.1-FRL-configuration-optio.patch
PATCHFILES += 1030-MERGED-phy-rockchip-samsung-hdptx-Use-usleep_range-i.patch
PATCHFILES += 1030-MERGED-phy-rockchip-samsung-hdptx-Fix-coding-style-a.patch
PATCHFILES += 1030-MERGED-phy-rockchip-samsung-hdptx-Consistently-use-r.patch
PATCHFILES += 1030-MERGED-phy-rockchip-samsung-hdptx-Enable-lane-output.patch
PATCHFILES += 1030-MERGED-phy-rockchip-samsung-hdptx-Cleanup-_cmn_init_.patch
PATCHFILES += 1030-MERGED-phy-rockchip-samsung-hdptx-Compute-clk-rate-f.patch
PATCHFILES += 1030-MERGED-phy-rockchip-samsung-hdptx-Drop-hw_rate-drive.patch
PATCHFILES += 1030-MERGED-phy-rockchip-samsung-hdptx-Switch-to-driver-s.patch
PATCHFILES += 1030-MERGED-phy-rockchip-samsung-hdptx-Extend-rk_hdptx_ph.patch
PATCHFILES += 1030-MERGED-phy-rockchip-samsung-hdptx-Add-HDMI-2.1-FRL-s.patch
PATCHFILES += 1031-drm-Add-CRTC-background-color-property.patch
PATCHFILES += 1032-drm-rockchip-vop2-Support-setting-custom-background-.patch
PATCHFILES += 1033-WIP-YUV420-drm-rockchip-vop2-Add-YUV420-output-forma.patch
PATCHFILES += 1034-WIP-FRL-drm-connector-hdmi-Handle-FRL-in-hdmi_clock_.patch
PATCHFILES += 1035-WIP-FRL-drm-rockchip-vop2-Add-HDMI-2.1-FRL-support.patch
PATCHFILES += 1036-MERGED-drm-rockchip-vop2-Switch-impossible-format-co.patch
PATCHFILES += 1036-MERGED-drm-rockchip-vop2-Switch-impossible-pos-condi.patch
PATCHFILES += 1036-MERGED-drm-rockchip-vop2-Fix-Esmart-test-condition.patch
PATCHFILES += 1036-MERGED-drm-rockchip-vop2-Enforce-scaling-workaround-.patch
PATCHFILES += 1036-MERGED-drm-rockchip-vop2-Enforce-AFBC-source-alignme.patch
PATCHFILES += 1036-MERGED-drm-rockchip-vop2-Enforce-AFBC-transform-stri.patch
PATCHFILES += 1036-MERGED-drm-rockchip-vop2-Use-drm_is_afbc-helper-func.patch
PATCHFILES += 1036-MERGED-drm-rockchip-vop2-Simplify-format_mod_support.patch
PATCHFILES += 1037-drm-bridge-synopsys-dw-dp-Set-pixel-mode-by-platform.patch
PATCHFILES += 1038-drm-bridge-synopsys-dw-dp-Make-i2s-spdif-clk-optiona.patch
PATCHFILES += 1039-drm-rockchip-dw_dp-Add-DisplayPort-support-for-rk357.patch
PATCHFILES += 1040-FROM-UPSTREAM-drm-bridge-dw-hdmi-qp-Add-support-for-.patch
PATCHFILES += 1041-drm-bridge-Add-detect_ctx-hook-and-drm_bridge_detect.patch
PATCHFILES += 1042-drm-bridge-connector-Switch-to-using-detect_ctx-hook.patch
PATCHFILES += 1043-drm-bridge-dw-hdmi-qp-Add-high-TMDS-clock-ratio-and-.patch
PATCHFILES += 1044-drm-rockchip-dw_hdmi_qp-Do-not-send-HPD-events-for-a.patch
PATCHFILES += 1045-WIP-YUV420-drm-rockchip-dw_hdmi_qp-Add-YUV420-output.patch
PATCHFILES += 1046-WIP-FRL-drm-bridge-dw-hdmi-qp-Add-HDMI-2.1-FRL-suppo.patch
PATCHFILES += 1047-WIP-FRL-drm-rockchip-dw_hdmi_qp-Add-HDMI-2.1-FRL-sup.patch
PATCHFILES += 1048-MERGED-drm-rockchip-dw_hdmi_qp-Fix-RK3576-HPD-interr.patch
PATCHFILES += 1048-MERGED-drm-rockchip-dw_hdmi_qp-Optimize-RK3588-HPD-i.patch
PATCHFILES += 1049-drm-rockchip-vop2-Add-mode-valid-callback-for-crtc.patch
PATCHFILES += 1050-drm-bridge-dw-hdmi-qp-fix-multi-channel-audio-output.patch
PATCHFILES += 1051-drm-rockchip-dw_dp-Switch-to-drmm_kzalloc.patch
PATCHFILES += 1052-drm-rockchip-dw_dp-Fix-null-ptr-deref-in-dw_dp_remov.patch
PATCHFILES += 1053-drm-rockchip-dw_hdmi_qp-Switch-to-drmm_encoder_init.patch
PATCHFILES += 1054-drm-rockchip-vop2-Add-clock-resets-support.patch
PATCHFILES += 1055-drm-rockchip-vop2-Add-core-reset-support.patch
# make kodi workig ok
PATCHFILES += 1056-drm-rockchip-vop2-rk3588-reorder-wins-fix-kodi-playback-in-drm-planes.patch
# fix for swiotlb buffer is full
PATCHFILES += 1057-drm-rockchip-set-dma-mask-to-64-bit.patch
# add iommu for av1 decoser
PATCHFILES += 1059-iommu-Add-verisilicon-IOMMU-driver.patch
# extar controls for hevc decoder
PATCHFILES += 1060-MERGED-media-uapi-HEVC-Add-v4l2_ctrl_hevc_ext_sps_-l.patch
PATCHFILES += 1061-MERGED-media-v4l2-ctrls-Add-hevc_ext_sps_-ls-t_rps-c.patch
# https://gitlab.collabora.com/detlev/linux/-/commits/add-vdpu381-and-383-to-rkvdec-v9 20.01.2026
PATCHFILES += 1062-media-rockchip-rkvdec-add-vdpu381-and-383-to-rkvdec-add-v9-20012026.patch
# add vp9 decoding on rkvdec2
PATCHFILES += 1063-media-rockchip-rkvdec-vdpu381-add-vp9-support-v9.patch
# fix h264 playback in chromium
PATCHFILES += 1064-media-rkvdec-remove-vb2_is_busy-check-in-rkvdec_s_ct.patch
# fix av1 hw decode seen e.g. on clapper
PATCHFILES += 1065-media-verisilicon-AV1-fix-enable-cdef-computation.patch
# some avi fixes
PATCHFILES += 1066-media-verisilicon-AV1-Set-IDR-flag-for-intra_only-fr.patch
# fix from armbian for initialize h264 frame_mbs_only_flag as 1
PATCHFILES += 1067-media-v4l2-core-Initialize-h264-frame_mbs_only_flag-as-1.patch
# some avi fixes
PATCHFILES += 1068-media-verisilicon-AV1-Restore-IOMMU-context-before-d.patch
PATCHFILES += 1069-media-verisilicon-AV1-Fix-tile-info-buffer-size.patch
# add khadas edge2 support in khadas-mcu
PATCHFILES += 1070-mfd-khadas-mcu-add-edge2-support.patch
# dtsi additions
PATCHFILES += 1080-arm64-dtsi-rk3588s-add-vop2-clock-resets.patch
PATCHFILES += 1082-arm64-dtsi-rockchip-add-the-vdpu381-video-decoders.patch
PATCHFILES += 1083-arm64-dtsi-rockchip-rk3288-add-vdec-node.patch
PATCHFILES += 1084-arm64-dtsi-rockchip-rk356x-add-rkvdec2-video-decoder-nodes.patch
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
PATCHFILES += 1098-arm64-dts-rockchip-rk3588-khadas-edge2-dts-improvements.patch
# for testing rkvdec h264
# PATCHFILES += 1099-arm64-dtsi-rockchip-disable-vpu121.patch
#------------------------------------------------------------
endif

ifeq (1,1)
#-- Allwinner A523/T527/H728 --------------------------------
PATCHFILES += 1101-axp20x-HACK-mfd-and-multiple-axp-on-the-bus.patch
PATCHFILES += 1104-regulator-axp20x-force-polyphase-setup-for-axp323.patch
PATCHFILES += 1141-thermal-drivers-sun8i-add-initial-support-for-ths-v2.patch
PATCHFILES += 1142-add-initial-cpufreq-support.patch
PATCHFILES += 1146-net-drivers-stmmac-add-25M-phy-clock-support.patch
# dtsi additions
PATCHFILES += 1151-arm64-dtsi-allwinner-add-gmac1-fixup-gmac0-in-a523.patch
PATCHFILES += 1153-arm64-dtsi-allwinner-add-ths-support-v2.patch
PATCHFILES += 1154-arm64-dtsi-allwinner-add-cpufreq-support.patch
# boards additions
PATCHFILES += 1170-arm64-dts-allwinner-h728-x96q-pro-plus-improvements.patch
PATCHFILES += 1172-arm64-dts-allwinner-t527-orangepi-4a-dts-improvements.patch
PATCHFILES += 1173-arm64-dts-allwinner-a527-Radxa-A5E-improvements.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Rockchip 3576 patches -----------------------------------------
# misc fixes
PATCHFILES += 1200-MERGED-soc-rockchip-grf-Fix-wrong-RK3576_IOCGRF_MISC.patch
PATCHFILES += 1201-MERGED-soc-rockchip-grf-Support-multiple-grf-to-be-h.patch
PATCHFILES += 1214-mmc-core-add-force-io-to-1.8v-quirk.patch
# dtsi additions
PATCHFILES += 1261-arm64-dtsi-rockchip-add-the-vdpu383-video-decoder.patch
# bards dt additions/patches
PATCHFILES += 1280-arm64-dts-add-nanopi-m5-dts-improvements.patch
PATCHFILES += 1281-arm64-dts-rock4d-improvements.patch
PATCHFILES += 1282-arm64-dts-add-rk3576-nanopi-r76s-dt.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Qualcomm 6490 patches -----------------------------------
PATCHFILES += 1310-soc-qcom-geni-se-Add-MODULE_FIRMWARE-macro.patch
PATCHFILES += 1311-soc-qcom-rpmh-Add-support-to-read-back-resource-sett.patch
PATCHFILES += 1312-remoteproc-core-Allow-auto-retry-of-rproc_start.patch
PATCHFILES += 1315-phy-qcom-qmp-combo-temporarily-fix-the-orientation-t.patch
PATCHFILES += 1316-regulator-qcom-rpmh-Add-support-to-read-regulator-se.patch
PATCHFILES += 1317-firmware-psci-Read-and-use-vendor-reset-types.patch
PATCHFILES += 1318-drm-birdge-simple-bridge-Add-support-for-radxa-ra620.patch
PATCHFILES += 1319-drm-msm-dpu-Add-missing-caps-and-blocks-to-sc7280-ca.patch
PATCHFILES += 1320-drm-panel-Add-support-for-Orise-Tech-OTA7290B-DSI-Pa.patch
PATCHFILES += 1321-drm-display-add-hw_params-callback-function-to-drm_c.patch
PATCHFILES += 1322-drm-gpu-fix-4K-30-fps.patch
PATCHFILES += 1330-phy-qcom-qmp-ufs-Fix-HS-G4-PHY-init-table-for-sc7280.patch
PATCHFILES += 1331-scsi-ufs-qcom-temporarily-force-to-rate-A.patch
PATCHFILES += 1332-scsi-ufs-qcom-Add-support-for-UFS-module-detection.patch
PATCHFILES += 1333-spi-spi-qcom-qspi-Add-support-for-polling.patch
# PATCHFILES += 1334-media-iris-port-support-for-Qualcomm-SC7280-v6.patch
# dts additions
PATCHFILES += 1350-arm64-dts-qcom-qcs6490-audioreach-Modify-LPASS-macro.patch
PATCHFILES += 1351-arm64-dts-qcom-sc7280-add-OPP-table-support-to-PCIe-.patch
PATCHFILES += 1352-arm64-dts-qcom-sc7280-Add-cci-aliases.patch
PATCHFILES += 1353-arm64-dts-qcom-sc7280-Add-psci-label.patch
# board dts additions
PATCHFILES += 1370-arm64-dts-qcom-improve-support-for-radxa-dragon-q6a.patch
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
	 echo -n "Done! Press <Enter> to exit ... "; read

defconfig: configure
	@$(CONFIGURE_ENV) $(MAKE) $(CONFIGURE_ARGS) -C $(WORKSRC) savedefconfig
	@mv $(WORKSRC)/defconfig $(CONFIGFILE).defconfig; \
	 echo "defconfig saved as $(CONFIGFILE).defconfig in package dir ... "; \
	 echo -n "Done! Press <Enter> to exit ... "; read

diffconfig: configure
	@cd $(WORKSRC); \
	 if [ -e .config.old ]; then \
	   $(PYTHON3) scripts/diffconfig .config.old .config > ../../../$(CONFIGFILE).diff; cat ../../../$(CONFIGFILE).diff; \
	 else \
	   echo -n "No old .config found to compare. Run first 'make menuconfig' or 'make mergeconfig' ... "; \
	 fi; \
	 echo -n "Done! Press <Enter> to exit ... "; read

mergeconfig: configure
	@export ARCH=$(GARCH_FAMILY); \
	 cd $(WORKSRC); \
	 if [ -e ../../../config.fragment ]; then \
	   cp -f .config config.old; scripts/kconfig/merge_config.sh .config ../../../config.fragment; \
	   cp -f ./files/$(CONFIGFILE) $(CONFIGFILE).before.mergeconfig; \
	   echo "merged .config saved as $(CONFIGFILE) in package/files dir ... "; \
	   cp -f .config ../../../$(CONFIGFILE).after.mergeconfig; \
	    echo "merged config saved in: tree root as .config and also as $(CONFIGFILE).after.mergeconfig in package dir ... "; \
	 else \
	   echo -n "No config.fragment found to merge. Provide it before running 'make mergeconfig' ... "; \
	 fi; \
	 echo -n "Done! Press <Enter> to exit ... "; read
