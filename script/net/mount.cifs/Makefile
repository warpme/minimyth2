
GARNAME      = mount.cifs
GARVERSION   = 4.14.6
CATEGORIES   = net
DISTFILES    = samba-$(GARVERSION).tar.gz
MASTER_SITES = https://us1.samba.org/samba/ftp/stable/
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

WORKSRC = $(WORKDIR)/samba-$(GARVERSION)/client

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

build-custom:
	@$(BUILD_ENV) cd $(WORKSRC) ; $(CC) -o mount.cifs $(CFLAGS) mount.cifs.c mtab.c
	@$(MAKECOOKIE)

install-custom:
	@$(INSTALL_ENV) install -m755 $(WORKSRC)/mount.cifs $(DESTDIR)$(esbindir)/mount.cifs
	@$(MAKECOOKIE)
