
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
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

BUILD_ARGS = \
	CC="$(CC)" \
	CFLAGS="$(CFLAGS)"

INSTALL_ARGS = \
	INSTROOT=$(DESTDIR)$(prefix) \
	INSTBIN=$(DESTDIR)$(bindir) \
	INSTMAN=$(DESTDIR)$(mandir)

include ../../gar.mk

CFLAGS += -DUSE_IOCTL -DPOSIX_SIG -DHAVE_INET_ATON
