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

PATCHFILES  = linux-5.13.patch.gar
PATCHFILES += linux-5.13-perl.patch.gar
PATCHFILES += linux-5.13-disable_dma_for_cfa.patch
PATCHFILES += linux-5.13-defaults.patch
PATCHFILES += linux-5.13-vgaarb-add-3D-accell-detection.patch

ifeq (1,1)

# Add hevc v4l2_request crtl fields used by Allwinner/Rockchip/Broadcom
PATCHFILES += 0101-include-media-hevc-uapi-add-aw-rk-brcm-fields.patch

ifeq (1,1)
# Misc panfrost patches for 5.13 kernel
PATCHFILES += 0102-drm-panfrost-add-support-for-custom-soft-reset-on-GXM.patch
PATCHFILES += 0103-drm-panfrost-make-panfrost_job_run_rte_ERR_PTR.patch
PATCHFILES += 0110-drivers-net-wireless-brcmfmac-add-ap6330-firmware.patch
endif

ifeq (1,1)
# Switch GPU DVFS governors default as 'performance'
PATCHFILES += 0125-drm-lima-dvfs-switch-gov-to-performance.patch
PATCHFILES += 0126-drm-panfrost-dvfs-switch-gov-to-performance.patch
endif

ifeq (1,1)
#-- Amlogic patches -----------------------------------------
# Add HVEC decode from https://gitlab.com/baylibre/amlogic/atv/linux/-/commit/1f9a7f9904dfb58be623d1048f6dad3df7bf61f4
PATCHFILES += 0310-messon-vdec-add-hvec-support.patch
# increas CMA pool for 4k decode
PATCHFILES += 0311-arm64-dts-meson-set-dma-pool-to-896MB.patch
PATCHFILES += 0312-g12-set-cma-to-896MiB-for-4k.patch
# fixing a lot of the hangs on hevc decoding
PATCHFILES += 0313-meson-vdec-HEVC-decoder-add-handling-to-show-frames-when-ready.patch
# Amlogic: Misc patches
PATCHFILES += 0360-arm64-dts-meson-tanix-tx3-add-thermal-zones.patch
PATCHFILES += 0361-arm64-dts-meson-gxm-add-beelink-gt1.patch
PATCHFILES += 0367-arm64-dts-meson-sm1-add-common-ac2xx-dtsi.patch
PATCHFILES += 0368-arm64-dts-meson-sm1-add-support-for-X96-AIR.patch
PATCHFILES += 0369-arm64-dts-meson-sm1-add-support-for-CYX-A95XF3-AIR.patch
# add support for radxa zero board
PATCHFILES += 0370-arm64-dts-meson-g12a-add-support-for-radxa-zero.patch
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
# https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=468401
PATCHFILES += 0380-drm-dw-hdmi-disable-loading-DW-HDMI-CEC-sub-driver-on-some-SoC.patch
# fix to get ap6256 working on amlogic
PATCHFILES += 0381-drivrs-mmc-revert-g103a5348c-to-fix-some-wifi.patch
# https://patchwork.kernel.org/project/linux-amlogic/list/?series=523623
PATCHFILES += 0382-arm64-dts-meson-Add-Reset-controller-to-Ethernet-PHY.patch
# fix for wrong colors on SM1 when vendor uboot is used
PATCHFILES += 0383-drm-meson-fix-colours-from-HDR-set-durring-vendor-uboot.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Allwinner patches -----------------------------------------
# Audio patches From LE 19.01.2021
PATCHFILES += 0500-ASoC-hdmi-codec-fix-channel-allocation.patch
PATCHFILES += 0510-ASoC-sun4i-i2s-WiP-multi-channel.patch
PATCHFILES += 0511-arm64-dts-sun50i-h6-dtsi-add-sound-node.patch
PATCHFILES += 0512-arm64-dts-sun50i-h6-dtsi-add-frame-inversion-to-correct-multi-channel.patch
PATCHFILES += 0514-arm64-dts-enable-audio-gs1.patch
# Cedrus patches From LE 19.01.2021
PATCHFILES += 0516-media-uapi-hevc-Add-scaling-matrix-control.patch
PATCHFILES += 0517-media-cedrus-hevc-Add-support-for-scaling-matrix.patch
PATCHFILES += 0519-media-cedrus-hevc-Add-support-for-multiple-slices.patch
PATCHFILES += 0520-media-cedrus-hevc-tiles-hack.patch
PATCHFILES += 0521-media-cedrus-Add-callback-for-buffer-cleanup.patch
PATCHFILES += 0522-media-cedrus-hevc-Improve-buffer-management.patch
PATCHFILES += 0523-media-cedrus-h264-Improve-buffer-management.patch
PATCHFILES += 0524-media-cedrus-WiP-10-bit-HEVC-support.patch
PATCHFILES += 0525-media-cedrus-add-check-for-H264-and-HEVC-limitations.patch
# add VC1 decode support
# https://github.com/jernejsk/linux-1/commits/vc1
PATCHFILES += 0526-media-cedrus-add-VC1-decode-support.patch
# From LE 19.01.2021
PATCHFILES += 0529-drm-dw-hdmi-cec-sleep-100ms-on-error.patch
# Adding support for MFD devices on some H6 boards
PATCHFILES += 0530-mfd-add-AC200.patch
PATCHFILES += 0531-arm64-dts-sun50i-h6.dtsi-add-ac200-nodes.patch
# Fix hanging GS1 boot on loading kernel modules
PATCHFILES += 0532-arm64-dts-allwinner-gs1-fix-eMMC-and-incr-vcpu-limit.patch
# Improvements and addidtions for some H6 boards
PATCHFILES += 0533-arm64-dts-Tanix-TX6-enable-eth-emmc-wifi.patch
PATCHFILES += 0534-arm64-dts-allwinner-add-Eeachlink-H6-Mini.patch
# Add TanixTX6 Mini (WiFi still not working :-( )
PATCHFILES += 0535-arm64-dts-allwinner-add-Tanix-Tx6-Mini.patch
# Allwinner: enable H6 GPU DVFS
PATCHFILES += 0536-arm64-dts-allwinner-h6-Add-cooling-map-for-GPU.patch
PATCHFILES += 0537-arm64-dts-allwinner-h6-Add-GPU-OPP-table.patch
# https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=470633
PATCHFILES += 0538-arm64-dts-allwinner-H6-USB3-device-tree-updates.patch
# https://github.com/smaeul/linux/commits/patch/rsb-extra
PATCHFILES += 0550-allwinner-add-rsb-extra.patch
# Crust support from https://github.com/crust-firmware/linux/commits/crust 15.05.2021
PATCHFILES += 0551-allwinner-add-crust-support.patch
PATCHFILES += 0552-arm64-dts-ARM-dts-allwinner-h3-h5-h6-enable-crust.patch
# hack for fixng distorted screen on X11/Glamour
PATCHFILES += 0554-drm-sun4i-report-no-midifiers.patch
# Add hw deinterlce support from 17.01.2021
PATCHFILES += 0560-H6-add-sun50i-di-deinterlace-WiP.patch
PATCHFILES += 0561-arm64-dts-h6-add-deinterlace-node.patch
# hacks for h616 initial support (fast Eth, USB, HDMI)
# https://github.com/jernejsk/linux-1/commits/h616-hdmi
PATCHFILES += 0570-drivers-h616-wip-add-usb-emac2-hdmi-support.patch
# add ths support
PATCHFILES += 0571-drivers-thermal-allwinner-add-h616-ths-support.patch
# add support for xr819 wifi https://github.com/jernejsk/linux-1/tree/0e2dbeef9b05d5bd285d7fb2cf5bde1bb212c96d
PATCHFILES += 0580-net-wireless-add-xr819-support-07072021.patch
# add support for rtl8822bs/8822cs by rtw88 https://github.com/jernejsk/linux-1/commits/rtw88-sdio
PATCHFILES += 0581-net-wireless-add-rt8822-support-24072021.patch
# enable some h616 boards
PATCHFILES += 0590-arm64-dts-allwinner-h616-add-dtsi.patch
PATCHFILES += 0591-arm64-dts-allwinner-h616-add-OrangePi-Zero2.patch
PATCHFILES += 0594-arm64-dts-allwinner-h616-add-X96-Mate-TVbox.patch
PATCHFILES += 0595-arm64-dts-allwinner-h616-add-Tanix-TX6s-TVbox.patch
PATCHFILES += 0596-arm64-dts-allwinner-h616-add-T95-TVbox.patch
PATCHFILES += 0597-arm64-dts-allwinner-h616-enable-ths-support.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- Rockchip patches -----------------------------------------
# Inc.some clocks on rk3328
PATCHFILES += 0702-arm64-dts-rockchip-inc-cpu-clock-add-gpu-DVFS-on-rk3328.patch
# Enable rkvdec on rk3328
PATCHFILES += 0703-arm64-dts-rockchip-enable-rkvdec-on-rk3328.patch
# adds support for high profile10, 4:2:2 and deinterlaced h264 decode on rkvdec
# https://github.com/Kwiboo/linux-rockchip/commits/linuxtv-rkvdec-work-in-progress
# https://github.com/knaerzche/linux/commit/2d9e1a5b0b2ca9dfae43f30d80d014605337cf2a
# https://github.com/knaerzche/linux/commit/68c947da3affcfdf48699008b5869325e15bfdcd
PATCHFILES += 0705-media-rkvdec-hantro-add-interlaced-h264-support.patch
# Add hvec support for Rockchip rkvdec
# update rkvdec to code from https://github.com/knaerzche/LibreELEC.tv/tree/rk-fixes-b2
PATCHFILES += 0707-media-rkvdec-add-hevc-support.patch
# Improve rkvdec stability on rk3399 for hevc stream errors
PATCHFILES += 0708-media-rkvdec-dec-clocks-for-stability.patch
# Support for 4k modes
PATCHFILES += 0711-drm-rockchip-add-4k-videomodes-support.patch
# enhacements from https://github.com/knaerzche/linux/commits/v5.10.26-rk-10-bit
PATCHFILES += 0712-media-rockchip-add-hw-deinterlace-support.patch
PATCHFILES += 0713-arm64-dts-rockchip-enable-iep-on-rk3328-rk3399.patch
PATCHFILES += 0714-arm64-dts-add-enable-spdif-on-rk3328.patch
PATCHFILES += 0718-arm64-dts-rockchip-disable-rkvdec_iommu_reset-rk3328-rk3399.patch
PATCHFILES += 0720-arm64-dts-enable-dwmmc-on-rk3328.patch
endif
#------------------------------------------------------------

