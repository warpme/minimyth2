
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

PATCHFILES  = linux-5.2.patch.gar
PATCHFILES += linux-5.2-perl.patch.gar
PATCHFILES += linux-5.2-disable_dma_for_cfa.patch
PATCHFILES += linux-5.2-defaults.patch
PATCHFILES += linux-5.2-vgaarb-add-3D-accell-detection.patch
PATCHFILES += linux-5.2-net-smsc95xx-allow-mac-address-as-param.patch

# Misc patches for Amlogic Audio
ifeq (1,1)
PATCHFILES += 0001-dt-bindings-media-add-Amlogic-Video-Decoder-Bindings.patch
PATCHFILES += 0002-media-videodev2-add-V4L2_FMT_FLAG_FIXED_RESOLUTION.patch
PATCHFILES += 0003-media-meson-add-v4l2-m2m-video-decoder-driver.patch
PATCHFILES += 0004-MAINTAINERS-Add-meson-video-decoder.patch
PATCHFILES += 0005-arm64-dts-meson-gx-add-vdec-entry.patch
PATCHFILES += 0006-arm64-dts-meson-add-vdec-entries.patch
PATCHFILES += 0007-media-meson-vdec-add-H.264-decoding-support.patch
PATCHFILES += 0008-media-meson-vdec-add-MPEG4-decoding-support.patch
PATCHFILES += 0009-media-meson-vdec-add-MJPEG-decoding-support.patch
PATCHFILES += 0010-media-videodev2.h-Add-Amlogic-compressed-format.patch
PATCHFILES += 0011-media-meson-vdec-add-support-for-V4L2_PIX_FMT_AM21C.patch
PATCHFILES += 0012-media-meson-vdec-add-HEVC-decoding-support.patch
PATCHFILES += 0013-media-meson-vdec-add-VP9-input-support.patch
PATCHFILES += 0014-media-meson-vdec-add-VP9-support.patch
PATCHFILES += 0015-media-meson-vdec-add-g12a-platform.patch
PATCHFILES += 0016-media-meson-vp9-add-IOMMU-support.patch
PATCHFILES += 0017-arm64-dts-meson-g12a-add-video-decoder-node.patch
endif

# Misc patches for Amlogic Audio
ifeq (1,1)
PATCHFILES += 0102-ASoC-meson-add-meson-audio-core-driver.patch
PATCHFILES += 0103-ASoC-meson-add-register-definitions.patch
PATCHFILES += 0104-ASoC-meson-add-initial-aiu-i2s-support.patch
PATCHFILES += 0105-ASoC-meson-add-initial-spdif-support.patch
PATCHFILES += 0107-ARM64-dts-meson-gx-add-audio-controller-nodes.patch
PATCHFILES += 0108-snd-meson-activate-HDMI-audio-path.patch
PATCHFILES += 0109-drm-meson-select-dw-hdmi-i2s-audio-for-meson-hdmi.patch
PATCHFILES += 0110-ARM64-dts-meson-gx-add-sound-dai-cells-to-HDMI-node.patch
PATCHFILES += 0111-ARM64-dts-meson-activate-hdmi-audio-HDMI-enabled-boa.patch
PATCHFILES += 0112-drm-bridge-dw-hdmi-Use-AUTO-CTS-setup-mode-when-non-.patch
PATCHFILES += 0113-drm-bridge-dw-hdmi-support-dynamically-get-input-out.patch
endif

# Misc patches for AmLogic
# https://github.com/kszaq/LibreELEC.tv/tree/amlogic/packages/linux/patches/amlogic-amlgx
ifeq (1,1)
PATCHFILES += 0401-HACK-set-cma-pool-to-896MB.patch
PATCHFILES += 0403-HACK-silence-PFNs-busy-log-spam.patch
PATCHFILES += 0404-HACK-silence-meson-ir-warn-once-log-spam.patch
PATCHFILES += 0405-HACK-silence-hrtimer-log-spam.patch
PATCHFILES += 0406-HACK-Bluetooth-Fix-spurious-error-message.patch
PATCHFILES += 0427-media-rc-add-keymap-for-HardKernel-ODROID-remote.patch
PATCHFILES += 0428-media-rc-add-keymap-for-Khadas-VIM-EDGE-remote.patch
PATCHFILES += 0429-media-rc-add-keymap-for-KHAMSIN-remote.patch
PATCHFILES += 0430-media-rc-add-keymap-for-Philips-RC242-remote.patch
PATCHFILES += 0431-media-rc-add-keymap-for-Tanix-TX3-mini-remote.patch
PATCHFILES += 0432-media-rc-add-keymap-for-WeTek-Hub-remote.patch
PATCHFILES += 0433-media-rc-add-keymap-for-WeTeK-Play-2-remote.patch
PATCHFILES += 0434-ASoC-meson-correct-i2s-error-messages.patch
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
	@$(MAKE) clean       -C ../../kernel-headers/linux-headers
	@$(MAKE) clean-all   -C ../../kernel-headers/linux-headers
	@$(MAKE) clean       -C ../linux-firmware
	@$(MAKE) clean-all   -C ../linux-firmware-meson
