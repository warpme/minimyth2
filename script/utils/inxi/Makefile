
GARNAME      = inxi
GARVERSION   = 3.3.31-2
CATEGORIES   = utils
MASTER_SITES = https://github.com/smxi/inxi/archive/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = GPL3

DESCRIPTION =
define BLURB
endef

DEPENDS = perl/perl-XML-Dumper

BUILD_SCRIPTS   = 
INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@cp -f $(WORKSRC)/inxi $(DESTDIR)/$(bindir)/inxi
	@$(MAKECOOKIE)
