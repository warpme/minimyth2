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

PATCHFILES  = linux-5.10.patch.gar
PATCHFILES += linux-5.10-perl.patch.gar
PATCHFILES += linux-5.10-disable_dma_for_cfa.patch
PATCHFILES += linux-5.10-defaults.patch
PATCHFILES += linux-5.10-vgaarb-add-3D-accell-detection.patch

ifeq (1,1)
# Above is for disabling ALL patches

ifeq (1,1)
#-- Misc panfrost patches for 5.10 kernel -------------------
PATCHFILES += 0102-drm-panfrost-add-support-for-custom-soft-reset-on-GXM.patch
PATCHFILES += 0103-drm-panfrost-make-panfrost_job_run_rte_ERR_PTR.patch
# Add suport for tests on Bifrost
# https://github.com/superna9999/linux/commits/amlogic/v5.9/bifrost
PATCHFILES += 0105-Also-use-meson-hack-on-amlogic-meson-g12a-mali.patch
PATCHFILES += 0106-Sync-G31-features-with-kbase.patch
endif
ifeq (1,1)
# Switch GPU DVFS governors default as 'performance'
PATCHFILES += 0125-drm-lima-dvfs-switch-gov-to-performance.patch
PATCHFILES += 0126-drm-panfrost-dvfs-switch-gov-to-performance.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Amlogic patches -----------------------------------------
# Add HVEC decode from https://gitlab.com/baylibre/amlogic/atv/linux/-/commit/1f9a7f9904dfb58be623d1048f6dad3df7bf61f4
PATCHFILES += 0310-messon-vdec-add-hvec-support.patch
# increas CMA pool for 4k decode
PATCHFILES += 0311-arm64-dts-meson-set-dma-pool-to-896MB.patch
PATCHFILES += 0312-g12-set-cma-to-896MiB-for-4k.patch
# Amlogic: Misc patches
PATCHFILES += 0360-arm64-dts-meson-tanix-tx3-add-thermal-zones.patch
PATCHFILES += 0361-arm64-dts-meson-gxm-add-beelink-gt1.patch
PATCHFILES += 0367-arm64-dts-meson-sm1-add-common-ac2xx-dtsi.patch
PATCHFILES += 0368-arm64-dts-meson-sm1-add-support-for-X96-AIR.patch
PATCHFILES += 0369-arm64-dts-meson-sm1-add-support-for-CYX-A95XF3-AIR.patch
# hack to fix non-working Eth on some boxes
# https://patchwork.kernel.org/project/linux-amlogic/list/?series=421715
PATCHFILES += 0370-arm64-dts-amlogic-revert-add-missing-ethernet-resetID.patch
# Add more GX soundcards
# https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=320553
PATCHFILES += 0373-arm64-dts-meson-add-more-GX-soundcards.patch
# Add more G12/SM1 soundcards
# https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=320731
PATCHFILES += 0374-arm64-dts-meson-add-more-G12-SM1-soundcards.patch
# Improve perf. on G12 and newer
# https://patchwork.kernel.org/project/linux-amlogic/list/?series=410053 06.01.2021
PATCHFILES += 0375-net-dwmac-meson8b-picosecond-precision-RX-delay-support.patch
# https://patchwork.kernel.org/project/linux-amlogic/list/?series=384505
PATCHFILES += 0376-thermal-amlogic-Add-hwmon-support.patch
# Fixes non-working EGLFS DRM_PRIME/DRM Planes on all Amlogic HW I have
PATCHFILES += 0377-drm-meson-swap-primary-overlay-zpos.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Allwinner patches -----------------------------------------
# Audio patches From LE 19.01.2021
PATCHFILES += 0500-ASoC-hdmi-codec-fix-channel-allocation.patch
PATCHFILES += 0501-ASoC-sun4i-i2s-Change-set_chan_cfg-params.patch
PATCHFILES += 0502-ASoC-sun4i-i2s-Add-support-for-H6-I2S.patch
PATCHFILES += 0503-ASoC-sun4i-i2s-Change-get_sr-and-get_wss-to-be-more-.patch
PATCHFILES += 0504-ASoC-sun4i-i2s-Set-sign-extend-sample.patch
PATCHFILES += 0505-ASoC-sun4i-i2s-Add-20-and-24-bit-support.patch
PATCHFILES += 0506-ASoC-sun4i-i2s-Fix-sun8i-volatile-regs.patch
PATCHFILES += 0507-ASoC-sun4i-i2s-Fix-setting-of-FIFO-modes.patch
PATCHFILES += 0508-ASoC-sun4i-i2s-fix-coding-style-for-callback-definit.patch
PATCHFILES += 0509-ASoC-sun4i-i2s-Add-parenthesis-around-macro-argument.patch
PATCHFILES += 0510-ASoC-sun4i-i2s-WiP-multi-channel.patch
PATCHFILES += 0511-arm64-dts-sun50i-h6-dtsi-add-sound-node.patch
PATCHFILES += 0512-arm64-dts-sun50i-h6-dtsi-add-frame-inversion-to-correct-multi-channel.patch
# Cedrus patches From LE 19.01.2021
PATCHFILES += 0516-media-uapi-hevc-Add-scaling-matrix-control.patch
PATCHFILES += 0517-media-cedrus-hevc-Add-support-for-scaling-matrix.patch
PATCHFILES += 0518-media-uapi-hevc-Add-segment-address-field.patch
PATCHFILES += 0519-media-cedrus-hevc-Add-support-for-multiple-slices.patch
PATCHFILES += 0520-media-cedrus-hevc-tiles-hack.patch
PATCHFILES += 0521-media-cedrus-Add-callback-for-buffer-cleanup.patch
PATCHFILES += 0522-media-cedrus-hevc-Improve-buffer-management.patch
PATCHFILES += 0523-media-cedrus-h264-Improve-buffer-management.patch
PATCHFILES += 0524-media-cedrus-WiP-10-bit-HEVC-support.patch
PATCHFILES += 0525-media-cedrus-add-check-for-H264-and-HEVC-limitations.patch
PATCHFILES += 0526-media-cedrus-Add-support-for-VP8-decoding.patch
PATCHFILES += 0527-media-cedrus-Add-support-for-R40.patch
# From LE 19.01.2021
PATCHFILES += 0528-drm-dw-hdmi-cec-sleep-100ms-on-error.patch
# Disabled as casues black screen in drm planes playback
# PATCHFILES += 0529-gpu-drm-sun4i-hdmi-mixer-improvements.patch
# Adding support for MFD devices on some H6 boards
PATCHFILES += 0530-mfd-add-AC200.patch
PATCHFILES += 0531-arm64-dts-sun50i-h6.dtsi-add-ac200-nodes.patch
# Fix hanging GS1 boot on loading kernel modules
PATCHFILES += 0532-arm64-dts-allwinner-fix-eMMC-on-beelink-GS1.patch
# Improvements and addidtions for some H6 boards
PATCHFILES += 0533-arm64-dts-Tanix-TX6-improvements.patch
PATCHFILES += 0534-arm64-dts-allwinner-add-Eeachlink-H6-Mini.patch
# Add TanixTX6 Mini (WiFi still not working :-( )
PATCHFILES += 0535-arm64-dts-allwinner-add-Tanix-Tx6-Mini.patch
# Allwinner: enable H6 GPU DVFS
PATCHFILES += 0536-arm64-dts-allwinner-h6-Add-cooling-map-for-GPU.patch
PATCHFILES += 0537-arm64-dts-allwinner-h6-Add-GPU-OPP-table.patch
# Video BT2020 support. From LE 19.01.2021
PATCHFILES += 0538-drm-sun4i-Add-support-for-BT2020-to-DE3.patch
PATCHFILES += 0550-media-sunxi-cir-allow-timeout-to-be-set-at-runtime.patch
# Crust support from LE 17.01.2021
PATCHFILES += 0551-allwinner-add-crust-support.patch
PATCHFILES += 0552-arm64-dts-ARM-dts-allwinner-a64-h3-h6-add-crust-support.patch
# hack for dead Eth after resume from sleep
PATCHFILES += 0553-dwmac-sun8i-hack-for-dead-Eth-on-crust-resume.patch
# hack for fixng distorted screen on X11/Glamour
PATCHFILES += 0554-drm-sun4i-report-no-midifiers.patch
# Add hw deinterlce support from 17.01.2021
PATCHFILES += 0560-H6-add-sun50i-di-deinterlace-WiP.patch
PATCHFILES += 0561-arm64-dts-h6-add-deinterlace-node.patch
PATCHFILES += 0562-mmc-sunxi-mmc-Ensure-host-is-suspended-during-system.patch
PATCHFILES += 0563-arm-dts-sun8i-r40-Add-deinterlace-node.patch
PATCHFILES += 0564-arm64-dts-allwinner-h5-Add-deinterlace-node.patch
# H6 4k hdmi signal stability improvements
# https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=430883
PATCHFILES += 0565-sunxi-fix-H6-HDMI-related-issues.patch
# h616 initial support
# https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=416431 v3 18.01.2021
PATCHFILES += 0568-clk-sunxi-ng-h6-r-add-R_APB2_RSB-clock-and-reset.patch
PATCHFILES += 0570-arm64-sunxi-Initial-Allwinner-H616-SoC-support.patch
PATCHFILES += 0571-phy-sun4i-usb-remove-enable_pmu_unk1-from-sun50i_h6_cfg.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Rockchip patches -----------------------------------------
# Inc.some clocks on rk3328
PATCHFILES += 0702-arm64-dts-rockchip-inc-cpu-clock-add-gpu-DVFS-on-rk3328.patch
# Enable rkvdec on rk3328
PATCHFILES += 0703-arm64-dts-rockchip-enable-rkvdec-on-rk3328.patch
# DRM fixes from LE
PATCHFILES += 0704-gpu-drm-rockchip-fixes-from-LE.patch
# adds support for high profile10, 4:2:2 and deinterlaced h264 decode on rkvdec
# https://github.com/Kwiboo/linux-rockchip/commits/linuxtv-rkvdec-work-in-progress
# https://github.com/knaerzche/linux/commit/2d9e1a5b0b2ca9dfae43f30d80d014605337cf2a
# https://github.com/knaerzche/linux/commit/68c947da3affcfdf48699008b5869325e15bfdcd
PATCHFILES += 0705-media-rkvdec-hantro-add-interlaced-h264-support.patch
# Add hvec support for Rockchip rkvdec
PATCHFILES += 0706-media-rkvdec-add-hevc-support.patch
# Support for 4k modes
# https://github.com/Kwiboo/linux-rockchip/commits/v5.10.1-drm-rockchip-hack 17.12.2020
PATCHFILES += 0711-drm-rockchip-add-4k-videomodes-support.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- RaspberryPI patches -----------------------------------------
# Hack for adding H264 v4l2 decoding on RPI
PATCHFILES += 0900-rpi-vc04_services-add_h264_v4l2-m2m_decode-14112020.patch
# Fix building V3D for rpi4
PATCHFILES += 0901-drm-v3d-fix-Kconfig.patch
# Support for 2xHDMI audio on RPI4
PATCHFILES += 0902-rpi-vc04_services-update-audio-for-rpi4-14112020.patch
# Some hacks for rpi4
PATCHFILES += 0906-vc4_hdmi-Move-hdmi-reset-to-bind.patch
PATCHFILES += 0907-drm-v3d-hack-to-enable-v3d-on-rpi4.patch
endif
#------------------------------------------------------------

endif # for all patches

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
