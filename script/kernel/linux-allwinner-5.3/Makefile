
#--Use this for mainline official x.y.z kernel----
ifeq (1,1)
MASTER_SITES        = https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/snapshot/
DISTFILES           = linux-$(LINUX_VERSION).tar.gz $(CONFIGFILE)
WORKSRC             = $(WORKDIR)/linux-$(LINUX_VERSION)
endif
#-------------------------------------------

#--Use this for clement peron kernel--
ifeq (0,1)
MASTER_SITES        = https://github.com/clementperon/linux/archive/
DISTFILES           = $(GITHASH).tar.gz $(CONFIGFILE)
WORKSRC             = $(WORKDIR)/linux-$(GITHASH)
endif
#-------------------------------------------

GARNAME = linux-allwinner
GARVERSION = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),$(if $(filter-out 0,$(LINUX_TEENY_VERSION)),.$(LINUX_TEENY_VERSION)))$(LINUX_EXTRA_VERSION)
CATEGORIES = kernel-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)

CONFIGFILE = linux-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)-$(GARCH_FAMILY)-$(GARCH).config

PATCHFILES  = linux-5.3.patch.gar
PATCHFILES += linux-5.3-perl.patch.gar
PATCHFILES += linux-5.3-disable_dma_for_cfa.patch
PATCHFILES += linux-5.3-defaults.patch
PATCHFILES += linux-5.3-vgaarb-add-3D-accell-detection.patch
PATCHFILES += linux-5.3-net-smsc95xx-allow-mac-address-as-param.patch

# fix for panfrost power bug
ifeq (1,1)
# Patches required by Panfrost to operate
PATCHFILES += 0100-iommu-Fix-alloc_io_pgtable_ops-for-ARM_MALI_LPAE-on-.patch
PATCHFILES += 0101-fix-io-alloc-for-non-48bit.patch
PATCHFILES += 0102-WIP-drm-panfrost-add-support-for-custom-soft-reset-on-GXM.patch
# Some Lima fixes
PATCHFILES += 0103-drm-lima-Mark-64-bit-number-as-ULL.patch
PATCHFILES += 0104-drm-lima-Reduce-the-amount-of-logs-on-deferred-probe.patch
PATCHFILES += 0105-drm-lima-Reduce-number-of-PTR_ERR-calls.patch
PATCHFILES += 0106-drm-lima-Reduce-the-amount-of-logs-on-deferred-probe.patch
PATCHFILES += 0107-drm-lima-drop-DRM_AUTH-usage-from-the-driver.patch
endif

# HDMI audio support on H6
# Based on https://patchwork.kernel.org/patch/11093285/
PATCHFILES += 0500-ASoC-sun4i-i2s-Updates-to-the-driver.patch
PATCHFILES += 0501-arm64-dts-sun50i-h6-Add-HDMI-audio-to-H6-DTSI.patch
# Support for USB3 on H6
PATCHFILES += 0510-phy-allwinner-add-phy-driver-for-USB3-PHY-on-Allwinn.patch
PATCHFILES += 0511-arm64-allwinner-dts-h6-add-USB3-device-nodes.patch
PATCHFILES += 0512-arm64-allwinner-dts-h6-enable-USB3-port-on-Beelink-G.patch
# Enable DDC support on H6
PATCHFILES += 0513-add-DDC-glue-in-dw-hdmi.patch
PATCHFILES += 0514-arm64-dts-allwinner-add-DDC-regulator-for-BeelinkGS1.patch
# Misc patches for H6
PATCHFILES += 0515-Allwinner-A64-H6-IR-support.patch
PATCHFILES += 0516-Allwinner-H6-Add-Mali-GPU-for-H6-boards.patch
PATCHFILES += 0517-pwm-sun4i-Add-support-for-Allwinner-H6.patch
PATCHFILES += 0518-bus-sunxi-rsb-Make-interrupt-handling-more-robust.patch
# Add some new H6 boards
PATCHFILES += 0519-arm64-dts-allwinner-add-Tanix-TX6-WIP.patch
PATCHFILES += 0520-arm64-dts-allwinner-add-h6-eachlink-h6mini.patch
PATCHFILES += 0521-arm64-dts-allwinner-add-h6-qplus.patch
# Add support for RTC in H6
PATCHFILES += 0522-rtc-sun6i-Add-support-for-H6-RTC.patch
PATCHFILES += 0523-arm64-dts-sun50i-h6-Add-support-for-RTC-and-fix-the-.patch
PATCHFILES += 0524-dt-bindings-Add-compatible-for-H6-RTC.patch
# Add AC200 for Eachlink H6
PATCHFILES += 0525-allwinner-h6-add-AC200-EPHY-support.patch
PATCHFILES += 0526-arm64-dts-sun50i-h6-add-AC200-EPHY-support.patch

ifeq (1,1)
# Add H265 in Allwinner Cedrus
PATCHFILES += 0527-media-v4l-Add-definitions-for-the-HEVC-slice-control.patch
PATCHFILES += 0528-media-pixfmt-Add-HEVC-slice-pixel-format.patch
PATCHFILES += 0529-media-pixfmt-Document-the-HEVC-slice-pixel-format.patch
PATCHFILES += 0530-media-cedrus-Add-HEVC-H.265-decoding-support.patch
endif

ifeq (1,1)
# Add thermal support in H6
PATCHFILES += 0535-arm64-dts-allwinner-h6-Add-clock-to-CPU-cores.patch
PATCHFILES += 0536-arm64-dts-allwinner-h6-Add-CPU-OPP-table.patch
PATCHFILES += 0537-thermal-sun8i-add-thermal-driver-for-H6-H5-H3-A64-R4.patch
PATCHFILES += 0538-thermal-sun8i-Rename-calib-calibration.patch
PATCHFILES += 0539-thermal-sun8i-Fix-thermal-zone-registration-check.patch
PATCHFILES += 0540-thermal-sun8i-Lower-rate-of-sensor-data-interrupts-t.patch
PATCHFILES += 0541-thermal-sun8i-Rework-scale-offset-values-H6-calibrat.patch
PATCHFILES += 0542-thermal-sun8i-Set-mod-clock-to-24MHz.patch
PATCHFILES += 0543-thermal-sun8i-Thermal-sensor-on-H6-needs-undocumment.patch
PATCHFILES += 0544-thermal-sun8i-Add-support-for-A83T.patch
PATCHFILES += 0545-thermal-sun8i-Add-some-comments-about-H3.patch
PATCHFILES += 0546-arm64-dts-allwinner-sun50i-h6-Add-thermal-sensor-and.patch
PATCHFILES += 0547-arm64-dts-allwinner-sun50i-h6-Add-thermal-trip-point.patch
endif

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
