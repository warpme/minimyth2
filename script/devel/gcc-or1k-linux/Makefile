
GARNAME      = gcc-or1k-linux
GARVERSION   = 2020.08-1
CATEGORIES   = lib
MASTER_SITES = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/
DISTFILES    = openrisc--musl--stable-$(GARVERSION).tar.bz2
WORKSRC      = $(WORKDIR)/openrisc--musl--stable-$(GARVERSION)
LICENSE      = 

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = 
INSTALL_SCRIPTS   = custom

install-custom:
	@mkdir -p $(DESTDIR)$(libdir)/gcc-or1k-linux
	@cp -rf $(WORKSRC)/* $(DESTDIR)$(libdir)/gcc-or1k-linux
	@#$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(libdir)/gcc-or1k-linux*

include ../../gar.mk
