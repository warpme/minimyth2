GARNAME = kernel
GARVERSION = $(mm_KERNEL_VERSION)
CATEGORIES = kernel
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	kernel/linux-$(mm_KERNEL_VERSION) \
	$(if $(filter u-boot,$(mm_SOFTWARE)),kernel/u-boot) \
	$(if $(filter armsoc,$(mm_GRAPHICS)),kernel/meson-gx-mali450)

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)

clean-all:
	@$(foreach dir, $(wildcard ../linux-*), $(MAKE) clean     -C $(dir) ; )
	@$(foreach dir, $(wildcard ../linux-*), $(MAKE) clean-all -C $(dir) ; )
	@$(MAKE) clean
	@$(MAKE) clean-all -C ../../system/lirc
	@$(MAKE) clean-all -C ../../nvidia
	@$(MAKE) clean     -C ../../system/bbswitch
	@$(MAKE) clean     -C ../../kernel/meson-gx-mali450
