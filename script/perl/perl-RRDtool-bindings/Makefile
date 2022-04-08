
GARNAME      = perl-rrdtool
GARVERSION   = 1.8.0
MASTER_SITES = https://github.com/oetiker/rrdtool-1.x/releases/download/v$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
DEPENDS      = db/rrdtool

include ../../perl/perl/perl-module.mk

pre-configure:
	@mkdir -p $(WORKSRC)/../tmp
	@mv $(WORKSRC)/* $(WORKSRC)/../tmp
	@mv $(WORKSRC)/../tmp/bindings/perl-shared/* $(WORKSRC)/
	@ln -srf src ./work/src
	@$(MAKECOOKIE)
