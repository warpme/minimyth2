GARNAME = wakelan
GARVERSION = 1.1
CATEGORIES = net
MASTER_SITES = ftp://metalab.unc.edu/pub/Linux/system/network/misc/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

INSTALL_OVERRIDE_DIRS = \
	prefix \
	exec_prefix \
	bindir \
	mandir
	
include ../../gar.mk
