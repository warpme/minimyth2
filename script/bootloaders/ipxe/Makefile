
GARNAME      = ipxe
# git@13.05.2026
GARVERSION   = ca85200809eb0bf5571869264cb2bf7f0548180a
CATEGORIES   = net
MASTER_SITES = https://github.com/ipxe/ipxe/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      = GPL2
WORKSRC      = $(WORKDIR)/$(GARNAME)-$(GARVERSION)

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

BUILD_SCRIPTS   = $(WORKSRC)/src/Makefile
INSTALL_SCRIPTS = custom

BUILD_ARGS = \
	HOST_CC="$(build_CC)" \
	CROSS_COMPILE="$(compiler_prefix)" \
	$(if $(filter i386,$(GARCH_FAMILY)),  bin-x86-efi/ipxe.efi) \
	$(if $(filter x86_64,$(GARCH_FAMILY)),bin/undionly.kpxe bin/undionly.kkpxe bin/ipxe.pxe bin-x86_64-efi/ipxe.efi) \
	$(if $(filter arm64,$(GARCH_FAMILY)), ARCH=arm64 bin-arm64-efi/ipxe.efi) \

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth
	$(if $(filter x86_64,$(GARCH_FAMILY)), \
	  @cp -f $(WORKSRC)/src/bin/undionly.kpxe $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.0 \
	  @cp -f $(WORKSRC)/src/bin/undionly.kkpxe $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.kkpxe \
	  @cp -f $(WORKSRC)/src/bin/ipxe.pxe $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.pxe \
	                                     @cp -f $(WORKSRC)/bin-x86_64-efi/ipxe.efi    $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.efi.x86_64)
	$(if $(filter i386,$(GARCH_FAMILY)), @cp -f $(WORKSRC)/bin-x86-efi/ipxe.efi       $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.efi.x86)
	$(if $(filter arm64,$(GARCH_FAMILY)),@cp -f $(WORKSRC)/src/bin-arm64-efi/ipxe.efi $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.efi.aarch64)
	@mkdir -p $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.cfg
	@$(MAKECOOKIE)
