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

PATCHFILES  = linux-5.11.patch.gar
PATCHFILES += linux-5.11-perl.patch.gar
PATCHFILES += linux-5.11-disable_dma_for_cfa.patch
PATCHFILES += linux-5.11-defaults.patch
PATCHFILES += linux-5.11-vgaarb-add-3D-accell-detection.patch

ifeq (1,1)

ifeq (1,1)
# Misc panfrost patches for 5.11 kernel
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

ifeq (1,1)
# Amlogic: vdec various patches
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
# hack to fix non-working Eth on sm1 x96air
PATCHFILES += 0370-arm64-dts-amlogic-disable-ethernet-reset-on-sm1.patch
# Add more GX soundcards
# Add more G12/SM1 soundcards
# https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=320731
PATCHFILES += 0374-arm64-dts-meson-add-more-G12-SM1-soundcards.patch
# Improve perf. on G12 and newer
# https://patchwork.kernel.org/project/linux-amlogic/list/?series=384491
PATCHFILES += 0375-net-dwmac-meson8b-picosecond-precision-RX-delay-support.patch
endif

# Allwinner patches
ifeq (1,1)
# fix from LE slack 9:14AM 23.12.2020
PATCHFILES += 0506-media-sunxi-cedrus-fix.patch

# Fix hanging GS1 boot on loading kernel modules
PATCHFILES += 0508-arm64-dts-allwinner-fix-eMMC-on-beelink-GS1.patch
# Adding support for some H6 boards
PATCHFILES += 0509-mfd-add-AC200.patch
PATCHFILES += 0510-arm64-dts-sun50i-h6.dtsi-add-ac200-nodes.patch

PATCHFILES += 0513-arm64-dts-Tanix-TX6-improvements.patch
PATCHFILES += 0514-arm64-dts-allwinner-add-Eeachlink-H6-Mini.patch

# Add TanixTX6 Mini (WiFi still not working :-( )
PATCHFILES += 0515-arm64-dts-allwinner-add-Tanix-Tx6-Mini.patch
endif

ifeq (1,1)
# Allwinner: enable H6 GPU DVFS
PATCHFILES += 0516-arm64-dts-allwinner-h6-Add-cooling-map-for-GPU.patch
PATCHFILES += 0517-arm64-dts-allwinner-h6-Add-GPU-OPP-table.patch
endif


# Rockchip patches
ifeq (1,1)
# Inc.some clocks on rk3328
PATCHFILES += 0702-arm64-dts-rockchip-inc-cpu-clock-add-gpu-DVFS-on-rk3328.patch
# Enable rkvdec on rk3328
PATCHFILES += 0703-arm64-dts-rockchip-enable-rkvdec-on-rk3328.patch
# Support for 4k modes
# https://github.com/Kwiboo/linux-rockchip/commits/v5.10.1-drm-rockchip-hack
PATCHFILES += 0711-drm-rockchip-vop-fix-crtc-duplicate-state.patch
PATCHFILES += 0712-drm-rockchip-vop-filter-modes-outside-0.5-pixel-cloc.patch
PATCHFILES += 0713-drm-rockchip-vop-filter-interlaced-modes.patch
PATCHFILES += 0714-drm-rockchip-vop-define-max-output-resolution-suppor.patch
PATCHFILES += 0715-drm-rockchip-vop-filter-modes-above-max-output-suppo.patch
PATCHFILES += 0716-drm-rockchip-dw_hdmi-adjust-cklvl-txlvl-for-RF-EMI.patch
PATCHFILES += 0717-drm-rockchip-dw_hdmi-add-phy_config-for-594Mhz-pixel.patch
PATCHFILES += 0718-drm-rockchip-dw_hdmi-Set-cur_ctr-to-0-always.patch
PATCHFILES += 0719-drm-rockchip-dw_hdmi-Use-auto-generated-tables.patch
PATCHFILES += 0720-drm-rockchip-dw-hdmi-limit-tmds-to-340mhz.patch
PATCHFILES += 0721-drm-rockchip-dw-hdmi-limit-resolution-to-3840x2160.patch
PATCHFILES += 0722-drm-rockchip-dw-hdmi-allow-high-tmds-bit-rates.patch
PATCHFILES += 0723-drm-rockchip-dw-hdmi-remove-unused-plat_data-on-rk32.patch
PATCHFILES += 0724-drm-rockchip-dw-hdmi-encoder-error-handling.patch
PATCHFILES += 0725-clk-rockchip-set-parent-rate-for-DCLK_VOP-clock-on-r.patch
PATCHFILES += 0726-arm64-dts-rockchip-increase-vop-clock-rate-on-rk3328.patch
PATCHFILES += 0727-drm-rockchip-vop-split-rk3288-vop.patch
PATCHFILES += 0728-ARM-dts-rockchip-split-rk3288-vop.patch
PATCHFILES += 0729-HACK-clk-rockchip-rk3288-dedicate-npll-for-vopb-and-.patch
PATCHFILES += 0730-HACK-clk-rockchip-rk3288-use-npll-table-to-to-improv.patch
PATCHFILES += 0731-HACK-clk-rockchip-rk3288-add-more-npll-clocks.patch
PATCHFILES += 0732-HACK-clk-rockchip-rk3399-dedicate-vpll-for-vopb-and-.patch
PATCHFILES += 0733-HACK-dts-rockchip-do-not-use-vopl-for-hdmi.patch
endif

# Fix building V3D for rpi4
PATCHFILES += 0901-drm-v3d-fix-Kconfig.patch
# Support for 2xHDMI audio on RPI4
#PATCHFILES += 0902-rpi-vc04_services-update-audio-for-rpi4-14112020.patch
# Some additions to rpi4 DT
PATCHFILES += 0904-arm-dts-bcm2711-rpi4-dt-additions.patch
# drm/v3d: Minor improvements
# https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=405969
PATCHFILES += 0905-drm-v3d-Minor-improvements.patch

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
