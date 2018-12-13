
# GIT URL: https://github.com/T4d3o/Plymouth-lite

GARNAME      = plymouth-lite
GARVERSION   = master
MASTER_SITES = https://github.com/T4d3o/Plymouth-lite/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/Plymouth-lite-$(GARVERSION)

CATEGORIES = lib
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lib/libpng

CONFIGURE_SCRIPTS   = plymouth
BUILD_SCRIPTS       = plymouth
INSTALL_SCRIPTS     = plymouth

BUILD_ARGS   = \
	CC="$(CC)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS) $(LDFLAGS)" \
	CXXFLAGS="$(CXXFLAGS) $(LDFLAGS)"

include ../../gar.mk

configure-plymouth:
	@$(MAKECOOKIE)

build-plymouth:
	@echo "Building..."
	@$(CC) $(CXXFLAGS) $(LDFLAGS) -o $(WORKSRC)/ply-image $(WORKSRC)/ply-image.c $(WORKSRC)/ply-frame-buffer.c -lpng -L$(DESTDIR)$(libdir)
	@$(MAKECOOKIE)

install-plymouth:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -rf $(WORKSRC)/ply-image $(DESTDIR)$(bindir)/ply-image
	@$(MAKECOOKIE)
