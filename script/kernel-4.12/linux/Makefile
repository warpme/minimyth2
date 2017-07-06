GARNAME = linux
GARVERSION = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),$(if $(filter-out 0,$(LINUX_TEENY_VERSION)),.$(LINUX_TEENY_VERSION)))$(LINUX_EXTRA_VERSION)
CATEGORIES = kernel-4.12
MASTER_SITES  = https://www.kernel.org/pub/linux/kernel/v4.x/
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
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = utils/bc kernel-4.12/linux-firmware

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = custom

CONFIGURE_ARGS = $(LINUX_MAKE_ARGS)
BUILD_ARGS     = $(LINUX_MAKE_ARGS) bzImage modules
INSTALL_ARGS   = $(LINUX_MAKE_ARGS)

CONFIGURE_ENV = $(LINUX_MAKE_ENV)
BUILD_ENV     = $(LINUX_MAKE_ENV)
INSTALL_ENV   = $(LINUX_MAKE_ENV) INSTALL_PATH="$(DESTDIR)$(LINUX_DIR)" INSTALL_MOD_PATH="$(DESTDIR)$(rootdir)"

include ../../gar.mk

configure-custom:
	@$(CONFIGURE_ENV) $(MAKE) $(CONFIGURE_ARGS) -C $(WORKSRC) mrproper
	@cp $(if $(mm_KERNEL_CONFIG),$(HOME)/.minimyth/$(mm_KERNEL_CONFIG),$(DOWNLOADDIR)/$(CONFIGFILE)) $(WORKSRC)/.config
	@$(CONFIGURE_ENV) $(MAKE) $(CONFIGURE_ARGS) -C $(WORKSRC) oldconfig
	@$(CONFIGURE_ENV) $(MAKE) $(CONFIGURE_ARGS) -C $(WORKSRC) clean
	@$(MAKECOOKIE)

pre-install:
	@rm -rf "$(DESTDIR)$(LINUX_DIR)"
	@rm -rf "$(DESTDIR)$(LINUX_MODULESDIR)"
	@mkdir -p "$(DESTDIR)$(LINUX_DIR)"
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(LINUX_DIR)"
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/bzImage > $(DESTDIR)$(LINUX_DIR)/vmlinuz
	@cp $(WORKSRC)/System.map                           $(DESTDIR)$(LINUX_DIR)/System.map
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) modules_install
	@$(MAKECOOKIE)

post-install:
	@sed -i 's%overlayfs.ko%overlay.ko%g' ../../meta/minimyth/files/source/lists/minimyth-lib-list
	@sed -i 's% overlayfs % overlay %g'   ../../meta/minimyth/files/source/rootfs/etc/rc.d/functions
	@sed -i 's% overlayfs % overlay %g'   ../../meta/minimyth/files/source/initrd/sbin/init
	@echo "------------------------------------"     > $(DESTDIR)/usr/share/supported-IR-remotes.txt
	@echo "List of supported IR receivers as of"    >> $(DESTDIR)/usr/share/supported-IR-remotes.txt
	@echo "MiniMyth2 $(LINUX_FULL_VERSION) kernel " >> $(DESTDIR)/usr/share/supported-IR-remotes.txt
	@echo "------------------------------------"    >> $(DESTDIR)/usr/share/supported-IR-remotes.txt
	@ls -1 $(WORKSRC)/drivers/media/rc/keymaps/*.mod.c | sed -e "s/.*rc-//" -e "s/.mod.c//" >> $(DESTDIR)/usr/share/supported-IR-remotes.txt
	@$(MAKECOOKIE)
