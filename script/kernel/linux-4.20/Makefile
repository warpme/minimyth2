
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


PATCHFILES  = linux-4.20.patch.gar
PATCHFILES += linux-4.20-perl.patch.gar
PATCHFILES += linux-4.20-disable_dma_for_cfa.patch
PATCHFILES += linux-4.20-defaults.patch
PATCHFILES += linux-4.20-vgaarb-add-3D-accell-detection.patch
PATCHFILES += linux-4.20-net-smsc95xx-allow-mac-address-as-param.patch


# Patches for Amlogic video decoder
ifeq (1,1)
PATCHFILES += 0101-amlogic-vdec-dt-bindings-media-add-Amlogic-Video-Decoder-Bindings.patch
PATCHFILES += 0102-amlogic-vdec-media-meson-add-v4l2-m2m-video-decoder-driver.patch
PATCHFILES += 0103-amlogic-vdec-MAINTAINERS-Add-meson-video-decoder.patch
PATCHFILES += 0104-amlogic-vdec-arm64-dts-meson-gx-add-vdec-entry.patch
PATCHFILES += 0105-amlogic-vdec-arm64-dts-meson-add-vdec-entries.patch
PATCHFILES += 0106-amlogic-vdec-meson-vdec-introduce-controls-and-V4L2_CID_MIN_BUFFE.patch
PATCHFILES += 0107-amlogic-vdec-media-videodev2-add-V4L2_FMT_FLAG_NO_SOURCE_CHANGE.patch
PATCHFILES += 0108-amlogic-vdec-meson-vdec-allow-subscribing-to-V4L2_EVENT_SOURCE_CH.patch
PATCHFILES += 0109-amlogic-vdec-media-meson-vdec-add-H.264-decoding-support.patch
PATCHFILES += 0110-amlogic-vdec-media-meson-vdec-add-MPEG4-decoding-support.patch
PATCHFILES += 0111-amlogic-vdec-media-meson-vdec-add-MJPEG-decoding-support.patch
PATCHFILES += 0112-amlogic-vdec-media-videodev2.h-Add-Amlogic-compressed-format.patch
PATCHFILES += 0113-amlogic-vdec-media-meson-vdec-add-support-for-V4L2_PIX_FMT_AM21C.patch
PATCHFILES += 0114-amlogic-vdec-meson-vdec-make-amvdec_dst_buf_done_offset-public.patch
PATCHFILES += 0115-amlogic-vdec-media-meson-vdec-add-HEVC-decoding-support.patch
PATCHFILES += 0116-amlogic-vdec-media-meson-vdec-more-debug-output-on-src-change.patch
PATCHFILES += 0117-amlogic-vdec-meson-vdec-Map-the-Firmware-buf-idx-VB2-buf-idx.patch
endif

# Patches for Mali450 GPU Lima driver
ifeq (1,1)
PATCHFILES += 0201-lima-drm-ARM-dts-add-gpu-node-to-exynos4.patch
PATCHFILES += 0202-lima-drm-dt-bindings-add-switch-delay-property-for-mali-utgar.patch
PATCHFILES += 0203-lima-drm-arm64-dts-add-switch-delay-for-meson-mali.patch
PATCHFILES += 0204-lima-drm-arm64-dts-add-switch-delay-for-meson-mali.patch
PATCHFILES += 0205-lima-drm-add-lima-uapi-header.patch
PATCHFILES += 0206-lima-drm-add-mali-4xx-GPU-hardware-regs.patch
PATCHFILES += 0207-lima-drm-add-lima-core-driver.patch
PATCHFILES += 0208-lima-drm-add-GPU-device-functions.patch
PATCHFILES += 0209-lima-drm-add-PMU-related-functions.patch
PATCHFILES += 0210-lima-drm-add-L2-cache-functions.patch
PATCHFILES += 0211-lima-drm-add-GP-related-functions.patch
PATCHFILES += 0212-lima-drm-add-PP-related-functions.patch
PATCHFILES += 0213-lima-drm-add-MMU-related-functions.patch
PATCHFILES += 0214-lima-drm-add-BCAST-related-function.patch
PATCHFILES += 0215-lima-drm-add-DLBU-related-functions.patch
PATCHFILES += 0216-lima-drm-add-GPU-virtual-memory-space-handing.patch
PATCHFILES += 0217-lima-drm-add-TTM-subsystem-functions.patch
PATCHFILES += 0218-lima-drm-add-buffer-object-functions.patch
PATCHFILES += 0219-lima-drm-add-GEM-related-functions.patch
PATCHFILES += 0220-lima-drm-add-GEM-Prime-related-functions.patch
PATCHFILES += 0221-lima-drm-add-GPU-schedule-using-DRM_SCHED.patch
PATCHFILES += 0222-lima-drm-add-context-related-functions.patch
PATCHFILES += 0223-lima-drm-add-makefile-and-kconfig.patch
PATCHFILES += 0224-lima-drm-use-SPDX-identifiers-and-change-copyright.patch
PATCHFILES += 0225-lima-drm-lima_reg.h-use-BIT.patch
PATCHFILES += 0226-lima-drm-add-IRQF_SHARED-for-GP-irq.patch
PATCHFILES += 0227-lima-drm-Kconfig-only-depend-on-ARM-or-ARM64.patch
PATCHFILES += 0228-lima-drm-add-comments-for-lima_reg.h.patch
PATCHFILES += 0229-lima-drm-wait-bo-fence-before-bo-close.patch
PATCHFILES += 0230-lima-drm-refine-lima_gem_sync_bo.patch
PATCHFILES += 0231-lima-drm-vm-will-be-freed-when-lima_sched_free_job.patch
PATCHFILES += 0232-lima-drm-vm-alloc-buffer-with-multi-page-table.patch
PATCHFILES += 0233-lima-drm-clear-vm-page-table-when-alloc.patch
PATCHFILES += 0234-lima-drm-update-SPDX-header-to-match-kernel-rules.patch
PATCHFILES += 0235-lima-drm-fourcc-add-ARM-tiled-format-modifier.patch
PATCHFILES += 0236-lima-drm-add-DRM_LIMA_GEM_MOD-ioctl.patch
PATCHFILES += 0237-lima-drm-remove-depend-on-ARM-arch.patch
PATCHFILES += 0238-lima-drm-port-to-4.18-kernel.patch
PATCHFILES += 0239-lima-drm-user-can-choose-not-to-use-dlbu-on-mali450.patch
PATCHFILES += 0240-lima-drm-Fix-Lima-to-work-with-drm-scheduler-changes.patch
PATCHFILES += 0241-lima-drm-Fix-lima-cache-creation.patch
PATCHFILES += 0242-lima-drm-print-info-when-task-timeout.patch
PATCHFILES += 0243-lima-drm-fix-dma-fence-leak.patch
PATCHFILES += 0244-lima-drm-fix-dma-fence-leak-when-app-exit.patch
PATCHFILES += 0245-lima-drm-return-error-status-of-fence-after-waiting.patch
PATCHFILES += 0246-lima-drm-support-mmap-imported-buffer.patch
endif

