
# URL GIT: https://github.com/tantra35/RTL8822CS-aml

GARNAME      = rtl8822cs
GARVERSION   = 9.2.1811_21
CATEGORIES   = system
MASTER_SITES = https://github.com/tantra35/RTL8822CS-aml/archive/
PATCHFILES   = decrease-verbosity.patch fix_building_one_newer_kernels.patch
DISTFILES    = p-amlogic_$(GARVERSION).zip
WORKSRC      = $(WORKDIR)/RTL8822CS-aml-p-amlogic_$(GARVERSION)

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
	@mkdir -p $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/realtek/rtl8822cs
	@cp -f $(WORKSRC)/8822cs.ko $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/realtek/rtl8822cs/
	@depmod -b $(DESTDIR) -v $(LINUX_FULL_VERSION)
	@$(MAKECOOKIE)

clean-all:
	rm -rf $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/realtek/rtl8822cs*
	@true
