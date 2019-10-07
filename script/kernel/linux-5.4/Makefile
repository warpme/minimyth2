
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

PATCHFILES  = linux-5.4.patch.gar
PATCHFILES += linux-5.4-perl.patch.gar
PATCHFILES += linux-5.4-disable_dma_for_cfa.patch
PATCHFILES += linux-5.4-defaults.patch
PATCHFILES += linux-5.4-vgaarb-add-3D-accell-detection.patch
PATCHFILES += linux-5.4-net-smsc95xx-allow-mac-address-as-param.patch

PATCHFILES += 0101-meson-ao-cec-move-cec_notifier_cec_adap_register-after-hw-setup.patch
PATCHFILES += 0103-dma-buf-resv-fix-exclusive-fence-get.patch

ifeq (1,1)
PATCHFILES += 0102-WIP-drm-panfrost-add-support-for-custom-soft-reset-on-GXM.patch
# Some mali related kernel iommu fixes
# https://github.com/superna9999/linux/commits/amlogic/v5.3/panfrost
PATCHFILES += 0108-iommu-io-pgtable-arm-Correct-Mali-attributes.patch
PATCHFILES += 0109-iommu-io-pgtable-arm-Support-more-Mali-configurations.patch
PATCHFILES += 0110-iommu-io-pgtable-arm-Allow-coherent-walks-for-Mali.patch
# PATCHFILES += 0111-drm-panfrost-Handle-resetting-on-timeout-better.patch
endif

ifeq (1,1)
# Amlogic vdec enhacement for h264/mjpeg/vp9 over mpeg1/2 basic support in 5.4
PATCHFILES += 0323-media-meson-vdec-add-H.264-decoding-support.patch
PATCHFILES += 0324-media-meson-vdec-add-MPEG4-decoding-support.patch
PATCHFILES += 0325-media-meson-vdec-add-MJPEG-decoding-support.patch
PATCHFILES += 0326-media-videodev2.h-Add-Amlogic-compressed-format.patch
PATCHFILES += 0327-media-meson-vdec-add-support-for-V4L2_PIX_FMT_AM21C.patch
PATCHFILES += 0328-media-meson-vdec-add-HEVC-decoding-support.patch
PATCHFILES += 0329-media-meson-vdec-add-VP9-input-support.patch
PATCHFILES += 0330-media-meson-vdec-add-VP9-support.patch
PATCHFILES += 0331-media-meson-vdec-add-g12a-platform.patch
PATCHFILES += 0332-media-meson-vp9-add-IOMMU-support.patch
PATCHFILES += 0333-arm64-dts-meson-g12a-add-video-decoder-node.patch
PATCHFILES += 0334-media-meson-vdec-WIP-HEVC-IOMMU-support.patch
endif

ifeq (1,1)
# Amlogic speciffic patches to enable hdmi audio
PATCHFILES += 0341-ASoC-meson-add-meson-audio-core-driver.patch
PATCHFILES += 0342-ASoC-meson-add-register-definitions.patch
PATCHFILES += 0343-ASoC-meson-add-initial-aiu-i2s-support.patch
PATCHFILES += 0344-ASoC-meson-add-initial-spdif-support.patch
PATCHFILES += 0346-snd-meson-activate-HDMI-audio-path.patch
PATCHFILES += 0345-ARM64-dts-meson-gx-add-audio-controller-nodes.patch
PATCHFILES += 0347-ARM64-dts-meson-gx-add-sound-dai-cells-to-HDMI-node.patch
PATCHFILES += 0348-ARM64-dts-meson-activate-hdmi-audio-HDMI-enabled-boa.patch
endif

# Amlogic misc patches
PATCHFILES += 0350-arm64-dts-meson-tanix-tx3-add-thermal-zones.patch

ifeq (1,1)
# ROCKCHIP speciffic patches to enable hdmi audio
PATCHFILES += 0400-arm64-dts-rockchip-add-HDMI-sound-node-for-rk3328-ro.patch
PATCHFILES += 0401-ASoC-rockchip-i2s-use-closest-clock-rate.patch
PATCHFILES += 0402-HACK-arm64-dts-rockchip-update-gpu-node-on-rk3328-ro.patch
PATCHFILES += 0403-HACK-arm64-dts-rockchip-remove-acodec-dai-on-rk3328-.patch
PATCHFILES += 0404-HACK-arm64-dts-rockchip-split-sound-node-on-rk3328-r.patch
PATCHFILES += 0405-WIP-arm64-dts-rockchip-work-in-progress-on-rk3328-ro.patch
PATCHFILES += 0406-arm64-dts-rockchip-Enable-HDMI-audio-on-rk3399-rock-.patch
PATCHFILES += 0406-HACK-arm64-dts-rockchip-rename-hdmi-sound-card-on-rk.patch
PATCHFILES += 0407-arm64-dts-rockchip-Enable-HDMI-audio-on-rk3399-nanop.patch
PATCHFILES += 0408-arm64-dts-rockchip-Fix-HDMI-audio-on-rk3399-orangepi.patch
PATCHFILES += 0409-arm64-dts-rockchip-Enable-HDMI-audio-on-rk3399-roc-p.patch
PATCHFILES += 0410-arm64-dts-rockchip-Enable-gpu-node-on-rk3399-roc-pc.patch
endif

