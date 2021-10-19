
GARNAME      = libnfs
GARVERSION   = 4.0.0
CATEGORIES   = net
MASTER_SITES = https://github.com/sahlberg/libnfs/archive/
DISTFILES    = $(DISTNAME).tar.gz
WORKSRC      = $(WORKDIR)/libnfs-libnfs-$(GARVERSION)
LICENSE      = GPL

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libnfs.la
	@$(MAKECOOKIE)
