
GARNAME      = libiconv
GARVERSION   = 1.18
CATEGORIES   = lib
MASTER_SITES = https://ftp.gnu.org/pub/gnu/libiconv/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libcharset.la
	@rm -f $(DESTDIR)$(libdir)/libiconv.la
	@$(MAKECOOKIE)
