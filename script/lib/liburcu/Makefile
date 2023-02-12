
GARNAME      = liburcu
GARVERSION   = 0.13.2
CATEGORIES   = lib
MASTER_SITES = https://lttng.org/files/urcu/
DISTFILES    = userspace-rcu-$(GARVERSION).tar.bz2
WORKSRC      = $(WORKDIR)/userspace-rcu-$(GARVERSION)
LICENSE      = GPL2

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/liburcu-bp.la
	@rm -f $(DESTDIR)$(libdir)/liburcu-cds.la
	@rm -f $(DESTDIR)$(libdir)/liburcu-common.la
	@rm -f $(DESTDIR)$(libdir)/liburcu.la
	@rm -f $(DESTDIR)$(libdir)/liburcu-mb.la
	@rm -f $(DESTDIR)$(libdir)/liburcu-memb.la
	@rm -f $(DESTDIR)$(libdir)/liburcu-qsbr.la
	@rm -f $(DESTDIR)$(libdir)/liburcu-signal.la
	@$(MAKECOOKIE)
