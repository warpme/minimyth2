
GARNAME      = libtirpc
GARVERSION   = 20250201-240ee6c7
CATEGORIES   = devel
MASTER_SITES = git://git.linux-nfs.org/projects/steved/libtirpc.git/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = BSD

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \
	--disable-static \
	--disable-gssapi \

include ../../gar.mk

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libtirpc.la
	@$(MAKECOOKIE)
