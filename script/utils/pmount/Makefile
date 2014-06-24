GARNAME = pmount
GARVERSION = 0.9.23
CATEGORIES = utils
MASTER_SITES = http://alioth.debian.org/frs/download.php/3310/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = \
	$(DISTNAME)-automake_1.13.patch \
	$(DISTNAME)-install.patch
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c utils/util-linux
BUILDDEPS = perl/perl-XML-Parser

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-nls \
	--enable-shared \
	--disable-static \
	--disable-hal \
	--with-gnu-ld \
	--with-media-dir="$(rootdir)/media/" \
	--with-lock-dir="$(localstatedir)/lock/pmount" \
	--with-whitelist="$(sysconfdir)/pmount.allow" \
	--with-mount-prog="$(ebindir)/mount" \
	--with-umount-prog="$(ebindir)/umount" \
	--with-cryptsetup-prog="$(esbindir)/cryptsetup"

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
