
GARNAME      = keyutils
GARVERSION   = 1.6.3
CATEGORIES   = lib
MASTER_SITES = https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/snapshot/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = fix-install-so-symlink.patch
LICENSE      = GPL

DEPENDS = lang/c

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

include ../../gar.mk

BUILD_ARGS   = \
	CC="$(CC)" \
	CXX="$(CXX)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS) $(LDFLAGS)" \
	CXXFLAGS="$(CXXFLAGS) $(LDFLAGS)" \

INSTALL_ARGS = \
	DESTDIR="$(DESTDIR)" \
	LIBDIR="$(libdir)" \
	USRLIBDIR="$(libdir)" \
