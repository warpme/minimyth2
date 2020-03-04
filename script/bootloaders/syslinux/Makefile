GARNAME      = syslinux
GARVERSION   = 05ac953c23f90b2328d393f7eecde96e41aed067
CATEGORIES   = net
MASTER_SITES = https://repo.or.cz/syslinux.git/snapshot/

PATCHFILES   = 0002-gfxboot-menu-label.patch
PATCHFILES  += 0004-gnu-efi-from-arch.patch
PATCHFILES  += 0005-gnu-efi-version-compatibility.patch
PATCHFILES  += 0016-strip-gnu-property.patch
PATCHFILES  += 0017-single-load-segment.patch
PATCHFILES  += 0018-prevent-pow-optimization.patch
PATCHFILES  += 0025-reproducible-build.patch

DISTFILES    = $(GARVERSION).tar.gz
WORKSRC      = $(WORKDIR)/syslinux-05ac953
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c



INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth
	@cp -f $(WORKSRC)/core/pxelinux.0 $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/pxelinux.0
	@mkdir -p $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/pxelinux.cfg
	@$(MAKECOOKIE)