ifeq (1,1)
# H6 HDMI audio support
PATCHFILES += 0501-ASoC-sun4i-i2s-Add-function-to-sign-extend-sample.patch
PATCHFILES += 0502-ASoC-sun4i-i2s-Adjust-LRCLK-width.patch
PATCHFILES += 0503-ASoc-sun4i-i2s-Add-20-and-24-bit-support.patch
PATCHFILES += 0504-ASoC-sun4i-i2s-Move-channel-select-offset.patch
PATCHFILES += 0505-ASoC-sun4i-i2s-Add-functions-for-RX-and-TX-channel-o.patch
PATCHFILES += 0506-ASoC-sun4i-i2s-Add-functions-for-RX-and-TX-channel-e.patch
PATCHFILES += 0507-ASoC-sun4i-i2s-Add-functions-for-RX-and-TX-channel-s.patch
PATCHFILES += 0508-revert-sun4i-i2s-Use-module-clock-as-BCLK-parent-on-newer-SoCs.patch
PATCHFILES += 0509-arm64-dts-sun50i-h6-Add-HDMI-audio-to-H6-DTSI.patch
endif

ifeq (1,1)
# Support for USB3 on H6
PATCHFILES += 0520-phy-allwinner-add-phy-driver-for-USB3-PHY-on-Allwinn.patch
PATCHFILES += 0521-arm64-allwinner-dts-h6-add-USB3-device-nodes.patch
PATCHFILES += 0522-arm64-allwinner-dts-h6-enable-USB3-port-on-Beelink-G.patch
# Misc patches for H6
PATCHFILES += 0525-Allwinner-H6-Add-Mali-GPU-for-H6-boards.patch
PATCHFILES += 0526-pwm-sun4i-Add-support-for-Allwinner-H6.patch
PATCHFILES += 0527-bus-sunxi-rsb-Make-interrupt-handling-more-robust.patch
# Add some new H6 boards
PATCHFILES += 0528-arm64-dts-allwinner-add-rgmii-pins-for-some-h6-boards.patch
PATCHFILES += 0529-arm64-dts-allwinner-add-Tanix-TX6.patch
PATCHFILES += 0530-arm64-dts-allwinner-add-Eeachlink-H6-Mini.patch
PATCHFILES += 0531-arm64-dts-allwinner-add-Qplus.patch
# Add support for RTC in H6 familly
PATCHFILES += 0532-dt-bindings-Add-compatible-for-H6-RTC.patch
# Add AC200 for Eachlink H6/Tanix TX6
PATCHFILES += 0533-allwinner-h6-add-AC200-EPHY-support.patch
PATCHFILES += 0534-arm64-dts-sun50i-h6-add-AC200-nodes.patch
# HW cursor support in drm planes
PATCHFILES += 0535-drm-sun4i-Mark-one-of-the-UI-planes-as-a-cursor-one.patch
PATCHFILES += 0536-drm-sun8i-ui-vi-Fix-layer-zpos-change-atomic-modesetting.patch
# Allwinner Cedrus related patches
PATCHFILES += 0540-media-cedrus-Add-HEVC-decoding-support.patch
PATCHFILES += 0541-media-cedrus-h264-add-support-multi-slice-frames.patch
endif

ifeq (1,1)
# Add thermal support in H6
PATCHFILES += 0550-thermal-sun8i-add-thermal-driver-for-H6.patch
PATCHFILES += 0551-thermal-sun8i-add-dts-nodes.patch
PATCHFILES += 0552-thermal-sun8i-enable-ths-in-h6-boards.patch
endif

ifeq (1,1)
# Add DVFS for H6
PATCHFILES += 0553-arm64-dts-allwinner-h6-Add-clock-to-CPU-cores.patch
PATCHFILES += 0554-arm64-dts-allwinner-h6-Add-CPU-OPP-table.patch
endif


LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	utils/bc \
	$(if $(filter arm arm64,$(mm_GARCH_FAMILY)),bootloaders/u-boot-tools) \

DEPENDS = \
	kernel-headers/linux-headers \
	kernel/linux-firmware \
	kernel/linux-firmware-meson \

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
