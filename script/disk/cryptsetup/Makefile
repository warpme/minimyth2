
GARNAME      = cryptsetup
GARVERSION   = 2.4.3
CATEGORIES   = lib
MASTER_SITES = https://www.kernel.org/pub/linux/utils/cryptsetup/v2.4/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c disk/LVM2 lib/popt lib/openssl utils/util-linux lib/libjson-c utils/argon2

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-ssh-token \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libcryptsetup.la
	@$(MAKECOOKIE)
