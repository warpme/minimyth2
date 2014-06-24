GARNAME = powernowd
GARVERSION = 1.00
CATEGORIES = system
MASTER_SITES = http://www.deater.net/john/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

build-custom:
	cd $(WORKSRC) ; $(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o powernowd powernowd.c
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC) ; install -m 755 -D powernowd $(DESTDIR)$(sbindir)/powernowd
	@$(MAKECOOKIE)
