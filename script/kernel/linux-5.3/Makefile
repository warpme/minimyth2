
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

PATCHFILES  = linux-5.3.patch.gar
PATCHFILES += linux-5.3-perl.patch.gar
PATCHFILES += linux-5.3-disable_dma_for_cfa.patch
PATCHFILES += linux-5.3-defaults.patch
PATCHFILES += linux-5.3-vgaarb-add-3D-accell-detection.patch
PATCHFILES += linux-5.3-net-smsc95xx-allow-mac-address-as-param.patch

# Generic HDMI audio patches for dw-hdmi controller
PATCHFILES += 0201-drm-dw-hdmi-extract-dw_hdmi_connector_update_edid.patch
PATCHFILES += 0202-drm-dw-hdmi-move-dw_hdmi_connector_detect.patch
PATCHFILES += 0203-drm-dw-hdmi-update-CEC-phys-addr-and-EDID-on-HPD-eve.patch
PATCHFILES += 0204-Revert-drm-edid-make-drm_edid_to_eld-static.patch
PATCHFILES += 0205-drm-dw-hdmi-update-ELD-on-HPD-event.patch
PATCHFILES += 0206-ASoC-hdmi-codec-add-hdmi_codec_eld_notify.patch
PATCHFILES += 0207-drm-dw-hdmi-add-dw_hdmi_update_eld-callback.patch
PATCHFILES += 0208-drm-dw-hdmi-i2s-add-.get_eld-callback-for-ALSA-SoC.patch
PATCHFILES += 0209-drm-bridge-dw-hdmi-Use-AUTO-CTS-setup-mode-when-non-.patch
PATCHFILES += 0210-ASoC-hdmi-codec-reorder-channel-allocation-list.patch
PATCHFILES += 0211-drm-dw-hdmi-i2s-add-multi-channel-lpcm-support.patch
PATCHFILES += 0212-drm-dw-hdmi-call-hdmi_set_cts_n-after-clock-is-enabl.patch
PATCHFILES += 0214-ASoC-hdmi-codec-fix-chmap-idx.patch
PATCHFILES += 0215-WIP-dw-hdmi-cec-sleep-100ms-on-error.patch

# Amlogic speciffic patches to enable hdmi audio
PATCHFILES += 0309-arm64-dts-meson-gx-add-vdec-entry.patch
PATCHFILES += 0310-arm64-dts-meson-add-vdec-entries.patch
PATCHFILES += 0301-ASoC-meson-add-meson-audio-core-driver.patch
PATCHFILES += 0302-ASoC-meson-add-register-definitions.patch
PATCHFILES += 0303-ASoC-meson-add-initial-aiu-i2s-support.patch
PATCHFILES += 0304-ASoC-meson-add-initial-spdif-support.patch
PATCHFILES += 0305-ARM64-dts-meson-gx-add-audio-controller-nodes.patch
PATCHFILES += 0306-snd-meson-activate-HDMI-audio-path.patch
PATCHFILES += 0307-ARM64-dts-meson-gx-add-sound-dai-cells-to-HDMI-node.patch
PATCHFILES += 0308-ARM64-dts-meson-activate-hdmi-audio-HDMI-enabled-boa.patch
# fix for panfrost power bug in amlogic gxm
PATCHFILES += 0320-WIP-drm-panfrost-add-support-for-custom-soft-reset-on-GXM.patch
PATCHFILES += 0321-WIP-drm-panfrost-kernel-driver-fix-1.patch
PATCHFILES += 0322-WIP-drm-panfrost-kernel-driver-fix-2.patch

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

# Allwinner H6 patches
PATCHFILES += 0800-Add-AC200-EPHY-support.patch
#PATCHFILES += 0800-ASoC-sun4i-i2s-multichannel-updates.patch
#PATCHFILES += 0801-ASoC-sun4i-i2s-multichannel-updates-fixes.patch
PATCHFILES += 0802-ccu-sun50i-h6-allow-changing-gpu-parent-rate.patch
PATCHFILES += 0803-sun50i-h6-add-mali-node.patch
PATCHFILES += 0805-sun50i-h6-sound-hack.patch
PATCHFILES += 0807-add-orange-pi-3.patch
PATCHFILES += 0808-arm64-dts-allwinner-OrangePiOnePlus-updates.patch
PATCHFILES += 0809-arm64-dts-allwinner-add-Tanix-TX6-WIP.patch
PATCHFILES += 0812-arm64-dts-allwinner-add-h6-eachlink-h6mini.patch
PATCHFILES += 0813-arm64-dts-allwinner-add-h6-qplus.patch
PATCHFILES += 0816-thermal-Thermal-sensor-driver-for-Allwinner-H6.patch
PATCHFILES += 0818-arm64-dts-allwinner-h6-Add-thermal-sensor-DTS-nodes.patch
PATCHFILES += 0819-arm64-dts-allwinner-h6-Add-clock-to-CPU-cores.patch
PATCHFILES += 0820-arm64-dts-allwinner-h6-Add-CPU-Operating-Performance.patch
PATCHFILES += 0821-Use-the-OPP-table-for-the-worst-bin.patch
PATCHFILES += 0826-Add-mali-GPU-supply-for-H6-boards.patch

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	utils/bc \

DEPENDS = \
	kernel-headers/linux-headers \
	kernel/linux-firmware \
	kernel/linux-firmware-meson \
	$(if $(filter arm arm64,$(mm_GARCH_FAMILY)),bootloaders/u-boot-tools) \

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
