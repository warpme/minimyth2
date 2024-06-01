
GARNAME      = pmount
GARVERSION   = 0.9.23
CATEGORIES   = utils
MASTER_SITES = http://http.debian.net/debian/pool/main/p/$(GARNAME)/
DISTFILES    = $(GARNAME)_$(GARVERSION).orig.tar.bz2
PATCHFILES   = \
	$(DISTNAME)-automake_1.13.patch \
	$(DISTNAME)-install.patch
LICENSE      = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c utils/util-linux
BUILDDEPS = perl/perl-XML-Parser

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CFLAGS += -Wno-implicit-function-declaration

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
