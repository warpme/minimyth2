GARNAME = kernel
GARVERSION = 3.18
CATEGORIES = kernel-3.18
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	$(filter-out %/Makefile %/kernel %/alsa-driver,$(subst ../../,,$(wildcard ../../kernel-3.18/*)))

GAR_EXTRA_CONF += kernel-3.18/linux/package-api.mk
include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(LINUX_DIR)
	@rm -rf $(DESTDIR)$(LINUX_MODULESPREFIX)
	@$(MAKE) clean-all -C ../../system/lirc
	@$(MAKE) clean-all -C ../../nvidia
	@$(MAKE) clean     -C ../../kernel/kernel
	@$(foreach dir,$(filter-out %/Makefile,$(wildcard ../../kernel/* ../../kernel-3.*/*)),$(MAKE) -C $(dir) clean ; )
