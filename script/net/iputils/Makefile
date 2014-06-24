GARNAME = iputils
GARVERSION = s20121221
CATEGORIES = net
MASTER_SITES = http://www.skbuff.net/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME).patch
LICENSE = BSD_4_Clause

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = custom

BUILD_ARGS   = \
	USE_CAP=no \
	USE_SYSFS=no \
	LIBC_INCLUDE=$(includedir) \
	CC="$(CC)" \
	ping

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

install-custom:
	@mkdir -p $(DESTDIR)$(ebindir)
	@install -m 755 $(WORKSRC)/ping $(DESTDIR)$(ebindir)
	@$(MAKECOOKIE)
