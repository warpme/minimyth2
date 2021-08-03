
GARNAME      = gptfdisk
GARVERSION   = 1.0.8
CATEGORIES   = utils
MASTER_SITES = https://downloads.sourceforge.net/project/$(GARNAME)/$(GARNAME)/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/popt

INSTALL_SCRIPTS = custom
BUILD_SCRIPTS   = custom

BUILD_ARGS   = \
	CC="$(CC)" \
	CXX="$(CXX)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS) $(LDFLAGS)" \
	CXXFLAGS="$(CXXFLAGS) $(LDFLAGS)"

include ../../gar.mk

build-custom:
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC)
	@$(MAKECOOKIE)

install-custom:
	@cp -f $(WORKSRC)/cgdisk $(DESTDIR)$(bindir)/cgdisk
	@cp -f $(WORKSRC)/gdisk $(DESTDIR)$(bindir)/gdisk
	@cp -f $(WORKSRC)/sgdisk $(DESTDIR)$(bindir)/sgdisk
	@cp -f $(WORKSRC)/fixparts $(DESTDIR)$(bindir)/fixparts
	@$(MAKECOOKIE)
