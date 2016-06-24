GARNAME = ipxe
GARVERSION = 80dd6cb
CATEGORIES = net
MASTER_SITES = git://git.ipxe.org/ipxe.git
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = GPL2

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
	bin-x86_64-efi/ipxe.efi

# If you want debug - build only with this single BUILD_ARGS
BUILD_ARGS1 = \
	HOST_CC="$(build_CC)" \
	CROSS_COMPILE="$(compiler_prefix)" \
	bin/undionly.kkpxe DEBUG=undionly:3,undinet:3,pxeparent:3

#	bin/undionly.kkpxe DEBUG=undinet


include ../../gar.mk

CPPFLAGS += -fPIC
CFLAGS   += -fPIC

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth
	@cp -f $(WORKSRC)/src/bin/undionly.kpxe $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.0
	@cp -f $(WORKSRC)/src/bin/undionly.kkpxe $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.kkpxe
	@cp -f $(WORKSRC)/src/bin/ipxe.pxe $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.pxe
	@cp -f $(WORKSRC)/src/bin-x86_64-efi/ipxe.efi $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.efi
	@mkdir -p $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.cfg
	@$(MAKECOOKIE)
