GARNAME = linux-headers
GARVERSION = $(mm_KERNEL_VERSION)
CATEGORIES = kernel-headers
LICENSE =

DESCRIPTION = 
define BLURB
endef

include ../../gar.mk

ifneq (,$(filter %-4.19,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-4.19
endif
ifneq (,$(filter %-4.20,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-4.20
endif
ifneq (,$(filter %-4.21,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-4.21
endif

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
