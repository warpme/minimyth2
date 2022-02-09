ifeq (1,1)
#--Use this for mainline official x.y.z kernel from SCM----
MASTER_SITES        = https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/snapshot/
DISTFILES           = $(DISTNAME).tar.gz $(CONFIGFILE)
WORKSRC             = $(WORKDIR)/linux-$(LINUX_VERSION)
#----------------------------------------------------------
endif

ifeq (0,1)
#--Use this for mainline official x.y.z kernel from GIT----
MASTER_SITES       += https://github.com/torvalds/linux/archive/
DISTFILES           = v$(LINUX_VERSION).tar.gz $(CONFIGFILE)
WORKSRC             = $(WORKDIR)/linux-$(LINUX_VERSION)
#----------------------------------------------------------
endif

ifeq (0,1)
#--Use this for mainline git-commit kernel-----------------
MASTER_SITES        = https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/snapshot/
DISTFILES           = $(GITHASH).tar.gz $(CONFIGFILE)
WORKSRC             = $(WORKDIR)/$(GITHASH)
#----------------------------------------------------------
endif

ifeq (0,1)
#--Use this for apritzel h616 repo kernel-----------------
MASTER_SITES        = https://github.com/apritzel/linux/archive/
GITHASH             = 319c938735b9c1726de3b7e09c20637fad2a0960
DISTFILES           = $(GITHASH).zip $(CONFIGFILE)
WORKSRC             = $(WORKDIR)/linux-$(GITHASH)
#----------------------------------------------------------
endif

GARNAME = linux
GARVERSION = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),$(if $(filter-out 0,$(LINUX_TEENY_VERSION)),.$(LINUX_TEENY_VERSION)))$(LINUX_EXTRA_VERSION)
CATEGORIES = kernel-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)

CONFIGFILE = linux-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)-$(GARCH_FAMILY)-$(GARCH).config

PATCHFILES  = linux-5.17.patch.gar
PATCHFILES += linux-5.17-perl.patch.gar
PATCHFILES += linux-5.17-defaults.patch
PATCHFILES += linux-5.17-vgaarb-add-3D-accell-detection.patch

ifeq (1,1)

# Add hevc v4l2_request crtl fields used by Allwinner/Rockchip/Broadcom
PATCHFILES += 0101-include-media-hevc-uapi-add-aw-rk-brcm-fields.patch

ifeq (1,1)
# Misc panfrost patches for 5.17 kernel
PATCHFILES += 0102-drm-panfrost-add-support-for-custom-soft-reset-on-GXM.patch
PATCHFILES += 0110-drivers-net-wireless-brcmfmac-add-ap6330-firmware.patch
endif

ifeq (1,1)
# Switch GPU DVFS governors default as 'performance'
PATCHFILES += 0125-drm-lima-dvfs-switch-gov-to-performance.patch
PATCHFILES += 0126-drm-panfrost-dvfs-switch-gov-to-performance.patch
endif

#PATCHFILES += 0130-net-wireless-add-rtw88-20220114.patch

