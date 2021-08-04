GARNAME = dtc
GARVERSION = 1.6.1
CATEGORIES = utils
MASTER_SITES = https://www.kernel.org/pub/software/utils/dtc/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2

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

build-custom:
	@echo "Building..."
	$(MAKE) -C $(WORKSRC) $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-custom:
	@echo "Installing..."
	@cp $(WORKSRC)/convert-dtsv0 $(DESTDIR)$(bindir)/convert-dtsv0
	@cp $(WORKSRC)/dtc           $(DESTDIR)$(bindir)/dtc
	@cp $(WORKSRC)/fdtdump       $(DESTDIR)$(bindir)/fdtdump
	@cp $(WORKSRC)/fdtget        $(DESTDIR)$(bindir)/fdtget
	@cp $(WORKSRC)/fdtput        $(DESTDIR)$(bindir)/fdtput
	@cp $(WORKSRC)/fdtoverlay    $(DESTDIR)$(bindir)/fdtoverlay
	@$(MAKECOOKIE)

include ../../gar.mk
