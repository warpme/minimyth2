GARNAME = linux
GARVERSION = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),$(if $(filter-out 0,$(LINUX_TEENY_VERSION)),.$(LINUX_TEENY_VERSION)))$(LINUX_EXTRA_VERSION)
CATEGORIES = kernel-4.16
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

# automatic variables cannot be used in conditional directives, as automatic variables are not set until the recipe for that rule is invoked.
# We must use shell to get conditional variable :-(((((
CPU_ARCH = $(shell cat ~/.minimyth/minimyth.conf.mk | grep "^mm_GARCH\s*?=" | sed -e "s/\s*//g" | sed -e "s/mm_GARCH?=//")
# $(warning GARCH from minimyth.conf:$(CPU_ARCH))


DESCRIPTION = 
define BLURB
endef

BUILDDEPS = utils/bc kernel-4.16/linux-firmware

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = custom

CONFIGURE_ARGS    = $(LINUX_MAKE_ARGS)
BUILD_ARGS        = $(LINUX_MAKE_ARGS)

ifeq ($(CPU_ARCH),armv7)
BUILD_ARGS        += Image Image.gz modules dtbs
# By some reason LD on aarch64 reports: aarch64-minimyth-linux-gnu-ld: unrecognized option '-Wl,--as-needed'
# As '-Wl,--as-needed' seems to be required by i386/x86_64 platforms and is declared in gar.conf.mk, for
# aarch64 we will clear LDFLAGS
override LDFLAGS  =
else
ifeq ($(CPU_ARCH),armv8)
BUILD_ARGS        += Image Image.gz modules dtbs
# By some reason LD on aarch64 reports: aarch64-minimyth-linux-gnu-ld: unrecognized option '-Wl,--as-needed'
# As '-Wl,--as-needed' seems to be required by i386/x86_64 platforms and is declared in gar.conf.mk, for
# aarch64 we will clear LDFLAGS
override LDFLAGS  =
else
BUILD_ARGS        += bzImage modules
endif
endif

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

pre-install:
	@rm -rf "$(DESTDIR)$(LINUX_DIR)"
	@rm -rf "$(DESTDIR)$(LINUX_MODULESDIR)"
	@mkdir -p "$(DESTDIR)$(LINUX_DIR)"
	@$(MAKECOOKIE)

install-custom:
ifeq ($(CPU_ARCH),armv7)
	@mkdir -p "$(DESTDIR)/boot"
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image.gz > $(DESTDIR)/boot/Image.gz
	@cat $(WORKSRC)/arch/$(GARCH_FAMILY)/boot/Image    > $(DESTDIR)/boot/Image
	@cp  $(WORKSRC)/System.map $(DESTDIR)$(LINUX_DIR)/System.map
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) dtbs_install
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) modules_install
	@$(MAKECOOKIE)
else
ifeq ($(CPU_ARCH),armv8)
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
