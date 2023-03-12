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

PATCHFILES  = linux-6.2.patch.gar
PATCHFILES += linux-6.2-perl.patch.gar
PATCHFILES += linux-6.2-defaults.patch

ifeq (1,1)

PATCHFILES += 0105-drivers-led-add-openvfd-1.4.2.patch

ifeq (1,1)
# Misc panfrost patches for 6.2 kernel
PATCHFILES += 0109-drm-panfrost-add-support-for-custom-soft-reset-on-GXM.patch
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
PATCHFILES += 0328-media-meson-vdec-remove-redundant-if-sta.patch
PATCHFILES += 0329-media-meson-vdec-esparser-check-parsing-.patch
PATCHFILES += 0330-media-meson-vdec-implement-10bit-bitstre.patch
PATCHFILES += 0331-media-meson-vdec-add-HEVC-decode-codec.patch
PATCHFILES += 0332-media-meson-vdec-disable-MPEG1-MPEG2-hardware-de.patch
PATCHFILES += 0341-arm64-meson-add-Amlogic-Meson-GX-PM-Suspend.patch
PATCHFILES += 0342-arm64-dts-meson-add-support-for-GX-PM-and-Virtu.patch
PATCHFILES += 0361-arm64-dts-meson-gxm-add-beelink-gt1.patch
# add support for Tanix TX5 Plus tvbox
PATCHFILES += 0371-arm64-dts-meson-sm1-add-support-for-TX5-plus.patch
# Add more GX soundcards
# https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=320553
PATCHFILES += 0373-arm64-dts-meson-add-more-GX-soundcards.patch
# Add more G12/SM1 soundcards
# https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=320731
PATCHFILES += 0374-arm64-dts-meson-add-more-G12-SM1-soundcards.patch
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
PATCHFILES += 0509-Input-axp20x-pek-allow-wakeup-after-shutdown.patch
# https://github.com/jernejsk/linux-1/commits/hevc-10
PATCHFILES += 0523-drm-sun4i-dw-hdmi-revert-Fix-ddc-en-GPIO-consumer.patch
PATCHFILES += 0524-arm64-dts-allwinner-h6-Fix-Cedrus-IOMMU-again.patch
PATCHFILES += 0531-iommu-sun50i-Allow-page-sizes-multiple-of-4096.patch
PATCHFILES += 0534-media-cedrus-Don-t-CPU-map-source-buffers.patch
# vc1 decoding support https://github.com/jernejsk/linux-1/commits/vc1 01.12.2022
PATCHFILES += 0548-media-cedrus-add-vc1-decoding-support.patch
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
PATCHFILES += 0573-mmc-sunxi-fix-unusuable-eMMC-on-some-H6-boards-by-di.patch
PATCHFILES += 0574-drm-sun4i-mixer-Add-caching-support.patch
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
PATCHFILES += 0591-net-wireless-rtw88-sync-wireless-next-20230310.patch
# https://patchwork.kernel.org/project/linux-wireless/list/?series=728886
PATCHFILES += 0592-net-wireless-rtw88-add-SDIO-support-v2.patch
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
PATCHFILES += 0610-sound-soc-add-h616-audio-support.patch
PATCHFILES += 0611-hack-hack-drivers-add-h616-hdmi.patch
PATCHFILES += 0612-gpu-drm-panfrost-panfrost-devfreq-revert-set-opp-to-the-recommended.patch
# enable some h616 boards
PATCHFILES += 0630-arm64-dts-allwinner-h616.dtsi-add-ths-audio-hdmi.patch
PATCHFILES += 0631-arm64-dts-allwinner-h616-OrangePI-Zero2-enable-ths-hdmi-audio.patch
PATCHFILES += 0632-arm64-dts-allwinner-h616-X96-mate-enable-ths-hdmi-usb.patch
PATCHFILES += 0633-arm64-dts-allwinner-h616-add-Tanix-TX6s-TVbox.patch
PATCHFILES += 0634-arm64-dts-allwinner-h616-add-T95-TVbox.patch
PATCHFILES += 0635-arm64-dts-allwinner-h616-OrangePI-Zero2-fix-hdmi-audio.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Rockchip 33x patches -----------------------------------------
PATCHFILES += 0705-rockchip-from-list.patch
PATCHFILES += 0720-drm-from-list.patch
PATCHFILES += 0730-drm-rockchip.patch
PATCHFILES += 0731-v4l2-rockchip.patch
PATCHFILES += 0732-for-libreelec.patch
PATCHFILES += 0733-drm-rockchip-fix-non-working-cec-after-power-cycle.patch
# https://patchwork.kernel.org/project/linux-rockchip/list/?series=711300
PATCHFILES += 0741-media-staging-add-rkvdec-hevc-driver-v2.patch
PATCHFILES += 0742-v4l2-wip-iep-driver.patch
PATCHFILES += 0743-arm64-dts-rockchip-beelink-a1-enable-openvfd.patch
PATCHFILES += 0744-devfreq-rockchip-add-devfreq-driver-for-rk3328-dmc.patch
PATCHFILES += 0745-arm64-dts-rockchip-beelink-a1-enable-androind-dram-timmings.patch
PATCHFILES += 0746-arm64-dts-rockchip-beelink-a1-bump-cpu-gpu-freqs.patch
PATCHFILES += 0747-arm64-dts-rockchip-add-enable-dmc-on-roc-cc.patch
# https://patchwork.kernel.org/project/linux-rockchip/list/?series=385165&archive=both
PATCHFILES += 0749-phy-rockchip-phy-add-rockchip-inno-usb3.patch
PATCHFILES += 0750-arm64-dts-rockchip-enable-inno-usb3-beelinkA1-roc-cc.patch
PATCHFILES += 0751-arm64-dts-rockchip-rk33xx-set-userled-to-mmc.patch
PATCHFILES += 0752-arm64-dts-rockchip-rk3399-add-radxa-rockpi-4se.patch
PATCHFILES += 0753-arm64-dts-rockchip-rk3399-radxa-rockpi-bc-remove-wifi-compatible.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Rockchip 356x patches -----------------------------------------
# Enable rk356x PCIe controller
# https://patchwork.kernel.org/project/linux-rockchip/list/?series=634925
PATCHFILES += 0800-Enable-rk356x-PCIe-controller.patch
# https://patchwork.kernel.org/project/linux-rockchip/list/?series=710722
PATCHFILES += 0802-Fix-HDMI-CEC-on-Radxa-ROCK-3-Model-A.patch
# various boards enablement
PATCHFILES += 0831-arm64-dts-rockchip-enable-usb2-usb3-sata-audio-in-rk35xx.dtsi.patch
PATCHFILES += 0833-arm64-dts-rockchip-enable-Quartz64-A-usb2-usb3-pcie-audio.patch
PATCHFILES += 0836-arm64-dts-rockchip-add-dts-for-x96-x6.patch
PATCHFILES += 0840-arm64-dts-rockchip-add-dts-for-rock3b.patch
PATCHFILES += 0841-arm64-dts-rockchip-increas-alarm-cpu-temp-to-85.patch
PATCHFILES += 0842-arm64-dts-rockchip-Quartz64-B-fix-Eth-enable-hdmi-audio.patch
PATCHFILES += 0843-arm64-dts-rockchip-rock3a-fix-mdio-reset-disable-uart-bt.patch
PATCHFILES += 0845-arm64-dts-rockchip-add-dts-for-rock3c.patch
PATCHFILES += 0846-arm64-dts-rockchip-rk35xx-set-userled-to-mmc.patch
PATCHFILES += 0847-arm64-dts-rockchip-add-dts-for-urve-pi.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- RaspberryPI patches -----------------------------------------
# Hack for adding H264 v4l2 decoding on RPI
PATCHFILES += 0900-rpi-vc04_services-add_h~l2-m2m_decode-04092022.patch
PATCHFILES += 0901-rpi-vc04_services-bcm2835-codec-remove-isp-formats.patch
# add H265 rpivid driver
PATCHFILES += 0904-media-add-rpivid-driver.patch
PATCHFILES += 0905-arm64-dts-brcm-set-userled-to-mmc.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Rockchip 3588 patches -----------------------------------------
# basic enablement
PATCHFILES += 1001-dt-bindings-soc-rockchip-add-initial-rk3588-syscon-c.patch
PATCHFILES += 1002-arm64-dts-rockchip-Add-rk3588-pinctrl-data.patch
PATCHFILES += 1003-arm64-dts-rockchip-Add-base-DT-for-rk3588-SoC.patch
PATCHFILES += 1004-dt-bindings-arm-rockchip-add-initial-rk3588-boards.patch
PATCHFILES += 1005-arm64-dts-rockchip-Add-rk3588-evb1-board.patch
PATCHFILES += 1006-arm64-dts-rockchip-Add-rock-5a-board.patch
PATCHFILES += 1007-arm64-dts-rockchip-Add-rock-5b-board.patch
PATCHFILES += 1008-clk-RK808-reduce-struct-rk808-usage.patch
# add pmic support
PATCHFILES += 1009-mfd-rk808-convert-to-device-managed-resources.patch
PATCHFILES += 1010-mfd-rk808-use-dev_err_probe.patch
PATCHFILES += 1011-mfd-rk808-replace-struct-i2c_client-with-struct-devi.patch
PATCHFILES += 1012-mfd-rk808-split-into-core-and-i2c.patch
PATCHFILES += 1013-mfd-rk8xx-i2c-use-device_get_match_data.patch
PATCHFILES += 1014-dt-bindings-mfd-add-rk806-binding.patch
PATCHFILES += 1015-mfd-rk8xx-add-rk806-support.patch
PATCHFILES += 1016-pinctrl-rk805-add-rk806-pinctrl-support.patch
PATCHFILES += 1017-regulator-expose-regulator_find_closest_bigger.patch
PATCHFILES += 1018-regulator-rk808-add-rk806-support.patch
PATCHFILES += 1019-regulator-add-rk860x-support.patch
PATCHFILES += 1020-arm64-dts-rockchip-rk3588-add-pmic-design-variants.patch
# add ths support
PATCHFILES += 1021-thermal-rockchip-Simplify-getting-match-data.patch
PATCHFILES += 1022-thermal-rockchip-Simplify-clock-logic.patch
PATCHFILES += 1023-thermal-rockchip-Use-dev_err_probe.patch
PATCHFILES += 1024-thermal-rockchip-Simplify-channel-id-logic.patch
PATCHFILES += 1025-thermal-rockchip-Support-dynamic-sized-sensor-array.patch
PATCHFILES += 1026-thermal-rockchip-Support-RK3588-SoC-in-the-thermal-d.patch
# add cpu freq
PATCHFILES += 1027-cpufreq-rockchip-Introduce-driver-for-rk3588.patch
PATCHFILES += 1028-dt-bindings-rockchip-thermal-Support-the-RK3588-SoC-.patch
PATCHFILES += 1029-arm64-dts-rockchip-rk3588-add-cpu-frequency-scaling-.patch
PATCHFILES += 1030-arm64-dts-rockchip-enable-cpu-freq-scalling-evb1.patch
PATCHFILES += 1031-arm64-dts-rockchip-enable-cpu-freq-scalling-rock5x.patch
# add mmc support
PATCHFILES += 1033-dt-bindings-mmc-rockchip-dw-mshc-Add-RK3588-compatib.patch
PATCHFILES += 1034-arm64-dts-rockchip-rk3588-Add-sdmmc-node.patch
PATCHFILES += 1035-arm64-dts-rockchip-Add-support-for-SD-card-for-Rock5x.patch
PATCHFILES += 1036-arm64-dts-rockchip-Add-support-user-led-Rock5a-5b.patch
# add pcie support
PATCHFILES += 1040-phy-rockchip-add-RK3588-combphy-support.patch
PATCHFILES += 1041-phy-rockchip-support-multiple-PCIe-3.0-lanes-on-RK35.patch
PATCHFILES += 1042-irqchip-gic-v3-add-hackaround-for-rk3568-its.patch
PATCHFILES += 1043-arm64-dts-rockchip-rk3588-add-pcie-controllers.patch
PATCHFILES += 1045-arm64-dts-rockchip-enable-pcie-rock5x.patch
# add usb support
PATCHFILES += 1050-rockchip-add-SoC-headers-from-downstream-kernel.patch
PATCHFILES += 1051-phy-rockchip-inno-usb2-update-from-downstream-kernel.patch
PATCHFILES += 1052-arm64-dts-rockchip-rk3588-enable-usb2.patch
PATCHFILES += 1054-arm64-dts-rockchip-enable-usb2-rock5x.patch
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
	@$(MAKECOOKIE)
else
ifeq ($(GARCH),armv8)
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image.gz > $(DESTDIR)$(LINUX_DIR)/Image.gz
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image    > $(DESTDIR)$(LINUX_DIR)/Image
	@$(build_DESTDIR)$(build_bindir)/mkimage -A arm64 -O linux -T kernel -C none -a 0x1080000 -e 0x1080000 -n linux-next -d $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image $(DESTDIR)$(LINUX_DIR)/uImage
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) dtbs_install
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

