
GARNAME      = pciutils
GARVERSION   = 3.3.0
CATEGORIES   = utils
MASTER_SITES = https://www.kernel.org/pub/software/utils/pciutils/
DISTFILES    = $(DISTNAME).tar.xz
DISTFILES   += pci.ids
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c data/hwdata

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

BUILD_ARGS   = \
	OPT="$(CFLAGS)" \
	HOST="$(GARCH_FAMILY)-dummy-linux" \
	RELEASE="$(LINUX_VERSION)" \
	CROSS_COMPILE="$(compiler_prefix)" \
	ZLIB="no" \
	DNS="no" \
	SHARED="yes" \
	DESTDIR="$(DESTDIR)" \
	PREFIX="$(prefix)" \
	BINDIR="$(bindir)" \
	SBINDIR="$(sbindir)" \
	SHAREDIR="$(datadir)/hwdata" \
	IDSDIR="$(datadir)/hwdata" \
	MANDIR="$(mandir)" \
	INCDIR="$(includedir)" \
	PKGCFDIR="$(libdir)/pkgconfig" \
	all

INSTALL_ARGS = \
	OPT="$(CFLAGS)" \
	HOST="$(GARCH_FAMILY)-dummy-linux" \
	RELEASE="$(LINUX_VERSION)" \
	CROSS_COMPILE="$(compiler_prefix)" \
	ZLIB="no" \
	DNS="no" \
	SHARED="yes" \
	DESTDIR="$(DESTDIR)" \
	PREFIX="$(prefix)" \
	BINDIR="$(bindir)" \
	SBINDIR="$(sbindir)" \
	SHAREDIR="$(datadir)/hwdata" \
	IDSDIR="$(datadir)/hwdata" \
	MANDIR="$(mandir)" \
	INCDIR="$(includedir)" \
	PKGCFDIR="$(libdir)/pkgconfig" \
	install-lib

GAR_EXTRA_CONF += kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk
include ../../gar.mk

CFLAGS  := $(CFLAGS)  -fPIC
LDFLAGS := $(LDFLAGS) -fPIC
