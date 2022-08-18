
# URL GIT: https://github.com/morrownr/8821cu-20210118
GARNAME      = rtl8821cu
# v20220705
GARVERSION   = a27e9dd621480ac2a28441bc6c7732e0e58ddd8d
CATEGORIES   = system
MASTER_SITES = https://github.com/morrownr/8821cu-20210118/archive/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = fix-compile-under-5.19.2-kernel.patch
WORKSRC      = $(WORKDIR)/8821cu-20210118-$(GARVERSION)

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
	@$(MAKE) -C $(WORKSRC) $(BUILD_ARGS) KSRC=$(DESTDIR)$(LINUX_SOURCEDIR)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/realtek/rtl8821cu
	@cp -f $(WORKSRC)/8821cu.ko $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/realtek/rtl8821cu/
	@depmod -b $(DESTDIR) -v $(LINUX_FULL_VERSION)
	@$(MAKECOOKIE)

clean-all:
	rm -rf $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/realtek/rtl8821cu*
	@true
