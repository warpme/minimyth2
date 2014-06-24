GARNAME = ipxe
# GARVERSION = HEAD-8dd180f
#https://git.ipxe.org/ipxe.git/snapshot/HEAD.tar.bz2
#https://git.ipxe.org/ipxe.git/snapshot/HEAD.tar.bz2
#GARVERSION = 01c2f5fa7bfe73644750361db8906973bcdfd74a
GARVERSION = 20140506-69313ed
CATEGORIES = net
MASTER_SITES  = git://git.ipxe.org/ipxe.git
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
	bin/undionly.kpxe

include ../../gar.mk

CPPFLAGS :=
CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=

install-custom:
	@mkdir -p $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth
	@cp -f $(WORKSRC)/src/bin/undionly.kpxe $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.0
	@mkdir -p $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.cfg
	@$(MAKECOOKIE)
