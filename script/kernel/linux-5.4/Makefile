
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

# Amlogic: Fix 5.4 kernel Ooops
PATCHFILES += 0101-meson-ao-cec-move-cec_notifier_cec_adap_register-after-hw-setup.patch

ifeq (1,1)
# Amlogic: Patch to fix Panfrost reset issue on GXM
PATCHFILES += 0102-WIP-drm-panfrost-add-support-for-custom-soft-reset-on-GXM.patch
endif

ifeq (1,1)
# Amlogic: Add h264 and v4l2 compliance for Amlogic vdec
# https://patchwork.kernel.org/project/linux-amlogic/list/?series=183773&submitter=&state=*&q=&archive=both&delegate=
PATCHFILES += 0322-media-meson-vdec-Add-compliant-H264-support.patch
PATCHFILES += 0323-media-meson-vdec-Add-support-for-the-H264-compressed-format.patch

PATCHFILES += 0324-media-meson-vdec-add-MPEG4-decoding-support.patch
PATCHFILES += 0325-media-meson-vdec-add-MJPEG-decoding-support.patch
PATCHFILES += 0326-arm64-dts-meson-g12a-add-video-decoder-node.patch
endif

ifeq (1,1)
# Amlogic: Enable hdmi audio
# https://github.com/chewitt/linux/commits/amlogic-5.5-integ-chewitt?after=193a17bf41d5943dd97a05594faa00ce56e27774+69
PATCHFILES += 0341-ASoC-meson-add-meson-audio-core-driver.patch
PATCHFILES += 0342-ASoC-meson-add-register-definitions.patch
PATCHFILES += 0343-ASoC-meson-add-initial-aiu-i2s-support.patch
PATCHFILES += 0344-ASoC-meson-add-initial-spdif-support.patch
PATCHFILES += 0346-snd-meson-activate-HDMI-audio-path.patch
PATCHFILES += 0345-ARM64-dts-meson-gx-add-audio-controller-nodes.patch
PATCHFILES += 0347-ARM64-dts-meson-gx-add-sound-dai-cells-to-HDMI-node.patch
PATCHFILES += 0348-ARM64-dts-meson-activate-hdmi-audio-HDMI-enabled-boa.patch
PATCHFILES += 0350-drm-dw-hdmi-call-hdmi_set_cts_n-after-clock-is-.patch
PATCHFILES += 0351-fix-chmap_idx.patch
PATCHFILES += 0352-ASoC-hdmi-codec-reorder-channel-allocation-list.patch
# PATCHFILES += 0353-multi-channel-GX-audio-hack.patch
endif

# Amlogic: Misc patches
PATCHFILES += 0360-arm64-dts-meson-tanix-tx3-add-thermal-zones.patch

ifeq (1,1)
# Rockchip: enable hdmi audio
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

ifeq (0,1)
# Rockchip: rk3399 vdec support https://patchwork.kernel.org/project/linux-rockchip/list/?series=186085
PATCHFILES += 0420-media-vb2-Add-a-helper-to-get-the-vb2-buffer-attached-to-a-request.patch
PATCHFILES += 0421-media-dt-bindings-rockchip-Document-RK3399-Video-Decoder-bindings.patch
PATCHFILES += 0422-media-rockchip-Add-the-rkvdec-driver.patch
PATCHFILES += 0423-arm64-dts-rockchip-rk3399-Define-the-rockchip-Video-Decoder-node.patch
endif

ifeq (1,1)
# Rockchip: rk3328/3399 improvements https://patchwork.kernel.org/project/linux-rockchip/list/?series=168159
PATCHFILES += 0430-media-hantro-Fix-H264-max-frmsize-supported-on-RK3288.patch
PATCHFILES += 0431-media-hantro-Do-not-reorder-H264-scaling-list.patch
PATCHFILES += 0432-media-hantro-Fix-H264-motion-vector-buffer-offset.patch
PATCHFILES += 0433-media-hantro-Reduce-H264-extra-space-for-motion-vectors.patch
PATCHFILES += 0434-media-hantro-Remove-now-unused-H264-pic_size.patch
PATCHFILES += 0435-media-hantro-Set-H264-FIELDPIC_FLAG_E-flag-correctly.patch
PATCHFILES += 0436-media-uapi-h264-Add-DPB-entry-field-reference-flags.patch
PATCHFILES += 0437-media-hantro-Fix-H264-decoding-of-field-encoded-content.patch
PATCHFILES += 0438-media-hantro-Refactor-G1-H264-code.patch
PATCHFILES += 0439-media-hantro-Add-support-for-H264-decoding-on-RK3399.patch
PATCHFILES += 0440-media-hantro-Enable-H264-decoding-on-RK3399.patch
PATCHFILES += 0441-media-hantro-Enable-H264-decoding-on-RK3328.patch
endif

