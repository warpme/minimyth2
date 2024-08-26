
GARNAME      = logrotate
GARVERSION   = 3.22.0
CATEGORIES   = utils
MASTER_SITES = https://github.com/logrotate/logrotate/releases/download/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL

DEPENDS = lang/c utils/gzip lib/popt

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \
	--sbindir=/usr/bin \
	--with-compress-command=/usr/bin/gzip \
	--with-uncompress-command=/usr/bin/gunzip \
	--with-default-mail-command=/usr/bin/mail \
	--without-acl

include ../../gar.mk
