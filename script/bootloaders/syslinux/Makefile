
GARNAME      = syslinux
GARVERSION   = bf6db5b48ec25f83939f1fdebb59028bc3c40b00
CATEGORIES   = bootloaders
MASTER_SITES = https://repo.or.cz/syslinux.git/snapshot/

PATCHFILES   = 0002-gfxboot-menu-label.patch
PATCHFILES  += 0004-gnu-efi-from-arch.patch
PATCHFILES  += 0005-gnu-efi-version-compatibility.patch
PATCHFILES  += 0016-strip-gnu-property.patch
PATCHFILES  += 0017-single-load-segment.patch
PATCHFILES  += 0018-prevent-pow-optimization.patch
PATCHFILES  += 0025-reproducible-build.patch
PATCHFILES  += 0026-fix-gcc-10-compile.patch
PATCHFILES  += 0027-Replace-builtin-strlen-that-appears-to-get-optimized.patch
PATCHFILES  += 0028-fix-build-with-glibc_2.36.patch

DISTFILES    = $(GARVERSION).tar.gz
WORKSRC      = $(WORKDIR)/syslinux-bf6db5b
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c devel/nasm

BUILD_ARGS = bios

INSTALL_SCRIPTS = custom
BUILD_SCRIPTS   = custom

export EXTRA_CFLAGS=-fno-PIE -fcommon

include ../../gar.mk

CPPFLAGS += -fcommon
CFLAGS   += -fcommon

build-custom:
	@$(MAKE) -C $(WORKSRC) $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-custom:
	@$(MAKE) -C $(WORKSRC) $(BUILD_ARGS) install INSTALLROOT=$(build_rootdir)
	@$(MAKECOOKIE)
