GARNAME = kernel
GARVERSION = $(mm_KERNEL_VERSION)
CATEGORIES = kernel
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = kernel-$(mm_KERNEL_VERSION)/kernel

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)

clean-all:
	@$(foreach dir, $(wildcard ../../kernel-3.* ../../kernel-4.*), $(MAKE) clean-all -C $(dir)/kernel ; )
	@$(MAKE) clean
