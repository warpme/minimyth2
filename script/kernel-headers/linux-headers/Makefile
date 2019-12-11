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

ifneq (,$(filter %5.3,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-5.3
endif
ifneq (,$(filter %5.4,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-5.4
endif
ifneq (,$(filter %5.5,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-5.5
endif
ifneq (,$(filter %5.6,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-5.6
endif

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)

clean-all:
