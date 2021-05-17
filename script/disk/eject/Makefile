
GARNAME      = eject
GARVERSION   = 2.1.5
CATEGORIES   = disk
MASTER_SITES = https://mirrors.kernel.org/slackware/slackware64-14.1/source/a/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.bz2
PATCHFILES   = $(DISTNAME)-opendevice.patch
PATCHFILES  += $(DISTNAME)-fix-glibc-2.31.patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

WORKSRC = $(WORKDIR)/$(GARNAME)


CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk
