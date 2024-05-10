
GARNAME      = sunxi-fw
# 26.12.2023
GARVERSION   = a768b73128053762c5e4b27b4a1e5d82b2d09aed
MASTER_SITES = https://github.com/apritzel/sunxi-fw/archive/
DISTFILES    = $(GARVERSION).zip
CATEGORIES   = util
LICENSE      = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c utils/dtc

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = custom

include ../../gar.mk

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

BUILD_ARGS   = \
    CC="$(CC)" \
    DESTDIR="$(DESTDIR)" \
    PREFIX="$(prefix)" \
    CFLAGS="$(CFLAGS) $(LDFLAGS)" \

INSTALL_ARGS = \
    DESTDIR="$(DESTDIR)" \
    PREFIX="$(prefix)" \

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@echo "Installing..."
	@cp -rf $(WORKSRC)/sunxi-fw $(DESTDIR)$(bindir)/
	@chmod +x $(DESTDIR)$(bindir)/sunxi-fw
	@$(MAKECOOKIE)
