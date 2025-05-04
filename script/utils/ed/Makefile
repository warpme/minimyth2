
GARNAME      = ed
GARVERSION   = 1.21.1
CATEGORIES   = utils
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.lz
LICENSE      = GPL3/FDL1_3

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
	CC="$(CC)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CCFLAGS="$(CCFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	SHELL="$(SHELL)"
BUILD_ARGS     = \
	SHELL="$(SHELL)"
INSTALL_ARGS   = \
	SHELL="$(SHELL)"

include ../../gar.mk
