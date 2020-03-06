
GARNAME      = bootfiles-x86pc.bios
GARVERSION   = 2020-03-06
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = 

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILDDEPS   = bootloaders/syslinux

BUILD_SCRIPTS   =
INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)/boot/syslinux
	@cp -f $(build_datadir)/syslinux/ldlinux.c32  $(DESTDIR)/boot/syslinux/ldlinux.c32
	@cp -f $(build_datadir)/syslinux/ldlinux.c32  $(DESTDIR)/boot/syslinux/ldlinux.sys
	@cp -f $(build_datadir)/syslinux/libcom32.c32 $(DESTDIR)/boot/syslinux/libcom32.c32
	@cp -f $(build_datadir)/syslinux/libutil.c32  $(DESTDIR)/boot/syslinux/libutil.c32
	@cp -f $(build_datadir)/syslinux/mbr.bin      $(DESTDIR)/boot/syslinux/mbr.bin
	@cp -f $(build_datadir)/syslinux/vesamenu.c32 $(DESTDIR)/boot/syslinux/vesamenu.c32
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)/boot/syslinux*
	@rm -f $(DESTDIR)/boot/syslinux/ldlinux.sys
	@rm -f $(DESTDIR)/boot/syslinux/libcom32.c32
	@rm -f $(DESTDIR)/boot/syslinux/libutil.c32
	@rm -f $(DESTDIR)/boot/syslinux/mbr.bin
	@rm -f $(DESTDIR)/boot/syslinux/vesamenu.c32
