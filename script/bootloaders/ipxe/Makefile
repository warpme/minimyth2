
GARNAME      = ipxe
# v 1.21.1
GARVERSION   = 988d2c13cdf0f0b4140685af35ced70ac5b3283c
CATEGORIES   = net
MASTER_SITES = https://github.com/ipxe/ipxe/archive/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = fix-gcc12-compiling.patch fix-compile-with-binutils-2.41.patch
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
