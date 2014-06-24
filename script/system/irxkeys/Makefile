GARNAME = irxkeys
GARVERSION = 1.0
CATEGORIES = system
MASTER_SITES = http://blog.b-ark.ca/download/irxkeys-1.0.tar.gz
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-fixes.patch
LICENSE = Public_Domain

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c system/lirc xorg/xorg

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = custom

BUILD_ARGS = \
	LDFLAGS="$(LDFLAGS)"

include ../../gar.mk

LDFLAGS := -lX11 -lXtst -llirc_client $(LDFLAGS)

LDFLAGS := $(LDFLAGS) -fwhole-program

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -f $(WORKSRC)/irxkeys $(DESTDIR)$(bindir)/irxkeys
	@$(MAKECOOKIE)
