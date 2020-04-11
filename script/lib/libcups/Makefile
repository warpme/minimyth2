
GARNAME      = cups
GARVERSION   = 2.3.1
CATEGORIES   = lib
MASTER_SITES = https://github.com/apple/cups/releases/download/v$(GARVERSION)/
DISTFILES    = $(DISTNAME)-source.tar.gz
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--prefix=$(DESTDIR)$(prefix) \
	--enable-shared \
	--disable-static \
	--with-components=core \

include ../../gar.mk

post-install:
	@$(MAKECOOKIE)
