GARNAME = devel-tainted
CATEGORIES = devel-tainted
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	devel-tainted/binutils \
	devel-tainted/gcc

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
