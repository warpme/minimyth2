
GARNAME      = grub
GARVERSION   = 2.04
CATEGORIES   = bootloaders
MASTER_SITES = https://git.savannah.gnu.org/cgit/grub.git/snapshot/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

CORE_IMAGE_MODULES_LST= boot linux ext2 fat serial part_msdos part_gpt normal \
			efi_gop iso9660 configfile search loadenv test

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-mm-debug \
	--disable-nls \
	--disable-device-mapper \
	--disable-cache-stats \
	--disable-grub-mkfont \
	--disable-grub-mount \
	--disable-grub-themes \
	--disable-efiemu \
	--disable-boot-time \
	--prefix="/usr" \
	--bindir="$(DESTDIR)$(bindir)" \
	--sbindir="$(DESTDIR)$(bindir)" \
	--mandir="$(DESTDIR)$(mandir)" \
	--infodir="$(DESTDIR)$(infodir)" \
	--datarootdir="$(DESTDIR)$(datadir)" \
	--sysconfdir="$(DESTDIR)$(sysconfdir)" \
	--program-prefix="" \
	--with-bootdir="$(DESTDIR)/boot" \
	--with-grubdir="grub" \
	--enable-silent-rules \
	--disable-werror \
	--with-platform="efi" \
	--target="x86_64" \

include ../../gar.mk

CPP = $(CC) -E

pre-configure:
	@cd $(WORKSRC); ./bootstrap
	@$(MAKECOOKIE)

post-install:
	@echo "Generating GRUB core.efi..."
	@$(WORKSRC)/grub-mkimage \
	 -d $(WORKSRC)/grub-core/ \
	 -O x86_64-efi \
	 -p /EFI/BOOT \
	 -o $(DESTDIR)$(libdir)/grub/x86_64-efi/core.efi \
	 $(CORE_IMAGE_MODULES_LST)
	@$(MAKECOOKIE)
