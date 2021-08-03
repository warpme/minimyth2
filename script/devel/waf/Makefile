
GARNAME      = waf
GARVERSION   = 2.0.22
CATEGORIES   = devel
MASTER_SITES = https://gitlab.com/ita1024/waf/-/archive/waf-$(GARVERSION)/
DISTFILES    = waf-waf-$(GARVERSION).tar.bz2
LICENSE      = BSD_3_Clause

DESCRIPTION = 
define BLURB
endef

WORKSRC = $(WORKDIR)/waf-waf-$(GARVERSION)

DEPENDS = python/python

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

include ../../gar.mk

configure-custom:
	@cd $(WORKSRC) ; python ./waf-light configure
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC) ; python ./waf-light build
	@$(MAKECOOKIE)

install-custom:
	@cp $(WORKSRC)/waf $(DESTDIR)$(bindir)/waf
	@$(MAKECOOKIE)
