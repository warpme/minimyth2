
# URL GIT: https://github.com/fifteenhex/xradio
GARNAME      = xradio-fifteenhex-25122023
# 25.12.2023
GARVERSION   = 3a1f77fb2db248b7d18d93b67b16e0d6c91db184
CATEGORIES   = system
MASTER_SITES = https://github.com/fifteenhex/xradio/archive/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = hack-stop-logging-missed-interrupts.patch
WORKSRC      = $(WORKDIR)/xradio-$(GARVERSION)

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
	@$(MAKE) -C $(DESTDIR)$(LINUX_SOURCEDIR) $(BUILD_ARGS) M=$(mm_HOME)/script/kernel/xr819/$(WORKSRC) modules
	@$(MAKECOOKIE)

install-custom:
	@echo "Installing xradio kernel module ..."
	@mkdir -p $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/xradio
	@cp -f $(WORKSRC)/xradio_wlan.ko $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/xradio/
	@echo "Removing cw1200 kernel modules as xradio provides equivalent support ..."
	@rm -rf $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/st/cw1200*
	@depmod -b $(DESTDIR) -v $(LINUX_FULL_VERSION)
	@$(MAKECOOKIE)

clean-all:
	@true
