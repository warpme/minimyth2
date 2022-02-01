
GARNAME      = peekpoke
GARVERSION   = d056ff7090de9e1d4ccd36c5a6d365c779f8505b
MASTER_SITES = https://github.com/apritzel/peekpoke/archive/
DISTFILES    = $(GARVERSION).zip
CATEGORIES   = util
LICENSE      = GPL2/LGPL2_1

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
	@$(CC) $(CXXFLAGS) $(LDFLAGS) -o $(WORKSRC)/peekpoke $(WORKSRC)/peekpoke.c -I$(DESTDIR)$(includedir) -L$(DESTDIR)$(libdir)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@echo "Installing..."
	@cp -rf $(WORKSRC)/peekpoke $(DESTDIR)$(bindir)/peekpoke
	@chmod +x $(DESTDIR)$(bindir)/peekpoke
	@$(MAKECOOKIE)
