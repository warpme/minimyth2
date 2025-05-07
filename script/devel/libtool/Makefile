
GARNAME      = libtool
GARVERSION   = 2.4.6
CATEGORIES   = devel
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = $(DISTNAME)-no_use_linker_plugin.patch 
PATCHFILES  += $(DISTNAME)-bash.patch.gar 
PATCHFILES  += $(DISTNAME)-use_ld.patch
PATCHFILES  += $(DISTNAME)-armv7h-nopic.patch
PATCHFILES  += $(DISTNAME)-trailingslash.patch
PATCHFILES  += $(DISTNAME)-fixinstall.patch
PATCHFILES  += $(DISTNAME)-fix-building-with-automake1.16.patch
PATCHFILES  += $(DISTNAME)-stop-building-doc.patch
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--with-gnu-ld

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libltdl.la
	@$(MAKECOOKIE)
