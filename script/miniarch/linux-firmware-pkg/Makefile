
GARNAME       = miniarch-firmware.pkg
GARVERSION    = 1.0
CATEGORIES    = miniarch
MASTER_SITES  = 
DISTFILES     = \
	PKGBUILD \

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

BUILDDEPS = miniarch/pacman
DEPENDS   = meta/minimyth

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk
include ../../kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk

build-custom:
	@mkdir -p $(WORKSRC)/src
	@echo "symlinking sources ..."
	@# ln -srf $(DESTDIR)$(elibdir)/firmware $(WORKSRC)/src/
	@# use highly optimized mm2 firmware fileset
	@ln -srf $(DESTDIR)/../mm2-rootfs/lib/firmware $(WORKSRC)/src/
	@echo "starting packaging with MAKEPKG ..."
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/makepkg --skipinteg
	@$(MAKECOOKIE)

install-custom:
	@cp -f $(WORKDIR)/linux-firmware-* $(mm_SDCARD_FILES)/
	@$(MAKECOOKIE)
