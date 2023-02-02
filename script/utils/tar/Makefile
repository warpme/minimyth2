
GARNAME      = tar
GARVERSION   = 1.34
CATEGORIES   = utils
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.xz
PATCHFILES   = $(DISTNAME)-disable-building-doc-po.patch
LICENSE      = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c utils/pbzip2 utils/pigz

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--disable-rpath \
	--with-gnu-ld \
	--with-gzip=pigz \
	--with-bzip2=pbzip2 \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