# Patches for Amlogic audio support
ifeq (1,1)
PATCHFILES += 0306-drm-meson-Add-support-for-VIC-alternate-timings.patch
PATCHFILES += 0307-drm-meson-fix-max-height-width.patch
PATCHFILES += 0308-defconfig-enable-CEC-support.patch
PATCHFILES += 0309-audio-meson-add-meson-audio-core-driver.patch
PATCHFILES += 0310-audio-meson-add-register-definitions.patch
PATCHFILES += 0311-audio-meson-add-aiu-i2s-dma-support.patch
PATCHFILES += 0312-audio-meson-add-initial-i2s-dai-support.patch
PATCHFILES += 0313-audio-meson-add-aiu-spdif-dma-support.patch
PATCHFILES += 0314-audio-meson-add-initial-spdif-dai-support.patch
PATCHFILES += 0315-defconfig-enable-audio-support-for-meson-SoCs-.patch
PATCHFILES += 0316-audio-dts-meson-gx-add-audio-controller-nodes.patch
PATCHFILES += 0317-audio-meson-activate-HDMI-audio-path.patch
PATCHFILES += 0318-drm-meson-select-dw-hdmi-i2s-audio-for-meson-hdmi.patch
PATCHFILES += 0319-audio-dts-meson-gx-add-sound-dai-cells-to-HDMI-node.patch
PATCHFILES += 0320-audio-dts-meson-activate-hdmi-audio-HDMI-enabled-boa.patch
PATCHFILES += 0321-drm-bridge-dw-hdmi-Use-AUTO-CTS-setup-mode-when-non-.patch
PATCHFILES += 0322-drm-meson-Call-drm_crtc_vblank_on-drm_crtc_vblank_of.patch
PATCHFILES += 0337-audio-hdmi-codec-fix-channel-allocation.patch
PATCHFILES += 0338-drm-dw-hdmi-i2s-add-.get_eld-callback-for-ALSA-SoC.patch
PATCHFILES += 0339-drm-dw-hdmi-i2s-add-multi-channel-lpcm-support.patch
PATCHFILES += 0340-drm-dw-hdmi-call-hdmi_set_cts_n-after-clock-is-enabl.patch
PATCHFILES += 0341-drm-dw-hdmi-extract-dw_hdmi_connector_update_edid.patch
PATCHFILES += 0342-drm-dw-hdmi-update-edid-on-hpd-event.patch
PATCHFILES += 0346-misc-update-cpuinfo.patch
PATCHFILES += 0352-misc-pfn-stfu.patch
PATCHFILES += 0353-misc-set-rc-warn-once.patch
PATCHFILES += 0357-boot-GX-update-TEXT_OFFSET-for-Amlogic-MESON-SoC.patch
endif

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	utils/bc \

DEPENDS = \
	kernel/linux-headers-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)  \
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
	$(warning Kernel will be build with following cmd line:$(BUILD_ARGS))
	$(warning LINUX_MAKE_ARGS: $(LINUX_MAKE_ARGS))
	$(warning LINUX_MAKE_ENV: $(LINUX_MAKE_ENV))
	$(warning LDFLAGS: $(LDFLAGS))
	$(warning main_LDFLAGS: $(main_LDFLAGS))
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
	@$(MAKE) clean       -C ../linux-headers-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)
	@$(MAKE) clean-all   -C ../linux-headers-$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)
	@$(MAKE) clean       -C ../linux-firmware
	@$(MAKE) clean-all   -C ../linux-firmware-meson
