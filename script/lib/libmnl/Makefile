
GARNAME      = libmnl
GARVERSION   = 1.0.5
CATEGORIES   = lib
MASTER_SITES = https://www.netfilter.org/projects/libmnl/files/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libjpeg devel/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--with-gnu-ld \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libmnl.la
	@$(MAKECOOKIE)
