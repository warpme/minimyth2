GARNAME = netpipes
GARVERSION = 4.2
CATEGORIES = net
MASTER_SITES = http://ftp.hu.freebsd.org/debian/pool/main/n/$(GARNAME)/
DISTFILES = $(GARNAME)_$(GARVERSION).orig.tar.gz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

WORKSRC = $(WORKDIR)/$(DISTNAME).orig

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

BUILD_ARGS = \
	CC="$(CC)" \
	CFLAGS="$(CFLAGS)"

INSTALL_ARGS = \
	INSTROOT=$(DESTDIR)$(prefix) \
	INSTBIN=$(DESTDIR)$(bindir) \
	INSTMAN=$(DESTDIR)$(mandir)

#BUILD_OVERRIDE_DIRS   = prefix bindir mandir locdir
#INSTALL_OVERRIDE_DIRS = prefix bindir mandir locdir

include ../../gar.mk

CFLAGS += -DUSE_IOCTL -DPOSIX_SIG -DHAVE_INET_ATON
