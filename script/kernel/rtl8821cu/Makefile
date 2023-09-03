
# URL GIT: https://github.com/morrownr/8821cu-20210916
GARNAME      = rtl8821cu
# v2023.09.07
GARVERSION   = 9e2772540f66a69170f43864a6560d0d190d97b1
CATEGORIES   = system
MASTER_SITES = https://github.com/morrownr/8821cu-20210916/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/8821cu-20210916-$(GARVERSION)

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
