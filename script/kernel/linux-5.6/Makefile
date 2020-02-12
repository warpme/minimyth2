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

GARNAME = linux
GARVERSION = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),$(if $(filter-out 0,$(LINUX_TEENY_VERSION)),.$(LINUX_TEENY_VERSION)))$(LINUX_EXTRA_VERSION)
CATEGORIES = kernel-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)

CONFIGFILE = linux-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)-$(GARCH_FAMILY)-$(GARCH).config

PATCHFILES  = linux-5.6.patch.gar
PATCHFILES += linux-5.6-perl.patch.gar
PATCHFILES += linux-5.6-disable_dma_for_cfa.patch
PATCHFILES += linux-5.6-defaults.patch
PATCHFILES += linux-5.6-vgaarb-add-3D-accell-detection.patch
PATCHFILES += linux-5.6-net-smsc95xx-allow-mac-address-as-param.patch

PATCHFILES += 0100-aarch64-text-offset.patch

ifeq (1,1)
# Amlogic: Patch to fix Panfrost reset issue on GXM
PATCHFILES += 0102-WIP-drm-panfrost-add-support-for-custom-soft-reset-on-GXM.patch
# Misc pnafrost patchres for 5.6 kernel
# https://gitlab.freedesktop.org/tomeu/linux/commit/77e798ec24625949631f386772e592d0af4e7bbe
PATCHFILES += 0103-drm-panfrost-make-panfrost_job_run_rte_ERR_PTR.patch
endif

ifeq (1,1)
# Amlogic: vdec: Add h264 and v4l2 compliance for Amlogic vdec
# https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=237615 v5, 06/02/2020
PATCHFILES += 0302-media-v4l2-mem2mem-handle-draining-stopped-and-next.patch
PATCHFILES += 0303-media-vicodec-use-v4l2-mem2mem-draining-stopped-and.patch
PATCHFILES += 0304-media-meson-vdec-bring-up-to-compliance.patch
PATCHFILES += 0305-media-meson-vdec-add-H.264-decoding-support.patch
# Amlogic: vdec: Add VP9 decoding support
# https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=237633 v4, 06/02/202
PATCHFILES += 0306-media-meson-vdec-align-stride-on-32-bytes.patch
PATCHFILES += 0307-media-meson-vdec-add-helpers-for-lossless-framebuffe.patch
PATCHFILES += 0308-media-meson-vdec-add-common-HEVC-decoder-support.patch
PATCHFILES += 0309-media-meson-vdec-add-VP9-input-support.patch
PATCHFILES += 0310-media-meson-vdec-add-VP9-decoder-support.patch
# Amlogic: vdec various patches
PATCHFILES += 0311-arm64-dts-meson-set-dma-pool-to-896MB.patch
PATCHFILES += 0312-g12-set-cma-to-896MiB-for-4k.patch
endif

ifeq (1,1)
# Amlogic: Enable hdmi audio
# https://gitlab.com/jbrunet/linux/commits/v5.6/aml/integ
PATCHFILES += 0330-ASoC-meson-rework-g12a-tohdmitx-codec.patch
PATCHFILES += 0331-ASoC-meson-add-toacodec-dt-bindings.patch
PATCHFILES += 0332-ASoC-meson-add-g12-internal-DAC-glue.patch
PATCHFILES += 0333-ASoC-meson-add-t9015-internal-DAC-driver.patch
PATCHFILES += 0334-ASoC-meson-axg-card-add-toacodec-support.patch
PATCHFILES += 0336-ASoC-meson-aiu-add-i2s-fifo-support.patch
PATCHFILES += 0337-ASoC-meson-aiu-add-spdif-fifo-support.patch
PATCHFILES += 0338-ASoC-meson-aiu-add-i2s-encoder-support.patch
PATCHFILES += 0339-ASoC-meson-aiu-add-spdif-encoder-support.patch
PATCHFILES += 0340-ASoC-meson-extract-utils-from-axg-sound-card.patch
PATCHFILES += 0341-ASoC-meson-add-gx-card-support.patch
PATCHFILES += 0342-WIP-ASoC-meson-gx-hardcode-codec-to-codec-routes.patch
PATCHFILES += 0343-clk-meson-g12a-fix-gp0-and-hifi-ranges.patch
PATCHFILES += 0344-arm64-dts-meson-g12a-add-internal-DAC.patch
PATCHFILES += 0345-arm64-dts-meson-g12a-add-internal-DAC-glue.patch
PATCHFILES += 0346-arm64-dts-meson-u200-add-audio-support.patch
PATCHFILES += 0347-arm64-dts-meson-gx-add-playback-audio-devices.patch
PATCHFILES += 0348-arm64-dts-meson-enable-audio-playback-on-p230-q2.patch
PATCHFILES += 0349-arm64-dts-meson-add-Khadas-VIM2-audio-playback.patch
PATCHFILES += 0367-DEBUG-arm64-dts-meson-work-around-secos-memory-on-q2.patch
endif

