
GARNAME      = libxshmfence
GARVERSION   = 1.3
CATEGORIES   = $(CATEGORY)
MASTER_SITES = http://xorg.freedesktop.org/releases/individual/lib/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING
DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c xorg/util-macros xorg/xorgproto

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

BUILDDEPS  = xorg/util-macros xorg/xorgproto

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@$(MAKECOOKIE)
