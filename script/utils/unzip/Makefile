GARNAME = unzip
GARVERSION = 6.0
CATEGORIES = utils
MASTER_SITES = http://downloads.sourceforge.net/project/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
DISTFILES = $(GARNAME)$(subst .,,$(GARVERSION)).tar.gz
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT=$(WORKSRC)/LICENSE

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

WORKSRC = $(WORKDIR)/$(GARNAME)$(subst .,,$(GARVERSION))

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

BUILD_ARGS   = \
	CC="$(CC) $(CFLAGS)" \
	LD="$(CC)" \
	AS="$(AS)" \
	STRIP="$(STRIP)" \
	SHELL="sh" \
	generic
INSTALL_ARGS = \
	CC="$(CC) $(CFLAGS)" \
	LD="$(CC)" \
	AS="$(AS)" \
	STRIP="$(STRIP)" \
	SHELL="sh"

BUILD_OVERRIDE_DIRS   = prefix BINDIR MANDIR
INSTALL_OVERRIDE_DIRS = prefix BINDIR MANDIR

include ../../gar.mk

BINDIR := $(bindir)
MANDIR := $(mandir)/man1

configure-custom:
	@cd $(WORKSRC) ; cp -f unix/Makefile Makefile
	@$(MAKECOOKIE)
