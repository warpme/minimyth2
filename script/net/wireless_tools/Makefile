
GARNAME      = wireless_tools
GARVERSION   = 30.pre9
CATEGORIES   = net
MASTER_SITES = https://hewlettpackard.github.io/wireless-tools/
DISTFILES    = $(DISTNAME).tar.gz
DISTFILES    = $(GARNAME).$(GARVERSION).tar.gz
WORKSRC      = $(WORKDIR)/$(GARNAME).30
LICENSE      = GPL

DEPENDS = lang/c

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

include ../../gar.mk

BUILD_ARGS   = \
	CC="$(CC)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS) $(LDFLAGS)" \
	CXXFLAGS="$(CXXFLAGS) $(LDFLAGS)"

build-custom:
	@echo "Building..."
	$(MAKE) -C $(WORKSRC) $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@echo "Installing..."
	@cp -rf $(WORKSRC)/{ifrename,iwconfig,iwevent,iwgetid,iwlist,iwpriv,iwspy} $(DESTDIR)$(bindir)/
	@chmod +x $(DESTDIR)$(bindir)/{ifrename,iwconfig,iwevent,iwgetid,iwlist,iwpriv,iwspy}
	@$(MAKECOOKIE)
