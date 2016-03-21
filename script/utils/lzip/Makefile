GARNAME = lzip
GARVERSION = 1.17
CATEGORIES = utils
MASTER_SITES = http://download.savannah.gnu.org/releases/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	--prefix="$(prefix)" \
	--exec-prefix="$(exec_prefix)" \
	--bindir="$(bindir)" \
	--datarootdir="$(datadir)" \
	--infodir="$(infodir)" \
	--mandir="$(mandir)" \
	CXX="$(CXX)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CXXFLAGS="$(CXXFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	SHELL="$(SHELL)"
BUILD_ARGS     = \
	SHELL="$(SHELL)"
INSTALL_ARGS   = \
	SHELL="$(SHELL)"

include ../../gar.mk
