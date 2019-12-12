ifeq (1,1)
#--Use this for mainline official x.y.z kernel----
MASTER_SITES        = https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/snapshot/
DISTFILES           = $(DISTNAME).tar.gz $(CONFIGFILE)
WORKSRC             = $(WORKDIR)/linux-$(LINUX_VERSION)
#-------------------------------------------
endif

ifeq (0,1)
#--Use this for mainline git-commit kernel--
MASTER_SITES        = https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/snapshot/
DISTFILES           = $(GITHASH).tar.gz $(CONFIGFILE)
WORKSRC             = $(WORKDIR)/$(GITHASH)
#-------------------------------------------
endif

ifeq (0,1)
#--Use this for Neil's amlogic media-next tree ----
MASTER_SITES        = https://github.com/superna9999/linux/archive/
DISTFILES           = $(GITHASH).tar.gz $(CONFIGFILE)
WORKSRC             = $(WORKDIR)/linux-$(GITHASH)
#-------------------------------------------
endif

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

# v4l2 support for video decoders (hantro/cedrus/amlogic)
# https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/Allwinner/patches/linux/0001-backport-from-5.5.patch
# https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/Allwinner/patches/linux/0005-cedrus-improvements.patch
PATCHFILES += 0010-media-v4l2-add_CID_UNIT_CELL_SIZE-control.patch
PATCHFILES += 0011-media-v4l2-add_CTRL_TYPE_AREA-control-type.patch
PATCHFILES += 0012-media-v4l2-add-definitions-for-HEVC-stateless-decoding.patch
PATCHFILES += 0013-media-v4l2-add-mem2mem-support-held-capture-buffers.patch
PATCHFILES += 0014-media-v4l2-add-mem2mem-add-stateless_try_decoder_cmd-ioctl.patch
PATCHFILES += 0015-media-v4l2-add-mem2mem-add-new_frame-detection.patch
PATCHFILES += 0016-media-v4l2-add-V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF.patch
PATCHFILES += 0017-media-v4l2-videodev2.h-add-V4L2_DEC_CMD_FLUSH.patch
PATCHFILES += 0018-media-v4l2-add-mem2mem-Fix-hold-buf-flag-checks.patch
PATCHFILES += 0019-media-uapi-h264-Add-DPB-entry-field-reference-flags.patch
PATCHFILES += 0020-media-v4l2-mem2mem-mark-DONE-any-OUTPUT-queued-buffer-after-CMD_STOP-v2.patch

# Amlogic: Fix 5.4 kernel Ooops
PATCHFILES += 0101-meson-ao-cec-move-cec_notifier_cec_adap_register-after-hw-setup.patch

ifeq (1,1)
# Amlogic: Patch to fix Panfrost reset issue on GXM
PATCHFILES += 0102-WIP-drm-panfrost-add-support-for-custom-soft-reset-on-GXM.patch
endif

ifeq (1,1)
# Amlogic: Add h264 and v4l2 compliance for Amlogic vdec
PATCHFILES += 0302-arm64-dts-meson-set-dma-pool-to-896MB.patch
# https://patchwork.kernel.org/project/linux-amlogic/list/?series=205671
PATCHFILES += 0303-dt-bindings-media-amlogic-vdec-convert-to-yaml.patch
PATCHFILES += 0304-dt-bindings-media-amlogic-gx-vdec-add-bindings-for-G12A-family.patch
PATCHFILES += 0305-media-meson-vdec-add-g12a-platform.patch
PATCHFILES += 0306-arm64-dts-meson-g12-common-add-video-decoder-node.patch
# https://patchwork.kernel.org/project/linux-amlogic/list/?series=206467 21-11-2019
PATCHFILES += 0307-dt-bindings-media-amlogic-gx-vdec-add-bindings-for-SM1-family.patch
PATCHFILES += 0308-media-meson-vdec-add-sm1-platform.patch
PATCHFILES += 0309-arm64-dts-meson-sm1-add-video-decoder-compatible.patch
# https://patchwork.kernel.org/project/linux-amlogic/list/?series=208153 26-11-2019
PATCHFILES += 0311-media-meson-vdec-bring-up-to-compliance-v2.patch
PATCHFILES += 0312-media-meson-vdec-add-H.264-decoding-support-v2.patch
# https://patchwork.kernel.org/project/linux-amlogic/list/?series=212121 05-12-2019
PATCHFILES += 0328-media-meson-vdec-align-stride-on-32-bytes.patch
PATCHFILES += 0329-media-meson-vdec-add-helpers-for-lossless-framebuffer-compression-buffers.patch
PATCHFILES += 0330-media-meson-vdec-add-common-HEVC-decoder-support.patch
PATCHFILES += 0331-media-meson-vdec-add-VP9-input-support.patch
PATCHFILES += 0332-media-meson-vdec-add-VP9-decoder-support.patch
PATCHFILES += 0336-media-meson-vdec-add-HEVC-decoding-support.patch
endif

