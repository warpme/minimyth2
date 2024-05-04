
GARNAME     = unzip
GARVERSION  = 6.0
CATEGORIES  = utils
MASTER_SITES = http://downloads.sourceforge.net/project/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
DISTFILES   = $(GARNAME)$(subst .,,$(GARVERSION)).tar.gz
PATCHFILES += unzip-6.0-exec-shield.patch
PATCHFILES += unzip-6.0-close.patch
PATCHFILES += unzip-6.0-attribs-overflow.patch
PATCHFILES += unzip-6.0-symlink.patch
PATCHFILES += unzip-6.0-format-secure.patch
PATCHFILES += unzip-6.0-valgrind.patch
PATCHFILES += unzip-6.0-x-option.patch
PATCHFILES += unzip-6.0-overflow.patch
PATCHFILES += unzip-6.0-cve-2014-8139.patch
PATCHFILES += unzip-6.0-cve-2014-8140.patch
PATCHFILES += unzip-6.0-cve-2014-8141.patch
PATCHFILES += unzip-6.0-overflow-long-fsize.patch
PATCHFILES += unzip-6.0-heap-overflow-infloop.patch
PATCHFILES += unzip-6.0-alt-iconv-utf8.patch
PATCHFILES += unzip-6.0-alt-iconv-utf8-print.patch
PATCHFILES += 0001-Fix-CVE-2016-9844-rhbz-1404283.patch
PATCHFILES += unzip-6.0-timestamp.patch
PATCHFILES += unzip-6.0-cve-2018-1000035-heap-based-overflow.patch
PATCHFILES += unzip-6.0-cve-2018-18384.patch
PATCHFILES += unzip-6.0-COVSCAN-fix-unterminated-string.patch
PATCHFILES += unzip-zipbomb-part1.patch
PATCHFILES += unzip-zipbomb-part2.patch
PATCHFILES += unzip-zipbomb-part3.patch
PATCHFILES += unzip-zipbomb-manpage.patch
PATCHFILES += unzip-zipbomb-part4.patch
PATCHFILES += unzip-zipbomb-part5.patch
PATCHFILES += unzip-zipbomb-part6.patch
PATCHFILES += unzip-zipbomb-switch.patch
PATCHFILES += unzip-6.0_CVE-2021-4217.patch

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
	CC="$(CC) $(CFLAGS) -fpermissive" \
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
