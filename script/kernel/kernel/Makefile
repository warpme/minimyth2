
GARNAME    = kernel
GARVERSION = $(mm_KERNEL_VERSION)
CATEGORIES = kernel
LICENSE    =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	kernel/linux-$(mm_KERNEL_VERSION) \
	$(if $(filter arm arm64,$(GARCH_FAMILY)),kernel/xr819)    \

#	$(if $(filter arm arm64,$(GARCH_FAMILY)),kernel/rtl8821cu)    \
#	$(if $(filter arm arm64,$(GARCH_FAMILY)),kernel/rtl8189es)    \

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)

clean-all:
	@$(foreach dir, $(wildcard ../linux-*), $(MAKE) clean     -C $(dir) ; )
	@$(foreach dir, $(wildcard ../linux-*), $(MAKE) clean-all -C $(dir) ; )
	@$(MAKE) clean
	@$(MAKE) clean-all -C ../../kernel-headers/linux-headers
	@$(MAKE) clean-all -C ../../kernel/rtl8189es
	@$(MAKE) clean-all -C ../../kernel/openvfd
	@$(MAKE) clean     -C ../../kernel-headers/linux-headers
	@$(MAKE) clean     -C ../../kernel/rtl8189es
	@$(MAKE) clean     -C ../../kernel/rtl8821cu
	@$(MAKE) clean     -C ../../kernel/xr819
	@$(MAKE) clean     -C ../../nvidia
	@$(MAKE) clean     -C ../../system/bbswitch
	@$(MAKE) clean     -C ../../kernel/openvfd

reinstall: clean
	@$(MAKE) install-headers -C ../../kernel/linux-$(mm_KERNEL_VERSION)
	@$(MAKE) reinstall       -C ../../kernel/linux-$(mm_KERNEL_VERSION)
	@$(MAKE) reinstall       -C ../../kernel/xr819
