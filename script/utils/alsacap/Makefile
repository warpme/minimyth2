
GARNAME      = alsacap
GARVERSION   = 09-01-2020
MASTER_SITES = http://www.volkerschatz.com/noise/
DISTFILES    = $(GARNAME).tgz
WORKSRC      = $(WORKDIR)/alsacap

CATEGORIES = lib
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lib/alsa-lib

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
	@$(CC) $(CXXFLAGS) $(LDFLAGS) -o $(WORKSRC)/alsacap $(WORKSRC)/alsacap.c -lasound -L$(DESTDIR)$(libdir)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@echo "Installing alsacap..."
	@cp -rf $(WORKSRC)/alsacap $(DESTDIR)$(bindir)/alsacap
	@$(MAKECOOKIE)
