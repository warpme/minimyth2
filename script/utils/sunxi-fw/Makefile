
GARNAME      = sunxi-fw
# 21.10.2024
GARVERSION   = 60712ec2da5c56693bd1d557bb9879e9f3abcf45
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

CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

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
