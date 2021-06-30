
ifeq (0,1)
# URL GIT: https://github.com/fifteenhex/xradio
GARNAME      = wifi-xradio
GARVERSION   = 6bf0e2e21c80456e2a3d4ad1267caecde7165871
CATEGORIES   = system
MASTER_SITES = https://github.com/fifteenhex/xradio/archive/
#PATCHFILES   = 01-enable-out-of-tree-compilation.patch
#PATCHFILES  += 02-wip-pass-kmalloc-bufs-to-sdio-transactions.patch
#PATCHFILES  += 03-fix-of_get_mac_address-on-5.13-kernel.patch
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/xradio-$(GARVERSION)
endif

ifeq (1,1)
# URL: https://github.com/karabek/xradio
GARNAME      = wifi-xradio
GARVERSION   = 354e8c32e7948d46a63796d0ca266b1f702999b0
CATEGORIES   = system
MASTER_SITES = https://github.com/karabek/xradio/archive/
PATCHFILES   = 01-enable-out-of-tree-compilation.patch
PATCHFILES  += 02-wip-pass-kmalloc-bufs-to-sdio-transactions.patch
PATCHFILES  += 03-fix-of_get_mac_address-on-5.13-kernel.patch
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/xradio-$(GARVERSION)
endif

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
	@mkdir -p $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/xradio
	@cp -f $(WORKSRC)/xradio_wlan.ko $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/xradio/
	@depmod -b $(DESTDIR) -v $(LINUX_FULL_VERSION)
	@$(MAKECOOKIE)

clean-all:
	@true
