GARNAME = mplayer-resumer
GARVERSION = 20060503
CATEGORIES = mediaplayers
MASTER_SITES = http://mythic.tv/
DISTFILES = $(GARNAME).pl
PATCHFILES = $(DISTNAME)-get_resume_filename.patch
LICENSE = 

DESCRIPTION =
define BLURB
endef

DEPENDS = perl/perl

INSTALL_SCRIPTS = custom

include ../../gar.mk

extract-$(GARNAME).pl:
	@mkdir -p $(WORKSRC)
	@rm -f $(WORKSRC)/$(GARNAME).pl
	@cp -f $(DOWNLOADDIR)/$(GARNAME).pl $(WORKSRC)/$(GARNAME).pl
	@chmod 0755 $(WORKSRC)/$(GARNAME).pl
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@rm -f $(DESTDIR)$(bindir)/$(GARNAME).pl
	@cp -f $(WORKSRC)/$(GARNAME).pl $(DESTDIR)$(bindir)/$(GARNAME).pl
	@chmod 0755 $(DESTDIR)$(bindir)/$(GARNAME).pl
	@$(MAKECOOKIE)
