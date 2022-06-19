
GARNAME      = termbin
GARVERSION   = a15fdaadf3e2b110673bb27b28ec14b6793310ce
MASTER_SITES = https://raw.githubusercontent.com/Honeta/Termbin/$(GARVERSION)/
DISTFILES    = termbin.c
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
	@$(CC) $(CXXFLAGS) $(LDFLAGS) -o $(WORKSRC)/termbin $(WORKSRC)/termbin.c -I$(DESTDIR)$(includedir) -L$(DESTDIR)$(libdir)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@echo "Installing..."
	@cp -rf $(WORKSRC)/termbin $(DESTDIR)$(bindir)/termbin
	@chmod +x $(DESTDIR)$(bindir)/termbin
	@$(MAKECOOKIE)
