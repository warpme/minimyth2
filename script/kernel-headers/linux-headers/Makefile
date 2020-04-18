GARNAME = linux-headers
GARVERSION = $(mm_KERNEL_VERSION)
CATEGORIES = kernel
LICENSE =

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	utils/rsync \

include ../../minimyth.conf.mk


ifneq (,$(filter %4.19,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-5.6
endif
ifneq (,$(filter %5.6,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-5.6
endif
ifneq (,$(filter %5.7,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-5.7
endif
ifneq (,$(filter %5.8,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-5.8
endif
ifneq (,$(filter %5.9,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-5.9
endif

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)

clean-all:
