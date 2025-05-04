
GARNAME     = unzip
GARVERSION  = 6.0
CATEGORIES  = utils
MASTER_SITES = http://downloads.sourceforge.net/project/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
DISTFILES   = $(GARNAME)$(subst .,,$(GARVERSION)).tar.gz

PATCHFILES += avoid-strip.patch
PATCHFILES += define-ldflags.patch
PATCHFILES += 06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch
PATCHFILES += cve-2014-9636.patch
PATCHFILES += 09-cve-2014-8139-crc-overflow.patch
PATCHFILES += 10-cve-2014-8140-test-compr-eb.patch
PATCHFILES += 11-cve-2014-8141-getzip64data.patch
PATCHFILES += CVE-2015-7696.patch
PATCHFILES += CVE-2015-7697.patch
PATCHFILES += fix-security-format.patch
PATCHFILES += 18-cve-2014-9913-unzip-buffer-overflow.patch
PATCHFILES += 19-cve-2016-9844-zipinfo-buffer-overflow.patch
PATCHFILES += symlink.patch
PATCHFILES += 0001-unzip-fix-CVE-2018-1000035.patch
PATCHFILES += CVE-2018-18384.patch
PATCHFILES += CVE-2019-13232_p1.patch
PATCHFILES += CVE-2019-13232_p2.patch
PATCHFILES += CVE-2019-13232_p3.patch
PATCHFILES += unzip_optimization.patch
PATCHFILES += 0001-configure-Pass-LDFLAGS-to-tests-doing-link-step.patch
PATCHFILES += CVE-2021-4217.patch
PATCHFILES += CVE-2022-0529.patch
PATCHFILES += CVE-2022-0530.patch
PATCHFILES += 0001-configure-Add-correct-system-headers-and-prototypes-.patch
PATCHFILES += 0001-unix-configure-fix-detection-for-cross-compilation.patch
PATCHFILES += gcc15.patch

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
