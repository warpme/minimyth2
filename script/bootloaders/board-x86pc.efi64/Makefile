
GARNAME      = bootfiles-x86pc.efi64
GARVERSION   = 2020-03-07
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = 

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   =
INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)/boot/
	@cp -rf $(build_libdir)/grub/x86_64-efi $(DESTDIR)/boot/grub-efi-x86_64
	@mkdir -p $(DESTDIR)/boot/EFI/boot
	@cp $(build_libdir)/grub/x86_64-efi/core.efi $(DESTDIR)/boot/EFI/boot/core.efi
	@#$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)/boot/grub*
