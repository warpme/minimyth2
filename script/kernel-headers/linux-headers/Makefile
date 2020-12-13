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


ifneq (,$(filter %5.4,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-rpi-5.4
endif
ifneq (,$(filter %5.9,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-5.9
endif
ifneq (,$(filter %5.10,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-5.10
endif
ifneq (,$(filter %5.11,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-5.11
endif

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)

clean-all:
