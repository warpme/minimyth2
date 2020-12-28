
# URL GIT: https://github.com/jwrdegoede/rtl8189ES_linux

GARNAME      = rtl8189es
GARVERSION   = 930d3d7cfe3b25c0cf8a57ca4b79f6aef5b6de4b
CATEGORIES   = system
MASTER_SITES = https://github.com/jwrdegoede/rtl8189ES_linux/archive/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = rtl8189es-fix-5.10-kernel-build.patch
WORKSRC      = $(WORKDIR)/rtl8189ES_linux-$(GARVERSION)

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
	@mkdir -p $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/realtek/rtl8189es
	@cp -f $(WORKSRC)/8189es.ko $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/realtek/rtl8189es/
	@depmod -b $(DESTDIR) -v $(LINUX_FULL_VERSION)
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/net/wireless/realtek/rtl8189es*
	@true
