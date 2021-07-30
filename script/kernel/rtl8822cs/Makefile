
# URL GIT: https://github.com/chewitt/RTL8822CS

GARNAME      = RTL8822CS
# 20.11.2020
GARVERSION   = 60cd82134d63aa9436b43c42933a86d6e5a191ba
CATEGORIES   = system
MASTER_SITES = https://github.com/chewitt/RTL8822CS/archive/
PATCHFILES   = fix-5.12-kernel-compile.patch
DISTFILES    = $(GARVERSION).zip

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
	@mkdir -p $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/realtek/rtl88x2cs
	@cp -f $(WORKSRC)/88x2cs.ko $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/realtek/rtl88x2cs/
	@depmod -b $(DESTDIR) -v $(LINUX_FULL_VERSION)
	@$(MAKECOOKIE)

clean-all:
	rm -rf $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/realtek/rtl88x2cs*
	@true
