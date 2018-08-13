GARNAME = libtool
GARVERSION = 2.4.6
CATEGORIES = devel
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES  = $(DISTNAME)-no_use_linker_plugin.patch 
PATCHFILES += $(DISTNAME)-bash.patch.gar 
PATCHFILES += $(DISTNAME)-use_ld.patch
PATCHFILES += $(DISTNAME)-armv7h-nopic.patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c doc/help2man

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = ltmain.sh

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--with-gnu-ld \

include ../../gar.mk

install-ltmain.sh:
	@mkdir -p $(DESTDIR)$(datadir)/libtool-build/build-aux
	@cp -f $(WORKSRC)/build-aux/ltmain.sh $(DESTDIR)$(datadir)/libtool-build/build-aux/ltmain.sh
	@$(MAKECOOKIE)
