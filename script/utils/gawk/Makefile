GARNAME = gawk
GARVERSION = 4.1.3
CATEGORIES = utils
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-nls \
	--disable-rpath \
	--with-gnu-ld

include ../../gar.mk