ifeq (1,1)
#-- Amlogic patches -----------------------------------------
# increas CMA pool for 4k decode
PATCHFILES += 0311-arm64-dts-meson-set-dma-pool-to-896MB.patch
PATCHFILES += 0312-g12-set-cma-to-896MiB-for-4k.patch
# add hevc & 10bit decode support
PATCHFILES += 0315-meson-vdec-remove-redundant-if-statement.patch
PATCHFILES += 0316-meson-vdec-improve-mmu-and-fbc-handling-.patch
PATCHFILES += 0317-meson-vdec-add-HEVC-decode-codec.patch
PATCHFILES += 0318-meson-vdec-add-handling-to-HEVC-decoder-.patch
PATCHFILES += 0319-meson-vdec-add-HEVC-support-to-GXBB.patch
PATCHFILES += 0320-meson-vdec-check-if-parser-has-really-pa.patch
# Amlogic: Misc patches
PATCHFILES += 0331-arm64-meson-add-Amlogic-Meson-GX-PM-Suspend.patch
PATCHFILES += 0332-arm64-dts-meson-add-support-for-GX-PM-and-Virtu.patch
PATCHFILES += 0360-arm64-dts-meson-tanix-tx3-add-thermal-zones.patch
PATCHFILES += 0361-arm64-dts-meson-gxm-add-beelink-gt1.patch
PATCHFILES += 0367-arm64-dts-meson-sm1-add-common-ac2xx-dtsi.patch
PATCHFILES += 0368-arm64-dts-meson-sm1-add-support-for-X96-AIR.patch
PATCHFILES += 0369-arm64-dts-meson-sm1-add-support-for-CYX-A95XF3-AIR.patch
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
# patches from LE 5.09.2021
PATCHFILES += 0500-clk-Implement-protected-clocks-for-all-OF-clock-prov.patch
PATCHFILES += 0501-Revert-clk-qcom-Support-protected-clocks-property.patch
PATCHFILES += 0502-arm64-dts-allwinner-h6-Protect-SCP-clock.patch
PATCHFILES += 0503-rtc-sun6i-Allow-RTC-wakeup-after-shutdown.patch
PATCHFILES += 0504-firmware-arm_scpi-Support-unidirectional-mailbox-cha.patch
PATCHFILES += 0505-arm64-dts-allwinner-h6-Add-SCPI-protocol.patch
PATCHFILES += 0508-ASoC-hdmi-codec-fix-channel-allocation.patch
PATCHFILES += 0509-ASoC-sun4i-i2s-Add-parenthesis-around-macro-argument.patch
PATCHFILES += 0510-ASoC-sun4i-i2s-WiP-multi-channel.patch
PATCHFILES += 0511-arm64-dts-sun50i-h6-dtsi-add-sound-node.patch
PATCHFILES += 0512-arm64-dts-enable-audio-gs1.patch
PATCHFILES += 0514-media-cedrus-hevc-Improve-buffer-management.patch
PATCHFILES += 0515-media-cedrus-hevc-tiles-hack.patch
PATCHFILES += 0516-media-cedrus-h264-Improve-buffer-management.patch
PATCHFILES += 0525-media-cedrus-Add-callback-for-buffer-cleanup.patch
PATCHFILES += 0528-media-cedrus-wip-10-bit-HEVC-support.patch
# Adding support for MFD devices on some H6 boards
PATCHFILES += 0530-mfd-add-AC200.patch
PATCHFILES += 0531-arm64-dts-sun50i-h6.dtsi-add-ac200-nodes.patch
# Fix hanging GS1 boot on loading kernel modules
PATCHFILES += 0532-arm64-dts-allwinner-gs1-fix-eMMC-and-incr-vcpu-limit.patch
# Improvements and addidtions for some H6 boards
PATCHFILES += 0533-arm64-dts-allwinner-tanix-tx6-mini-enable-eth.patch
PATCHFILES += 0534-arm64-dts-allwinner-add-Eeachlink-H6-Mini.patch
PATCHFILES += 0535-arm64-dts-allwinner-tanix-tx6-mini-enable-wifi-cpu-dvfs.patch
# Allwinner: enable H6 GPU DVFS (seems not work OK atm)
PATCHFILES += 0536-arm64-dts-allwinner-h6-Add-cooling-map-for-GPU.patch
PATCHFILES += 0537-arm64-dts-allwinner-h6-Add-GPU-OPP-table.patch
# patches from LE 5.09.2021 for Eth improvements
PATCHFILES += 0539-drm-dw-hdmi-cec-sleep-100ms-on-error.patch
PATCHFILES += 0540-net-stmmac-sun8i-Use-devm_regulator_get-for-PHY-regu.patch
PATCHFILES += 0541-net-stmmac-sun8i-Rename-PHY-regulator-variable-to-re.patch
PATCHFILES += 0542-net-stmmac-sun8i-Add-support-for-enabling-a-regulato.patch
PATCHFILES += 0543-mmc-sunxi-fix-unusuable-eMMC-on-some-H6-boards-by-di.patch
# patches from LE 5.09.2021 for fixing playback corruption after 10min of playback
PATCHFILES += 0544-drm-sun4i-mixer-Add-caching-support.patch
# Add hw deinterlce support from LE 5.09.2021
PATCHFILES += 0545-H6-add-sun50i-di-deinterlace-WiP.patch
PATCHFILES += 0546-arm64-dts-h6-add-deinterlace-node.patch
# add support for xr819 wifi https://github.com/jernejsk/linux-1/tree/0e2dbeef9b05d5bd285d7fb2cf5bde1bb212c96d
PATCHFILES += 0547-net-wireless-add-xr819-support-07072021.patch
# add support for new chips in rtw88 https://github.com/jernejsk/linux-1/commits/b707c25dbf0dd1e4b993d4d4106a6eb0bb20b19d 
PATCHFILES += 0548-net-wireless-add-rtw88-support-10012022.patch
# fix setting 4k60 mode on some TVs.
PATCHFILES += 0549-drm-bridge-dw-hdmi-fix-4k60-modes-on-some-tv.patch
# for for non-working wifi on 5.17
PATCHFILES += 0550-pinctrl-sunxi-sunxi_pinctrl_gpio_direction_in-output-use-correct-offset.patch
PATCHFILES += 0570-hantro-Add-quirk-for-NV12-NV12_4L4-capture-format.patch
PATCHFILES += 0587-media-hantro-sunxi-Fix-VP9-steps.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Allwinner H616 patches -----------------------------------------
# https://github.com/jernejsk/linux-1/commits/h616-hdmi
PATCHFILES += 0600-drivers-h616-wip-add-usb-emac2-hdmi-support.patch
# add THS support
PATCHFILES += 0601-drivers-thermal-allwinner-add-h616-ths-support.patch
# add cedrus support
# https://github.com/jernejsk/linux-1/commits/h616-full
PATCHFILES += 0602-media-cedrus-add-H616-variant.patch
PATCHFILES += 0603-soc-sunxi-sram-Add-SRAM-C1-H616-handling.patch
# audio support
PATCHFILES += 0606-dma-sun6i-dma-add-h616-support.patch
PATCHFILES += 0610-sound-soc-add-h616-audio-support.patch
# enable some h616 boards
PATCHFILES += 0630-arm64-dts-allwinner-h616-add-dtsi.patch
PATCHFILES += 0631-arm64-dts-allwinner-h616-add-OrangePi-Zero2.patch
PATCHFILES += 0632-arm64-dts-allwinner-h616-add-X96-Mate-TVbox.patch
PATCHFILES += 0633-arm64-dts-allwinner-h616-add-Tanix-TX6s-TVbox.patch
PATCHFILES += 0634-arm64-dts-allwinner-h616-add-T95-TVbox.patch
PATCHFILES += 0635-arm64-dts-allwinner-h616-enable-ths-support.patch
# audio support
PATCHFILES += 0636-arm64-dts-allwinner-h616-add-audio-support.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Rockchip 33x patches -----------------------------------------
# patches from LE 29.01.2022
PATCHFILES += 0702-rockchip-from-list.patch
PATCHFILES += 0711-v4l2-from-list.patch
PATCHFILES += 0720-drm-from-list.patch
PATCHFILES += 0730-drm-rockchip-add-4k-videomodes-support.patch
#PATCHFILES += 0730-drm-rockchip.patch
PATCHFILES += 0731-v4l2-rockchip.patch
PATCHFILES += 0732-for-libreelec.patch
PATCHFILES += 0741-v4l2-wip-rkvdec-hevc.patch
PATCHFILES += 0742-v4l2-wip-iep-driver.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Rockchip 356x patches -----------------------------------------
# based on https://gitlab.com/pine64-org/quartz-bsp/linux-next/-/commits/quartz64-v5.17 @8.02.2022
PATCHFILES += 0800-rk356x-add-USB2-USB3-PCIe-mfd.patch
# https://patchwork.kernel.org/project/linux-rockchip/list/?series=608673
PATCHFILES += 0801-drm-rockchip-RK356x-VOP2-support-v4.1.patch
PATCHFILES += 0803-media-hantro-add-rk3566-support.patch
PATCHFILES += 0831-arm64-dts-rockchip-enable-usb2-usb3-pcie-in-rk35xx.dtsi.patch
PATCHFILES += 0832-arm64-dts-rockchip-enable-hantro-on-rk356x.patch
PATCHFILES += 0833-arm64-dts-rockchip-enable-Quartz64-A-usb2-usb3-pcie-audio.patch
PATCHFILES += 0834-arm64-dts-rockchip-add-dts-for-Firefly-Station-M2-rk.patch
PATCHFILES += 0835-arm64-dts-rockchip-add-early-quartz64-model-b.patch
PATCHFILES += 0836-arm64-dts-rockchip-add-dts-for-x96-x6.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- RaspberryPI patches -----------------------------------------
# Hack for adding H264 v4l2 decoding on RPI
PATCHFILES += 0900-rpi-vc04_services-add_h264_v4l2-m2m_decode-08112021.patch
# V3d enablement in RPI4
# https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=434471
PATCHFILES += 0901-Raspberry-PI-4-V3D-enablement.patch 
# add H265 rpivid driver
PATCHFILES += 0904-media-add-rpivid-24022021.patch
endif
#------------------------------------------------------------

endif

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	utils/bc \
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
	@$(CONFIGURE_ENV) $(MAKE) $(BUILD_ARGS) -C $(WORKSRC) Image modules dtbs
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
	@# cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image.gz > $(DESTDIR)$(LINUX_DIR)/Image.gz
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

menuconfig:
	@$(CONFIGURE_ENV) $(MAKE) $(CONFIGURE_ARGS) -C $(WORKSRC) menuconfig

savedefconfig:
	@$(CONFIGURE_ENV) $(MAKE) $(CONFIGURE_ARGS) -C $(WORKSRC) savedefconfig
	mv $(WORKSRC)/defconfig $(CONFIGFILE)

