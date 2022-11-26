
GARNAME      = libepoxy
GARVERSION   = 1.5.10
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://github.com/anholt/libepoxy/archive/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING
DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))
BUILDDEPS  = python2/python-argparse

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@$(MAKECOOKIE)
