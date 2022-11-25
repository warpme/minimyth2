GARNAME = libevdev
GARVERSION = 1.3
CATEGORIES = $(CATEGORY)
MASTER_SITES = http://www.freedesktop.org/software/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING
DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	$(CATEGORY)/xorgproto

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--enable-silent-rules \
	--with-gnu-ld

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@$(MAKECOOKIE)
