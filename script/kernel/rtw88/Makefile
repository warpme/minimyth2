
# URL GIT: https://github.com/lwfinger/rtw88/commits/master/
GARNAME      = rtw88
# v13.07.2025
GARVERSION   = fa96fd4c014fa528d1fa50318e97aa71bf4f473c
CATEGORIES   = system
MASTER_SITES = https://github.com/lwfinger/rtw88/archive/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = 01-fix-building-on-6.16-kernel.patch \
               02-fix-use-indirect-IO-before-power-on.patch
WORKSRC      = $(WORKDIR)/rtw88-$(GARVERSION)

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
	@rm -rf $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/realtek/rtw88*
	@mkdir -p $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/realtek/rtw88
	@cp -f $(WORKSRC)/rtw*.ko $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/realtek/rtw88/
	@depmod -b $(DESTDIR) -v $(LINUX_FULL_VERSION)
	@$(MAKECOOKIE)

clean-all:
	rm -rf $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/realtek/rtw88*
	@true
