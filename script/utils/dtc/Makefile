
GARNAME      = dtc
GARVERSION   = 1.7.0
CATEGORIES   = utils
MASTER_SITES = https://www.kernel.org/pub/software/utils/dtc/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

BUILD_ARGS   = \
	NO_PYTHON=1 \
	CC="$(CC)" \
	HOME=$(DESTDIR)$(prefix) \

build-custom:
	@echo "Building..."
	@$(MAKE) -C $(WORKSRC) $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-custom:
	@echo "Installing..."
	@$(MAKE) -C $(WORKSRC) $(BUILD_ARGS) install-bin install-lib install-includes
	@$(MAKECOOKIE)

include ../../gar.mk
