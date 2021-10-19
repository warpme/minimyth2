
GARNAME      = giflib
GARVERSION   = 5.2.1
CATEGORIES   = lib
MASTER_SITES = https://downloads.sourceforge.net/project/giflib/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = MIT

DEPENDS = lang/c

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

BUILD_ARGS   = \
	CC="$(CC) -fPIC" \
	LD="$(CC) -fPIC" \
	CFLAGS="$(CFLAGS) $(LDFLAGS)" \

build-custom:
	@echo "Building..."
	$(MAKE) -C $(WORKSRC) $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-custom:
	@echo "Installing..."
	$(MAKE) -C $(WORKSRC) PREFIX=$(prefix) DESTDIR="$(DESTDIR)" install
	@$(MAKECOOKIE)
