
GARNAME       = miniarch.pkg
GARVERSION    = 1.0
CATEGORIES    = miniarch
MASTER_SITES  = 
DISTFILES     = PKGBUILD miniarch.install

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

BUILDDEPS = miniarch/pacman
DEPENDS   = 

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk
include ../../kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk

build-custom:
	@echo "starting packaging with MAKEPKG ..."
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/makepkg --skipinteg
	@$(MAKECOOKIE)

install-custom:
	@cp -f $(WORKDIR)/miniarch-meta* $(mm_SDCARD_FILES)/
	@$(MAKECOOKIE)
