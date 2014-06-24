GARNAME = portmap
GARVERSION = 4
CATEGORIES = net
MASTER_SITES = ftp://ftp.porcupine.org/pub/security/
DISTFILES = $(GARNAME)_$(GARVERSION).tar.gz
PATCHFILES = portmap-4.0-linux.patch portmap-malloc.patch portmap-4.0-cleanup.patch portmap-4.0-rpc_user.patch portmap-4.0-sigpipe.patch portmap-4.0-errno.patch portmap-4.0-pie.patch portmap-4.0-loopback.patch portmap-4-pic.patch
LICENSE = BSD_4_Clause

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

WORKSRC = $(WORKDIR)/$(GARNAME)_$(GARVERSION)

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = custom

BUILD_ARGS     = \
	FACILITY=LOG_AUTH \
	ZOMBIES='-DIGNORE_SIGCHLD -Dlint' \
	LIBS="-lnsl" \
	AUX="" \
	HOSTS_ACCESS=
INSTALL_ARGS   = \
	BASEDIR=$(DESTDIR)

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(esbindir)
	@install -m 755 $(WORKSRC)/portmap   $(DESTDIR)$(esbindir)
	@mkdir -p $(DESTDIR)$(sbindir)
	@install -m 755 $(WORKSRC)/pmap_set  $(DESTDIR)$(sbindir)
	@install -m 755 $(WORKSRC)/pmap_dump $(DESTDIR)$(sbindir)
	@$(MAKECOOKIE)
