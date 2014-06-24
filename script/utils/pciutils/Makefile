GARNAME = pciutils
GARVERSION = 3.1.10
CATEGORIES = utils
MASTER_SITES = ftp://ftp.kernel.org/pub/software/utils/pciutils/
DISTFILES  = $(DISTNAME).tar.bz2
DISTFILES += pci.ids
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

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
	SBINDIR="$(sbindir)" \
	SHAREDIR="$(datadir)" \
	IDSDIR="$(datadir)" \
	MANDIR="$(mandir)" \
	INCDIR="$(includedir)" \
	LIBDIR="$(libdir)" \
	PKGCFDIR="$(libdir)/pkgconfig" \
	STRIP="" \
	CC="$(CC)" \
	AR="$(AR)" \
	RANLIB="$(RANLIB)"
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
	SBINDIR="$(sbindir)" \
	SHAREDIR="$(datadir)" \
	IDSDIR="$(datadir)" \
	MANDIR="$(mandir)" \
	INCDIR="$(includedir)" \
	LIBDIR="$(libdir)" \
	PKGCFDIR="$(libdir)/pkgconfig" \
	STRIP="" \
	CC="$(CC)" \
	AR="$(AR)" \
	RANLIB="$(RANLIB)" \
	install-lib

GAR_EXTRA_CONF += kernel-$(mm_KERNEL_VERSION)/linux/package-api.mk
include ../../gar.mk

CFLAGS  := $(CFLAGS)  -fPIC
LDFLAGS := $(LDFLAGS) -fPIC

# pciutils 3.1.10 fails to compile with gcc 4.7.2's link time optimization enabled.
CFLAGS  := $(filter-out -flto, $(CFLAGS))
LDFLAGS := $(filter-out -flto, $(LDFLAGS))

extract-pci.ids:
	@cp -f $(DOWNLOADDIR)/pci.ids $(WORKSRC)/pci.ids
	@$(MAKECOOKIE)
