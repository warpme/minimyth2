
GARNAME      = tinyxxd
GARVERSION   = 1.3.17
CATEGORIES   = utils
MASTER_SITES = https://github.com/xyproto/tinyxxd/releases/download/v$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL

DEPENDS = lang/c

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = custom

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -f $(WORKSRC)/tinyxxd $(DESTDIR)$(bindir)/xxd
	@$(MAKECOOKIE)
