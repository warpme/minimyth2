GARNAME = linux
GARVERSION = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),$(if $(filter-out 0,$(LINUX_TEENY_VERSION)),.$(LINUX_TEENY_VERSION)))$(LINUX_EXTRA_VERSION)
CATEGORIES = kernel-4.18
MASTER_SITES  = https://cdn.kernel.org/pub/linux/kernel/v4.x/
MASTER_SITES += https://www.kernel.org/pub/linux/kernel/v4.x/
MASTER_SITES += http://www.kernel.org/pub/linux/kernel/v$(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)/
MASTER_SITES += http://www.kernel.org/pub/linux/kernel/v4.x/testing/
MASTER_SITES += https://git.kernel.org/torvalds/t/
CONFIGFILE = $(DISTNAME)-$(GARCH_FAMILY)-$(GARCH).config
DISTFILES = $(DISTNAME).tar.xz $(CONFIGFILE)
PATCHFILES  = $(DISTNAME).patch.gar
PATCHFILES += $(DISTNAME)-perl.patch.gar
PATCHFILES += $(DISTNAME)-disable_dma_for_cfa.patch
PATCHFILES += $(DISTNAME)-defaults.patch
PATCHFILES += $(DISTNAME)-vgaarb-add-3D-accell-detection.patch
PATCHFILES += $(DISTNAME)-net-smsc95xx-allow-mac-address-as-param.patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	utils/bc                   \

DEPENDS = \
	kernel/linux-headers-4.18  \
	kernel/linux-firmware-4.18 \

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

CONFIGURE_ARGS    = $(LINUX_MAKE_ARGS)
BUILD_ARGS        = $(LINUX_MAKE_ARGS)


INSTALL_ARGS   = $(LINUX_MAKE_ARGS)

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
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image.gz > $(DESTDIR)/boot/Image.gz
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image    > $(DESTDIR)/boot/Image
	@cp  $(WORKSRC)/System.map $(DESTDIR)$(LINUX_DIR)/System.map
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) dtbs_install
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
	@$(MAKE) clean       -C ../linux-headers-4.18
	@$(MAKE) clean       -C ../linux-firmware-4.18
	@$(MAKE) clean-all   -C ../linux-headers-4.18
	@$(MAKE) clean-all   -C ../linux-firmware-4.18
