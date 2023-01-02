
GARNAME      = mkinitcpio
GARVERSION   = v34
CATEGORIES   = archlinux
MASTER_SITES = https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio/-/archive/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.bz2
PATCHFILES   = allow-install-without-build.patch fix_install_paths.patch add-sysroot-hack.patch
LICENSE      = GPL2

DEPENDS = \
	utils/gawk \
	utils/kmod \
	utils/util-linux \
	lib/libarchive \
	utils/coreutils \
	utils/bash \
	devel/binutils \
	utils/diffutils \
	utils/findutils \
	utils/grep \
	lib/libzstd \

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = 
INSTALL_SCRIPTS   = custom

include ../../gar.mk

install-custom:
	@$(MAKE) -C $(WORKSRC) install DESTDIR=$(build_rootdir)/
