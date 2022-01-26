
GARNAME      = bootfiles-x86pc.efi64
GARVERSION   = 2020-03-15
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = minimyth.conf

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILDDEPS   = bootloaders/grub2

BUILD_SCRIPTS   =
INSTALL_SCRIPTS = custom
CLEAN_SCRIPTS   = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)/boot/
	@cp $(build_libdir)/grub/x86_64-efi/core.efi $(DESTDIR)/boot/grub-efi-bootx64.efi
	@cp -f $(WORKSRC)/minimyth.conf              $(DESTDIR)/boot/minimyth.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -f $(DESTDIR)/boot/grub-efi-bootx64.efi
	@rm -f $(DESTDIR)/boot/minimyth.conf

clean-all: clean-custom cookieclean
