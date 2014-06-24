GARNAME = cxx
GARVERSION = none
CATEGORIES = lang

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c lib/libstdcxx
BUILDDEPS = lang/cxx

include ../../gar.mk

$(DESTIMG)_NODEPEND += lang/cxx
export $(DESTIMG)_NODEPEND

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
