
GARNAME      = netpipes
GARVERSION   = 4.2
CATEGORIES   = net
MASTER_SITES = https://sourceforge.net/projects/netpipes/files/netpipes/4.2/
DISTFILES    = $(DISTNAME)-export.tar.gz
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

WORKSRC = $(WORKDIR)

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = custom

BUILD_ARGS = \
	CC="$(CC)" \
	CFLAGS="$(CFLAGS) -std=c17 -Dlinux -DUSE_IOCTL -UPOSIX_SIG -DHAVE_INET_ATON -Wno-implicit-function-declaration" \
	hose \

include ../../gar.mk

install-custom:
	@cp -f $(WORKSRC)/hose $(DESTDIR)$(bindir)/
	@$(MAKECOOKIE)

