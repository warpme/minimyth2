
GARNAME      = libevent
GARVERSION   = 2.1.12
CATEGORIES   = lib
MASTER_SITES = https://github.com/libevent/libevent/releases/download/release-$(GARVERSION)-stable/
DISTFILES    = $(DISTNAME)-stable.tar.gz
LICENSE      = LGPL2

DESCRIPTION = 
define BLURB
endef

WORKSRC = $(WORKDIR)/$(DISTNAME)-stable

DEPENDS = lang/c lib/libusb-compat

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--with-gnu-ld

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libevent*.la
	@$(MAKECOOKIE)
