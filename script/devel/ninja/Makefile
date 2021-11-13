GARNAME = ninja
GARVERSION = 1.10.2
CATEGORIES = devel
MASTER_SITES = https://github.com/martine/ninja/archive/
DISTFILES = v$(GARVERSION).zip

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS = python2/python

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

include ../../gar.mk

build-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/python ./configure.py --bootstrap
	@$(MAKECOOKIE)

install-custom:
	@cp $(WORKSRC)/ninja $(build_DESTDIR)$(build_bindir)/ninja
	@$(MAKECOOKIE)
