
GARNAME      = intltool
GARVERSION   = 0.51.0
CATEGORIES   = devel
MASTER_SITES = https://launchpad.net/intltool/trunk/$(GARVERSION)/+download/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c perl/perl perl/perl-XML-Parser
BUILDDEPS = perl/perl perl/perl-XML-Parser

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk

