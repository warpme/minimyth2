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


ifneq (,$(filter rpi%,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-rpi-5.10
else
ifneq (,$(filter %5.9,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-5.9
endif
ifneq (,$(filter %5.10,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-5.10
endif
ifneq (,$(filter %5.11,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-5.11
endif
ifneq (,$(filter %5.12,$(mm_KERNEL_VERSION)))
DEPENDS = kernel/linux-headers-5.12
endif
endif

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)

clean-all:
