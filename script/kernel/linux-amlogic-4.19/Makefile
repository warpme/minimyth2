
# GIT URL: https://github.com/Elyotna/linux

GARNAME = linux-amlogic
GARVERSION = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),$(if $(filter-out 0,$(LINUX_TEENY_VERSION)),.$(LINUX_TEENY_VERSION)))$(LINUX_EXTRA_VERSION)
CATEGORIES = kernel-amlogic-4.19
MASTER_SITES  = https://github.com/Elyotna/linux/archive/
CONFIGFILE = $(DISTNAME)-$(GARCH_FAMILY)-$(GARCH).config
DISTFILES = $(GITHASH).tar.gz $(CONFIGFILE)
PATCHFILES  = $(DISTNAME).patch.gar
PATCHFILES += $(DISTNAME)-perl.patch.gar
PATCHFILES += $(DISTNAME)-disable_dma_for_cfa.patch
PATCHFILES += $(DISTNAME)-defaults.patch
PATCHFILES += $(DISTNAME)-vgaarb-add-3D-accell-detection.patch
PATCHFILES += $(DISTNAME)-net-smsc95xx-allow-mac-address-as-param.patch

#PATCHFILES += 0001-media-video_function_calls.rst-drop-obsolete-video-s.patch
#PATCHFILES += 0002-media-af9035-prevent-buffer-overflow-on-write.patch
#PATCHFILES += 0003-media-camss-mark-PM-functions-as-__maybe_unused.patch
#PATCHFILES += 0004-media-camss-Use-managed-memory-allocations.patch
#PATCHFILES += 0005-media-camss-add-missing-includes.patch
PATCHFILES += 0006-media-vicodec-add-QP-controls.patch
PATCHFILES += 0007-media-vicodec-add-support-for-more-pixel-formats.patch
PATCHFILES += 0008-media-vicodec-simplify-flags-handling.patch
PATCHFILES += 0009-media-vicodec-simplify-blocktype-checking.patch
PATCHFILES += 0010-media-vicodec-improve-handling-of-uncompressable-pla.patch
PATCHFILES += 0011-media-vicodec-rename-and-use-proper-fwht-prefix-for-.patch
PATCHFILES += 0012-media-vicodec-split-off-v4l2-specific-parts-for-the-.patch
PATCHFILES += 0013-media-vicodec-fix-out-of-range-values-when-decoding.patch
PATCHFILES += 0014-media-ov772x-use-SCCB-regmap.patch
PATCHFILES += 0015-media-ov9650-use-SCCB-regmap.patch
PATCHFILES += 0016-media-ov5670-ov13858-Use-pm_runtime_idle.patch
PATCHFILES += 0017-media-i2c-Fix-pm_runtime_get_if_in_use-usage-in-sens.patch
PATCHFILES += 0018-media-ipu3-cio2-Use-dma_zalloc_coherent-to-replace-d.patch
PATCHFILES += 0019-media-ov772x-Disable-clk-on-error-path.patch
PATCHFILES += 0020-media-ov5640-fix-mode-change-regression.patch
PATCHFILES += 0021-media-vidioc-g-dv-timings.rst-document-V4L2_DV_FL_CA.patch
PATCHFILES += 0022-media-videodev2.h-Add-new-DV-flag-CAN_DETECT_REDUCED.patch
PATCHFILES += 0023-media-v4l2-dv-timings-Introduce-v4l2_calc_timeperfra.patch
PATCHFILES += 0024-media-cobalt-Use-v4l2_calc_timeperframe-helper.patch
PATCHFILES += 0025-media-adv7842-enable-reduced-fps-detection.patch
PATCHFILES += 0026-media-Documentation-v4l-document-request-API.patch
PATCHFILES += 0027-media-uapi-linux-media.h-add-request-API.patch
PATCHFILES += 0028-media-media-request-implement-media-requests.patch
PATCHFILES += 0029-media-doc-Add-media-request.h-header-to-documentatio.patch
PATCHFILES += 0030-media-media-request-add-media_request_get_by_fd.patch
PATCHFILES += 0031-media-media-request-add-media_request_object_find.patch
PATCHFILES += 0032-media-v4l2-device.h-add-v4l2_device_supports_request.patch
PATCHFILES += 0033-media-v4l2-dev-lock-req_queue_mutex.patch
PATCHFILES += 0034-media-videodev2.h-add-request_fd-field-to-v4l2_ext_c.patch
PATCHFILES += 0035-media-v4l2-ctrls-v4l2_ctrl_add_handler-add-from_othe.patch
PATCHFILES += 0036-media-v4l2-ctrls-prepare-internal-structs-for-reques.patch
PATCHFILES += 0037-media-v4l2-ctrls-alloc-memory-for-p_req.patch
PATCHFILES += 0038-media-v4l2-ctrls-use-ref-in-helper-instead-of-ctrl.patch
PATCHFILES += 0039-media-v4l2-ctrls-add-core-request-support.patch
PATCHFILES += 0040-media-v4l2-ctrls-support-g-s_ext_ctrls-for-requests.patch
PATCHFILES += 0041-media-v4l2-ctrls-add-v4l2_ctrl_request_hdl_find-put-.patch
PATCHFILES += 0042-media-videobuf2-v4l2-move-__fill_v4l2_buffer-functio.patch
PATCHFILES += 0043-media-videobuf2-v4l2-replace-if-by-switch-in-__fill_.patch
PATCHFILES += 0044-media-vb2-store-userspace-data-in-vb2_v4l2_buffer.patch
PATCHFILES += 0045-media-davinci_vpfe-remove-bogus-vb2-state-check.patch
PATCHFILES += 0046-media-vb2-drop-VB2_BUF_STATE_PREPARED-use-bool-prepa.patch
PATCHFILES += 0047-media-videodev2.h-Add-request_fd-field-to-v4l2_buffe.patch
PATCHFILES += 0048-media-vb2-add-init_buffer-buffer-op.patch
PATCHFILES += 0049-media-videobuf2-core-embed-media_request_object.patch
PATCHFILES += 0050-media-videobuf2-core-integrate-with-media-requests.patch
PATCHFILES += 0051-media-videobuf2-v4l2-integrate-with-media-requests.patch
PATCHFILES += 0052-media-videobuf2-core-add-request-helper-functions.patch
PATCHFILES += 0053-media-videobuf2-v4l2-add-vb2_request_queue-validate-.patch
PATCHFILES += 0054-media-videobuf2-core-add-uses_requests-qbuf-flags.patch
PATCHFILES += 0055-media-videobuf2-v4l2-refuse-qbuf-if-queue-uses-reque.patch
PATCHFILES += 0056-media-v4l2-mem2mem-add-vb2_m2m_request_queue.patch
PATCHFILES += 0057-media-vim2m-use-workqueue.patch
PATCHFILES += 0058-media-vim2m-support-requests.patch
PATCHFILES += 0059-media-vivid-add-mc.patch
PATCHFILES += 0060-media-vivid-add-request-support.patch
PATCHFILES += 0061-media-request-return-EINVAL-for-invalid-request_fds.patch
PATCHFILES += 0062-v4l2-ctrls-return-EACCES-if-request-wasn-t-completed.patch
PATCHFILES += 0063-buffer.rst-only-set-V4L2_BUF_FLAG_REQUEST_FD-for-QBU.patch
PATCHFILES += 0064-videodev2.h-add-new-capabilities-for-buffer-types.patch
PATCHFILES += 0065-vb2-set-reqbufs-create_bufs-capabilities.patch
PATCHFILES += 0066-media-request-add-media_request_-un-lock_for_access.patch
PATCHFILES += 0067-v4l2-ctrls-use-media_request_-un-lock_for_access.patch
PATCHFILES += 0068-v4l2-ctrls-improve-media_request_-un-lock_for_update.patch
PATCHFILES += 0069-media-request-EPERM-EACCES-EBUSY.patch
PATCHFILES += 0070-media-request-update-documentation.patch
PATCHFILES += 0071-media-videobuf2-core-Rework-and-rename-helper-for-re.patch
PATCHFILES += 0072-media-v4l-Add-definitions-for-MPEG-2-slice-format-an.patch
PATCHFILES += 0073-media-v4l-Add-definition-for-the-Sunxi-tiled-NV12-fo.patch
PATCHFILES += 0074-dt-bindings-media-Document-bindings-for-the-Cedrus-V.patch
PATCHFILES += 0075-media-platform-Add-Cedrus-VPU-decoder-driver.patch
PATCHFILES += 0076-ARM-dts-sun5i-Add-Video-Engine-and-reserved-memory-n.patch
PATCHFILES += 0077-ARM-dts-sun7i-a20-Add-Video-Engine-and-reserved-memo.patch
PATCHFILES += 0078-ARM-dts-sun8i-a33-Add-Video-Engine-and-reserved-memo.patch
PATCHFILES += 0079-ARM-dts-sun8i-h3-Add-Video-Engine-and-reserved-memor.patch
PATCHFILES += 0080-media-cedrus-Fix-error-reporting-in-request-validati.patch
PATCHFILES += 0081-media-cedrus-Add-TODO-file-with-tasks-to-complete-be.patch

LICENSE = GPL2

WORKSRC = $(WORKDIR)/linux-$(GITHASH)

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	utils/bc                           \
	kernel/linux-headers-amlogic-4.19  \
	kernel/linux-firmware-amlogic-4.19 \

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
	@$(CONFIGURE_ENV) $(MAKE) -C $(WORKSRC) $(BUILD_ARGS) Image Image.gz modules dtbs
else
	@$(CONFIGURE_ENV) $(MAKE) -C $(WORKSRC) $(BUILD_ARGS) bzImage modules
endif
endif
	@$(MAKECOOKIE)

pre-install:
	@rm -rf "$(DESTDIR)$(LINUX_DIR)"
	@rm -rf "$(DESTDIR)$(LINUX_MODULESDIR)"
	@mkdir -p "$(DESTDIR)$(LINUX_DIR)"
	@$(MAKECOOKIE)

install-custom:
ifeq ($(GARCH),armv7)
	@mkdir -p "$(DESTDIR)/boot"
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/zImage > $(DESTDIR)/boot/zImage
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image    > $(DESTDIR)/boot/Image
	@cp  $(WORKSRC)/System.map $(DESTDIR)$(LINUX_DIR)/System.map
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) dtbs_install
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) modules_install
	@$(MAKECOOKIE)
else
ifeq ($(GARCH),armv8)
	@mkdir -p "$(DESTDIR)/boot"
	@echo "Installing kernel Image.gz"
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image.gz > $(DESTDIR)/boot/Image.gz
	@echo "Installing kernel Image."
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image    > $(DESTDIR)/boot/Image
	@cp  $(WORKSRC)/System.map $(DESTDIR)$(LINUX_DIR)/System.map
	@echo "Installing kernel DTBS"
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) dtbs_install
	@echo "Installing kernel modules"
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) modules_install
	@$(MAKECOOKIE)
else
	@mkdir -p "$(DESTDIR)$(LINUX_DIR)"
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/bzImage > $(DESTDIR)$(LINUX_DIR)/vmlinuz
	@cp $(WORKSRC)/System.map                           $(DESTDIR)$(LINUX_DIR)/System.map
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) modules_install
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
	@rm -rf $(DESTDIR)$(LINUX_DIR)
	@rm -rf $(DESTDIR)$(LINUX_MODULESPREFIX)
	@$(MAKE) clean       -C ../linux-headers-amlogic-4.19
	@$(MAKE) clean       -C ../linux-firmware-amlogic-4.19
	@$(MAKE) clean-all   -C ../linux-headers-amlogic-4.19
	@$(MAKE) clean-all   -C ../linux-firmware-amlogic-4.19
