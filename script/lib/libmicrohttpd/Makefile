
GARNAME      = libmicrohttpd
GARVERSION   = 0.9.73
CATEGORIES   = lib
MASTER_SITES = https://ftp.gnu.org/gnu/libmicrohttpd/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL

DEPENDS = net/curl

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libmicrohttpd.la
	@$(MAKECOOKIE)
