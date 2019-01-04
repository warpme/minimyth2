GARNAME = linux-headers
GARVERSION = $(mm_KERNEL_VERSION)
CATEGORIES = kernel
LICENSE =

DESCRIPTION = 
define BLURB
endef

include ../../minimyth.conf.mk

ifneq (,$(filter %-4.19,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-4.19
endif
ifneq (,$(filter %-4.20,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-4.20
endif
ifneq (,$(filter %-4.21,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-4.21
endif

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
