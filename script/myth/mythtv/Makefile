GARNAME = myth
GARVERSION =
CATEGORIES = myth
LICENSE =

DESCRIPTION = 
define BLURB
endef

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)

clean-all:
	@$(foreach dir, $(wildcard ../../myth-*), $(MAKE) clean-all -C $(dir)/mythtv ; )
	@$(MAKE) clean
