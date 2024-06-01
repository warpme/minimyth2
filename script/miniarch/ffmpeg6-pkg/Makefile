
GARNAME       = miniarch-ffmpeg6.pkg
GARVERSION    = 1.0
CATEGORIES    = miniarch
MASTER_SITES  = 
DISTFILES     = \
	PKGBUILD \

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

BUILDDEPS = miniarch/pacman
DEPENDS   = lib/ffmpeg6

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

build-custom:
	@#mkdir -p $(WORKSRC)/src
	@echo "symlinking sources ..."
	@ln -srf ../../../images/main $(WORKSRC)/src

	@echo "starting packaging with MAKEPKG ..."
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/makepkg --skipinteg
	@$(MAKECOOKIE)

install-custom:
	@cp -f $(WORKDIR)/ffmpeg-* $(mm_SDCARD_FILES)/
	@$(MAKECOOKIE)