ifeq (1,1)
# Amlogic: Enable hdmi audio
# https://github.com/chewitt/linux/commits/amlogic-5.5-integ-chewitt?after=193a17bf41d5943dd97a05594faa00ce56e27774+69
PATCHFILES += 0341-ASoC-meson-add-meson-audio-core-driver.patch
PATCHFILES += 0342-ASoC-meson-add-register-definitions.patch
PATCHFILES += 0343-ASoC-meson-add-initial-aiu-i2s-support.patch
PATCHFILES += 0344-ASoC-meson-add-initial-spdif-support.patch
PATCHFILES += 0346-snd-meson-activate-HDMI-audio-path.patch
PATCHFILES += 0345-arm64-dts-meson-gx-add-audio-controller-nodes.patch
PATCHFILES += 0347-arm64-dts-meson-gx-add-sound-dai-cells-to-HDMI-node.patch
PATCHFILES += 0348-arm64-dts-meson-activate-hdmi-audio-HDMI-enabled-boa.patch
PATCHFILES += 0350-drm-dw-hdmi-call-hdmi_set_cts_n-after-clock-is-.patch
PATCHFILES += 0351-fix-chmap_idx.patch
PATCHFILES += 0352-ASoC-hdmi-codec-reorder-channel-allocation-list.patch
# Seems to casuse issues with 2.0 HDMI
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

ifeq (1,1)
# Rockchip: rk3328/3399 improvements https://patchwork.kernel.org/project/linux-rockchip/list/?series=168159
PATCHFILES += 0430-media-hantro-Fix-H264-max-frmsize-supported-on-RK3288.patch
PATCHFILES += 0431-media-hantro-Do-not-reorder-H264-scaling-list.patch
PATCHFILES += 0432-media-hantro-Fix-H264-motion-vector-buffer-offset.patch
PATCHFILES += 0433-media-hantro-Reduce-H264-extra-space-for-motion-vectors.patch
PATCHFILES += 0434-media-hantro-Remove-now-unused-H264-pic_size.patch
PATCHFILES += 0435-media-hantro-Set-H264-FIELDPIC_FLAG_E-flag-correctly.patch
PATCHFILES += 0437-media-hantro-Fix-H264-decoding-of-field-encoded-content.patch
PATCHFILES += 0438-media-hantro-Refactor-G1-H264-code.patch
PATCHFILES += 0439-media-hantro-Add-support-for-H264-decoding-on-RK3399.patch
PATCHFILES += 0440-media-hantro-Enable-H264-decoding-on-RK3399.patch
PATCHFILES += 0441-media-hantro-Enable-H264-decoding-on-RK3328.patch
endif

# Misc Rockchip patches
PATCHFILES += 0450-arm64-dt-add-Beelink-A1-board.patch

ifeq (1,1)
# Allwinner H6: Support for USB3
PATCHFILES += 0520-phy-allwinner-add-phy-driver-for-USB3-PHY-on-Allwinn.patch
PATCHFILES += 0521-arm64-allwinner-dts-h6-add-USB3-device-nodes.patch
PATCHFILES += 0522-arm64-allwinner-dts-h6-enable-USB3-port-on-Beelink-G.patch
# Allwinner H6: Misc patches
PATCHFILES += 0524-mmc-sunxi-fix-unusuable-eMMC-on-some-H6-boards-by-disabling-DDR.patch
PATCHFILES += 0525-arm64-allwinner-dts-h6-add-Mali-GPU-for-H6-boards.patch
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
# Allwinner H6: Add thermal support
PATCHFILES += 0550-thermal-sun8i-add-thermal-driver-for-A64-H3-H5-H6.patch
PATCHFILES += 0551-thermal-sun8i-add-dts-nodes.patch
PATCHFILES += 0552-thermal-sun8i-enable-ths-in-h6-boards.patch
endif

ifeq (1,1)
# Allwinner H6: Add DVFS
PATCHFILES += 0553-arm64-dts-allwinner-h6-Add-clock-to-CPU-cores.patch
PATCHFILES += 0554-arm64-dts-allwinner-h6-Add-CPU-OPP-table.patch
PATCHFILES += 0555-arm64-dts-allwinner-h6-enable-dvfs-fix-CPU-voltage-some-boards.patch
endif

