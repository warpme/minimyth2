
# URL GIT: https://github.com/brektrou/rtl8821CU

GARNAME      = rtl8821cu
# 5.06.2021
GARVERSION   = 2e4363444b294a52fc9c7b527199bb403060eee7
CATEGORIES   = system
MASTER_SITES = https://github.com/brektrou/rtl8821CU/archive/
PATCHFILES   = fix-compile-for-armv7-softfp.patch decrease-verbosity.patch fix-compile-on-mm2.patch
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/rtl8821CU-$(GARVERSION)

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
