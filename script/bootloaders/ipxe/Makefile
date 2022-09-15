
GARNAME      = ipxe
# v 13092022
GARVERSION   = 8f5fc161436a020ba65d07f91f62d34f4c22db61
CATEGORIES   = net
MASTER_SITES = https://github.com/ipxe/ipxe/archive/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = fix-gcc12-compiling.patch
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
	bin/undionly.kpxe \
	bin/undionly.kkpxe \
	bin/ipxe.pxe \
	$(if $(filter i386,$(GARCH_FAMILY)),bin-x86-efi/ipxe.efi) \
	$(if $(filter x86_64,$(GARCH_FAMILY)),bin-x86_64-efi/ipxe.efi) \

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth
	@cp -f $(WORKSRC)/src/bin/undionly.kpxe $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.0
	@cp -f $(WORKSRC)/src/bin/undionly.kkpxe $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.kkpxe
	@cp -f $(WORKSRC)/src/bin/ipxe.pxe $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.pxe
	$(if $(filter i386,$(GARCH_FAMILY)),@cp -f $(WORKSRC)/src/bin-x86-efi/ipxe.efi $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe32.efi)
	$(if $(filter x86_64,$(GARCH_FAMILY)),@cp -f $(WORKSRC)/src/bin-x86_64-efi/ipxe.efi $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.efi)
	@mkdir -p $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.cfg
	@$(MAKECOOKIE)
