
GARNAME      = keyutils
GARVERSION   = 1.6.3
CATEGORIES   = lib
MASTER_SITES = https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/snapshot/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL

DEPENDS = lang/c

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

include ../../gar.mk

BUILD_ARGS   = \
	CC="$(CC)" \
	CXX="$(CXX)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS) $(LDFLAGS)" \
	CXXFLAGS="$(CXXFLAGS) $(LDFLAGS)"

build-custom:
	@echo "Building..."
	@$(MAKE) -C $(WORKSRC) $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-custom:
	@echo "Installing..."
	@$(MAKE) -C $(WORKSRC) DESTDIR="$(DESTDIR)" SBINDIR='/usr/bin' BINDIR='/usr/bin' LIBDIR='/usr/lib' USRLIBDIR='/usr/lib' install
	@$(MAKECOOKIE)
