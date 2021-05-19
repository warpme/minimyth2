
GARNAME      = lshw
GARVERSION   = B.02.19.2
CATEGORIES   = utils
MASTER_SITES = https://ezix.org/software/files/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

include ../../gar.mk

BUILD_ARGS   = \
	CC="$(CC)" \
	CXX="$(CXX)" \
	CROSS_COMPILE="$(compiler_prefix)" \
	PREFIX="$(DESTDIR)/usr" \
	SBINDIR="$(DESTDIR)/usr/bin" \
	VERSION="$(GARVERSION)" \

build-custom:
	@$(warning buildargs: $(BUILD_ARGS))
	@$(MAKE) -C $(WORKSRC)/src $(BUILD_ARGS)
	@#$(MAKECOOKIE)

install-custom:
	@$(MAKE) -C $(WORKSRC)/src $(BUILD_ARGS) install
	@#$(MAKECOOKIE)