ifeq (1,1)
# Allwinner H6: Enable HDMI audio
PATCHFILES += 0560-clk-sunxi-ng-h6-Use-sigma-delta-modulation-for-audio-PLL.patch
PATCHFILES += 0561-clk-sunxi-ng-h6-Allow-GPU-to-change-parent-rate.patch
# https://github.com/codekipper/linux-sunxi/commits/upstream-i2s
PATCHFILES += 0564-ARM-dts-sunxi-h3-h5-Add-DAI-node-for-HDMI.patch
PATCHFILES += 0565-arm64-dts-allwinner-a64-Add-DAI-node-for-HDMI.patch
PATCHFILES += 0566-ARM-dts-sunxi-h3-h5-Add-HDMI-audio.patch
PATCHFILES += 0567-ARM-sun8i-h3-Add-HDMI-audio-to-Orange-Pi-2.patch
PATCHFILES += 0568-ARM-sun8i-h3-Add-HDMI-audio-to-Beelink-X2.patch
PATCHFILES += 0569-ARM-dts-sun50i-a64-Add-I2S0-pins-to-dtsi.patch
PATCHFILES += 0570-arm64-dts-sun50i-a64-Add-HDMI-audio-to-A64-DTSI.patch
PATCHFILES += 0571-arm64-dts-sun50i-a64-Add-HDMI-audio-to-Pine64.patch
PATCHFILES += 0572-arm64-dts-sun50i-h6-Add-HDMI-audio-to-H6-DTSI.patch
PATCHFILES += 0573-arm64-dts-allwinner-orange-pi-Enable-HDMI-output.patch
PATCHFILES += 0574-ASoC-sun4i-i2s-Move-channel-select-offset.patch
PATCHFILES += 0575-ASoC-sun4i-i2s-Add-functions-for-RX-and-TX-channel-o.patch
PATCHFILES += 0576-ASoC-sun4i-i2s-Add-functions-for-RX-and-TX-channel-e.patch
PATCHFILES += 0577-ASoC-sun4i-i2s-Add-functions-for-RX-and-TX-channel-s.patch
PATCHFILES += 0578-ASoC-sun4i-i2s-Add-functions-for-RX-and-TX-channel-m.patch
PATCHFILES += 0579-dt-bindings-ASoC-sun4i-i2s-Add-H6-compatible.patch
PATCHFILES += 0580-ASoC-sun4i-i2s-Add-support-for-H6-I2S.patch
PATCHFILES += 0581-ASoC-sun4i-i2s-Add-function-to-sign-extend-sample.patch
PATCHFILES += 0582-ASoC-sun4i-i2s-Adjust-LRCLK-width.patch
PATCHFILES += 0583-ASoc-sun4i-i2s-Add-20-and-24-bit-support.patch
PATCHFILES += 0584-ASoC-sun4i-i2s-Add-multi-lane-functionality.patch
PATCHFILES += 0585-ASoC-sun4i-i2s-Add-multichannel-functionality.patch
PATCHFILES += 0586-ASoC-sun4i-i2s-Adjust-regmap-settings.patch
PATCHFILES += 0588-arm64-dts-allwinner-Add-SPDIF-node-for-Allwinner-H6.patch
endif

ifeq (1,1)
# Allwinner H6: Cedrus related patches
PATCHFILES += 0606-media-cedrus-fill-in-bus_info-for-media-device.patch
PATCHFILES += 0607-media-cedrus-choose-default-pixelformat-in-try_fmt.patch
PATCHFILES += 0608-media-cedrus-fix-various-format-related-compliance-issues.patch
PATCHFILES += 0609-media-cedrus-h264-Support-multiple-slices-per-frame.patch
PATCHFILES += 0610-media-cedrus-Fix-undefined-shift-with-a-SHIFT_AND_MASK_BITS.patch
PATCHFILES += 0611-media-cedrus-Remove-unnecessary-parenthesis-aroundDIV_ROUND_UP.patch
PATCHFILES += 0612-media-cedrus-Add-HEVC-decoding-support.patch
PATCHFILES += 0615-media-cedrus-Fix-decoding-for-some-H264-videos.patch
PATCHFILES += 0616-media-cedrus-Use-helpers-to-access-capture-queue.patch
PATCHFILES += 0617-media-cedrus-Use-correct-H264-8x8-scaling-list.patch
PATCHFILES += 0619-media-cedrus-Properly-signa-size-in-mode-register.patch
PATCHFILES += 0620-media-cedrus-Fix-H264-4k-support.patch
PATCHFILES += 0621-media-cedrus-Increase-maximum-supported-size.patch
PATCHFILES += 0622-media-cedrus-improvements.patch
PATCHFILES += 0623-media-cedrus-10bit-HEVC-hack.patch
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
	kernel/wireless-regdb \

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
