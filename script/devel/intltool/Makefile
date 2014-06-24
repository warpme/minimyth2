GARNAME = intltool
GARVERSION = 0.50.2
CATEGORIES = devel
MASTER_SITES  = http://edge.launchpad.net/intltool/trunk/$(GARVERSION)/+download/
MASTER_SITES += http://ftp.gnome.org/pub/gnome/sources/$(GARNAME)/0.41/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2

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

