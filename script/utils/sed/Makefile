
GARNAME      = sed
GARVERSION   = 4.8
CATEGORIES   = utils
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL3/FDL1_3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-nls \
	--disable-rpath \
	--enable-i18n \
	--enable-regex-tests \
	--with-gnu-ld

include ../../gar.mk
