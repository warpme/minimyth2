GARNAME = xdotool
GARVERSION = 3.20160805.1
CATEGORIES = X11
MASTER_SITES = https://github.com/jordansissel/xdotool/releases/download/v$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

BUILD_ARGS = \
	HOST_CC="$(build_CC)" \
	CROSS_COMPILE="$(compiler_prefix)"

include ../../gar.mk

#CPPFLAGS += -fPIC
#CFLAGS   += -fPIC

#git//%$(DISTNAME).tar.bz2:
#	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
#	@$(MAKECOOKIE)

#install-custom:
#	@mkdir -p $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth
#	@cp -f $(WORKSRC)/src/bin/undionly.kpxe $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.0
#	@cp -f $(WORKSRC)/src/bin/undionly.kkpxe $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.kkpxe
#	@cp -f $(WORKSRC)/src/bin/ipxe.pxe $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.pxe
#	@cp -f $(WORKSRC)/src/bin-x86_64-efi/ipxe.efi $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.efi
#	@mkdir -p $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.cfg
#	@$(MAKECOOKIE)
