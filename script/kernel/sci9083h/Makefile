
# URL https://github.com/CoreELEC/smartchip/tree/master/trunk_driver
GARNAME      = sci9083h
# 25.12.2023
GARVERSION   = 5d41ac040ecd2072498da88100305c1b444c12c7
CATEGORIES   = kernel
MASTER_SITES = https://github.com/CoreELEC/smartchip/archive/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = \
		01-fix-compiling-on-6.10-kernel.patch \
		02-change-fw-cfg-paths-to-lib-firmware-s9083s.patch \
		03-fix-netdev-addr.patch \

WORKSRC      = $(WORKDIR)/smartchip-$(GARVERSION)

LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

GAR_EXTRA_CONF += kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk
include ../../gar.mk

BUILD_ARGS        = $(LINUX_MAKE_ARGS)

build-custom:
	@cd $(WORKSRC)/trunk_driver; $(MAKE) KSRC=$(DESTDIR)$(LINUX_SOURCEDIR) HOST_PLAT=h313 $(BUILD_ARGS) M=$(mm_HOME)/script/kernel/sci9083h/$(WORKSRC) modules
	@$(MAKECOOKIE)

install-custom:
	@echo "Installing s9083s kernel module ..."
	@mkdir -p $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/smartchip
	@cp -f $(WORKSRC)/trunk_driver/s9083s.ko $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/smartchip/
	@depmod -b $(DESTDIR) -v $(LINUX_FULL_VERSION)
	@$(MAKECOOKIE)

clean-all:
	@true