# Amlogic: Misc patches
PATCHFILES += 0360-arm64-dts-meson-tanix-tx3-add-thermal-zones.patch
PATCHFILES += 0361-arm64-dts-meson-gxm-add-beelink-gt1.patch
PATCHFILES += 0362-dt-bindings-reset-meson-add-gxl-internal-dac-reset.patch
PATCHFILES += 0363-dt-bindings-clk-meson-add-the-gxl-internal-dac-gate.patch
PATCHFILES += 0364-clk-meson-gxbb-add-the-gxl-internal-dac-gate.patch
PATCHFILES += 0365-clk-meson-gxbb-set-audio-output-clock-hierarchy.patch

ifeq (0,1)
# Rockchip: rkvdec rk3399
# https://patchwork.kernel.org/project/linux-rockchip/list/?series=234693 v4 29.01.2020
PATCHFILES += 0401-media-uapi-h264-Add-DPB-entry-field-reference-flags.patch
PATCHFILES += 0402-media-v4l2-core-Add-helpers-to-build-the-H264-P-B0-B1-reflists.patch
PATCHFILES += 0403-media-hantro-h264-Use-the-generic-H264-reflist-builder.patch
PATCHFILES += 0404-media-dt-bindings-rockchip-Document-RK3399-Video-Decoder-bindings.patch
PATCHFILES += 0405-media-rkvdec-Add-the-rkvdec-driver.patch
PATCHFILES += 0406-arm64-dts-rockchip-rk3399-Define-the-rockchip-Video-Decoder-node.patch
# https://patchwork.kernel.org/project/linux-rockchip/list/?series=216701
PATCHFILES += 0408-media-v4l2-ctrls-Add-the-__-v4l2_ctrl_s_ctrl_compound-helpers.patch
PATCHFILES += 0409-media-uapi-Add-VP9-stateless-decoder-controls.patch
PATCHFILES += 0410-media-rkvdec-Add-the-VP9-backend.patch
endif

ifeq (1,1)
# Rockchip: hantro vdec rk3328/3399 improvements 
# https://github.com/Kwiboo/linux-rockchip/compare/v4l2-5.4-from-5.5-v5.4...v4l2-5.4-work-in-progress-v5.4
PATCHFILES += 0430-media-uapi-h264-Add-DPB-entry-field-reference-flags.patch
PATCHFILES += 0431-media-hantro-Fix-H264-decoding-of-field-encoded.patch
PATCHFILES += 0432-media-hantro-rk3399-mpeg2-src_fmt.patch
PATCHFILES += 0433-media-hantro-g1-mpeg2-src_fmt.patch
PATCHFILES += 0434-media-hantro_vp8_src_fmt.patch
PATCHFILES += 0436-media-hantro-Add-support-for-H264-decoding-on-RK3399.patch
PATCHFILES += 0437-media-hantro-Enable-H264-decoding-on-RK3399.patch
PATCHFILES += 0438-media-hantro-Enable-H264-decoding-on-RK3328.patch
endif

ifeq (1,1)
# Rockchip: rk3328/3399 HDMI improvements (including 4k support)
# https://patchwork.freedesktop.org/series/71675/#rev2
PATCHFILES += 0451-phy-rockchip-inno-hdmi-use-correct-vco_div_5-macro-on-rk3328.patch
PATCHFILES += 0452-phy-rockchip-inno-hdmi-round-fractal-pixclock-in-rk3328-recalc_rate.patch
PATCHFILES += 0453-phy-rockchip-inno-hdmi-remove-unused-no_c-from-rk3328-recalc_rate.patch
PATCHFILES += 0454-phy-rockchip-inno-hdmi-do-not-power-on-rk3328-post-pll-on-reg-write.patch
PATCHFILES += 0455-phy-rockchip-inno-hdmi-force-set_rate-on-power_on.patch
PATCHFILES += 0456-drm-rockchip-dw-hdmi-allow-high-tmds-bit-rates.patch
PATCHFILES += 0457-drm-rockchip-dw-hdmi-require-valid-vpll-clock-rate-on-rk3228-rk3328.patch
PATCHFILES += 0458-clk-rockchip-set-parent-rate-for-DCLK_VOP-clock-on-rk3228.patch
PATCHFILES += 0459-arm64-dts-rockchip-increase-vop-clock-rate-on-rk3328.patch
PATCHFILES += 0460-arm64-dts-rockchip-add-vpll-clock-to-hdmi-node-on-rk3328.patch
PATCHFILES += 0461-ARM-dts-rockchip-add-vpll-clock-to-hdmi-node-on-rk3228.patch
PATCHFILES += 0462-drm-rockchip-dw-hdmi-limit-tmds-to-340mhz-on-rk3228-rk3328.patch
PATCHFILES += 0463-drm-rockchip-dw-hdmi-remove-unused-plat_data-on-rk3228-rk3328.patch
PATCHFILES += 0464-phy-rockchip-inno-hdmi-Support-more-pre-pll-configuration.patch
endif

ifeq (1,1)
# Allwinner H6: Support for USB3
PATCHFILES += 0522-arm64-allwinner-dts-h6-enable-USB3-port-on-Beelink-G.patch
# Allwinner H6: Misc patches
PATCHFILES += 0524-mmc-sunxi-fix-unusuable-eMMC-on-some-H6-boards-by-disabling-DDR.patch
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
PATCHFILES += 0622-media-cedrus-improvements.patch
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
	@$(MAKE) clean       -C ../wireless-regdb