ifeq (1,1)
#-- RaspberryPI patches -----------------------------------------
# Hack for adding H264 v4l2 decoding on RPI
PATCHFILES += 0900-rpi-vc04_services-add_h264_v4l2-m2m_decode-14112020.patch
# V3d enablement in RPI4
# https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=434471
PATCHFILES += 0901-Raspberry-PI-4-V3D-enablement.patch
# small updates to v4l2_m2m
PATCHFILES += 0903-rpi-vc04_services-add_h264_v4l2-m2m_decode-14032021.patch
# add H265 rpivid driver
PATCHFILES += 0904-media-add-rpivid-24022021.patch
# https://github.com/raspberrypi/linux/pull/4238/commits
PATCHFILES += 0905-staging-bcm2835-camera-Add-support-for-H264-levels-4.1-and-4.2.patch
PATCHFILES += 0906-staging-bcm2835-codec-Pass-corrupt-frame-flag.patch
PATCHFILES += 0907-staging-bcm2835-codec-Set-colourspace-appropriat-for-RGB-fmt.patch
PATCHFILES += 0908-staging-bcm2835-codec-Fix-support-for-levels-4.1-and-4.2.patch
# fix for flip_dome timeouts on rpi4
PATCHFILES += 0909-drm-vc4-Fix-non-blocking-commit-getting-stuck-forever.patch
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
