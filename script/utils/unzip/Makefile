GARNAME = unzip
GARVERSION = 6.0
CATEGORIES = utils
MASTER_SITES = http://downloads.sourceforge.net/project/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
DISTFILES = $(GARNAME)$(subst .,,$(GARVERSION)).tar.gz

PATCHFILES  = overflow-fsize.patch #FS#44171
PATCHFILES += cve20149636.patch #FS#44171
PATCHFILES += test_compr_eb.patch # FS#43391
PATCHFILES += getZip64Data.patch # FS#43300
PATCHFILES += crc32.patch # FS#43300
PATCHFILES += empty-input.patch # FS#46955
PATCHFILES += csiz-underflow.patch # FS#46955
PATCHFILES += nextbyte-overflow.patch # FS#46955
PATCHFILES += fix_symlinks.patch

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