ifeq (1,1)
# Allwinner H6: Enable HDMI audio
PATCHFILES += 0500-sun4i-i2s-add-H6-audio-support.patch
PATCHFILES += 0509-arm64-dts-sun50i-h6-Add-HDMI-audio-to-H6-DTSI.patch
endif

ifeq (1,1)
# Allwinner H6: Support for USB3
PATCHFILES += 0520-phy-allwinner-add-phy-driver-for-USB3-PHY-on-Allwinn.patch
PATCHFILES += 0521-arm64-allwinner-dts-h6-add-USB3-device-nodes.patch
PATCHFILES += 0522-arm64-allwinner-dts-h6-enable-USB3-port-on-Beelink-G.patch
# Allwinner H6: Misc patches
PATCHFILES += 0524-mmc-sunxi-fix-unusuable-eMMC-on-some-H6-boards-by-disabling-DDR.patch
PATCHFILES += 0525-Allwinner-H6-Add-Mali-GPU-for-H6-boards.patch
PATCHFILES += 0526-pwm-sun4i-Add-support-for-Allwinner-H6.patch
PATCHFILES += 0527-bus-sunxi-rsb-Make-interrupt-handling-more-robust.patch
# Allwinner H6: Add some new H6 boards
PATCHFILES += 0528-arm64-dts-allwinner-add-rgmii-pins-for-some-h6-boards.patch
PATCHFILES += 0529-arm64-dts-allwinner-add-Tanix-TX6.patch
PATCHFILES += 0530-arm64-dts-allwinner-add-Eeachlink-H6-Mini.patch
PATCHFILES += 0531-arm64-dts-allwinner-add-Qplus.patch
# Allwinner H6: Add support for RTC
PATCHFILES += 0532-dt-bindings-Add-compatible-for-H6-RTC.patch
# Allwinner H6: Add AC200 for Eachlink H6/Tanix TX6
PATCHFILES += 0533-allwinner-h6-add-AC200-EPHY-support.patch
PATCHFILES += 0534-arm64-dts-sun50i-h6-add-AC200-nodes.patch
# Allwinner H6: HW cursor support in drm planes
PATCHFILES += 0535-drm-sun4i-Mark-one-of-the-UI-planes-as-a-cursor-one.patch
PATCHFILES += 0536-drm-sun8i-ui-vi-Fix-layer-zpos-change-atomic-modesetting.patch
endif

ifeq (1,1)
# Allwinner H6: Cedrus related patches
PATCHFILES += 0540-media-cedrus-Add-HEVC-decoding-support.patch
PATCHFILES += 0541-media-cedrus-h264-add-support-multi-slice-frames.patch
PATCHFILES += 0542-media-cedrus-Properly-signal-size-in-mode-register.patch
PATCHFILES += 0543-media-cedrus-Fix-H264-4k-support.patch
PATCHFILES += 0544-media-cedrus-Increase-maximum-supported-size.patch
endif

ifeq (1,1)
# Allwinner H6: Add thermal support
PATCHFILES += 0550-thermal-sun8i-add-thermal-driver-for-H6.patch
PATCHFILES += 0551-thermal-sun8i-add-dts-nodes.patch
PATCHFILES += 0552-thermal-sun8i-enable-ths-in-h6-boards.patch
endif

ifeq (1,1)
# Allwinner H6: Add DVFS
PATCHFILES += 0553-arm64-dts-allwinner-h6-Add-clock-to-CPU-cores.patch
PATCHFILES += 0554-arm64-dts-allwinner-h6-Add-CPU-OPP-table.patch
PATCHFILES += 0555-arm64-dts-allwinner-h6-enable-dvfs-fix-CPU-voltage-some-boards.patch
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
