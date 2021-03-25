GARNAME = linux-headers
GARVERSION = $(mm_KERNEL_VERSION)
CATEGORIES = kernel
LICENSE =

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	utils/rsync \

INSTALL_SCRIPTS   = custom

include ../../minimyth.conf.mk

install-custom:
	@$(MAKE) -C ../../kernel/linux-$(mm_KERNEL_VERSION) install-headers
	@$(MAKECOOKIE)

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) -C ../../kernel/linux-$(mm_KERNEL_VERSION) clean
