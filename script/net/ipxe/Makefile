GARNAME = ipxe
GARVERSION = e7f67d5
CATEGORIES = net
MASTER_SITES = https://git.ipxe.org/ipxe.git/snapshot/
DISTFILES = $(GARVERSION).tar.bz2
LICENSE = GPL2
WORKSRC = $(WORKDIR)/$(GARNAME)-$(GARVERSION)

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

# If you want debug - build with below's BUILD_ARGS
#BUILD_ARGS = \
#	HOST_CC="$(build_CC)" \
#	CROSS_COMPILE="$(compiler_prefix)" \
#	bin/undionly.kkpxe DEBUG=undionly:3,undinet:3,pxeparent:3

include ../../gar.mk

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth
	@cp -f $(WORKSRC)/src/bin/undionly.kpxe $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.0
	@cp -f $(WORKSRC)/src/bin/undionly.kkpxe $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.kkpxe
	@cp -f $(WORKSRC)/src/bin/ipxe.pxe $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.pxe
	@cp -f $(WORKSRC)/src/bin-x86-efi/ipxe.efi $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe32.efi
	@cp -f $(WORKSRC)/src/bin-x86_64-efi/ipxe.efi $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.efi
	@mkdir -p $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.cfg
	@$(MAKECOOKIE)
