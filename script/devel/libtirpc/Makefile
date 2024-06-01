
GARNAME      = libtirpc
# v1.3.4
GARVERSION   = 20231107-e86eef35f36
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
