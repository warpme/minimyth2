
GARNAME       = acl
GARVERSION    = 2.3.2
CATEGORIES    = lib
MASTER_SITES  = https://download.savannah.gnu.org/releases/acl/
DISTFILES     = $(DISTNAME).tar.gz
LICENSE       = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libattr

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--disable-gettext \
	--disable-lib64 \
	--with-gnu-ld
BUILD_ARGS     = SHELL=$(CONFIG_SHELL)
INSTALL_ARGS   = SHELL=$(CONFIG_SHELL)

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libacl.a
	@rm -f $(DESTDIR)$(libdir)/libacl.la
	@rm -f $(DESTDIR)$(libexecdir)/libacl.la
	@$(MAKECOOKIE)
