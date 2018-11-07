GARNAME = linux-headers
GARVERSION = $(mm_KERNEL_VERSION)
CATEGORIES = kernel-headers
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = kernel/linux-headers-$(mm_KERNEL_VERSION)

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
