
GARNAME      = libtirpc
GARVERSION   = 1.3.2
CATEGORIES   = devle
MASTER_SITES = https://downloads.sourceforge.net/sourceforge/libtirpc/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = BSD

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \
	--disable-static \
	--disable-gssapi \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libtirpc.la
	@$(MAKECOOKIE)
