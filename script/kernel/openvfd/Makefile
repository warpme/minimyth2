
GARNAME        = openvfd
GARVERSION     = 766c6a948836bbf350bd90917fc925079e297e6e
CONFIGSVERSION = 18f2ec6b24ae3b507e1de0cb18248497f19bdc02
CATEGORIES     = kernel
MASTER_SITES   = \
		https://github.com/arthur-liberman/linux_openvfd/archive/ \
		https://github.com/arthur-liberman/vfd-configurations/archive/
PATCHFILES     = 01-increase-support-to-4-gpio-banks.patch
DISTFILES      = $(GARVERSION).zip $(CONFIGSVERSION).zip openvfd
WORKSRC        = $(WORKDIR)/linux_openvfd-$(GARVERSION)

LICENSE        = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = kernel_module OpenVFDService
INSTALL_SCRIPTS   = kernel_module OpenVFDService vfdconfigurations

GAR_EXTRA_CONF += kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk
include ../../gar.mk

BUILD_ARGS        = $(LINUX_MAKE_ARGS)

build-kernel_module:
	@$(MAKE) -C $(DESTDIR)$(LINUX_SOURCEDIR) $(BUILD_ARGS) M=$(mm_HOME)/script/kernel/openvfd/$(WORKSRC)/driver
	@$(MAKECOOKIE)

build-OpenVFDService:
	@$(CC) $(LDFLAGS) -o $(WORKSRC)/OpenVFDService $(WORKSRC)/OpenVFDService.c -lm -lpthread
	@$(MAKECOOKIE)

install-kernel_module:
	@mkdir -p $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/leds/openvfd
	@cp -f $(WORKSRC)/driver/openvfd.ko $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/leds/openvfd/
	@depmod -b $(DESTDIR) -v $(LINUX_FULL_VERSION)
	@$(MAKECOOKIE)

install-OpenVFDService:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -rf $(WORKSRC)/OpenVFDService $(DESTDIR)$(bindir)/OpenVFDService
	@cp -rf $(WORKSRC)/../openvfd $(DESTDIR)$(bindir)/openvfd
	@$(MAKECOOKIE)

install-vfdconfigurations:
	@mkdir -p $(DESTDIR)$(datadir)/openvfd
	@cp -rf $(WORKDIR)/vfd-configurations-$(CONFIGSVERSION)/* $(DESTDIR)$(datadir)/openvfd/
	@$(MAKECOOKIE)

clean-all:
	@true
