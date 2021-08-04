
GARNAME      = rsync
GARVERSION   = 3.2.3
CATEGORIES   = utils
MASTER_SITES = https://rsync.samba.org/ftp/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-simd \
	--disable-xxhash \
	--disable-zstd \
	--disable-lz4 \

include ../../gar.mk
