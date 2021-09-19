
GARNAME      = libedit
GARVERSION   = 20210910-3.1
CATEGORIES   = lib
MASTER_SITES = https://thrysoee.dk/editline/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = BSD

DEPENDS = lib/ncurses lib/ncursesw

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libedit.la
	@$(MAKECOOKIE)
