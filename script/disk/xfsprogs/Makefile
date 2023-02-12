
GARNAME      = xfsprogs
GARVERSION   = 6.1.1
CATEGORIES   = disk
MASTER_SITES = https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/snapshot/
DISTFILES    = xfsprogs-dev-$(GARVERSION).tar.gz
WORKSRC      = $(WORKDIR)/xfsprogs-dev-$(GARVERSION)
LICENSE      = GPL

DEPENDS = lang/c utils/util-linux lib/libinih lib/liburcu

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

pre-configure:
	@cd $(WORKSRC) ; $(MAKE) configure
	@$(MAKECOOKIE)
