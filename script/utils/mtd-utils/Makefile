
GARNAME      = mtd-utils
GARVERSION   = 2.3.0
CATEGORIES   = utils
MASTER_SITES = ftp://ftp.infradead.org/pub/mtd-utils/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = GPL2

DEPENDS = lang/c lib/lzo lib/libzstd devel/zlib utils/util-linux

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \
	--disable-unit-tests \
	--without-tests \
	--without-jffs \
	--without-ubifs \
	--without-selinux \
	--without-crypto \

include ../../gar.mk
