
GARNAME      = hdparm
GARVERSION   = 9.64
CATEGORIES   = disk
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = $(DISTNAME)-fix-glib2.36.patch
LICENSE      = hdparm

hdparm_LICENSE_TEXT = $(WORKSRC)/LICENSE.TXT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

DEFAULT_ARGS = \
	binprefix="$(prefix)" \
	manprefix="$(prefix)" \
	exec_prefix="$(exec_prefix)" \
	sbindir="$(sbindir)" \
	mandir="$(mandir)" \
	oldmandir="$(mandir)" \
	LDFLAGS="$(LDFLAGS) -s"
BUILD_ARGS   = \
	$(DEFAULT_ARGS)
INSTALL_ARGS = \
	$(DEFAULT_ARGS)

include ../../gar.mk

#LDFLAGS := $(LDFLAGS) -fwhole-program

LDFLAGS := $(CFLAGS) $(LDFLAGS)
