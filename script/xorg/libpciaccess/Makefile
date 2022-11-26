
GARNAME      = libpciaccess
GARVERSION   = 0.17
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://xorg.freedesktop.org/releases/individual/lib/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c devel/zlib \
	$(CATEGORY)/util-macros

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--with-gnu-ld \
	--with-pciids-path=$(datadir) \
	--with-zlib

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@$(MAKECOOKIE)
