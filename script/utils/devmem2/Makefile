
GARNAME      = devmem2
GARVERSION   = 2016-04-18
MASTER_SITES = https://bootlin.com/pub/mirror/
DISTFILES    = devmem2.c
WORKSRC      = $(WORKDIR)

CATEGORIES = lib
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

BUILD_ARGS   = \
	CC="$(CC)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS) $(LDFLAGS)" \
	CXXFLAGS="$(CXXFLAGS) $(LDFLAGS)"

build-custom:
	@echo "Building..."
	@$(CC) $(CXXFLAGS) $(LDFLAGS) -o $(WORKSRC)/devmem2 $(WORKSRC)/devmem2.c -I$(DESTDIR)$(includedir) -L$(DESTDIR)$(libdir)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@echo "Installing..."
	@cp -rf $(WORKSRC)/devmem2 $(DESTDIR)$(bindir)/devmem2
	@chmod +x $(DESTDIR)$(bindir)/devmem2
	@$(MAKECOOKIE)
