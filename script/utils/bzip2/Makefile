GARNAME = bzip2
GARVERSION = 1.0.6
CATEGORIES = utils
MASTER_SITES = http://www.bzip.org/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-so.patch $(DISTNAME)-cflags.patch $(DISTNAME)-perl.patch.gar $(DISTNAME).patch
LICENSE = bzip2
bzip2_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = $(WORKSRC)/Makefile shared

BUILD_ARGS   = \
	CC="$(CC)" \
	AR="$(AR)" \
	RANLIB="$(RANLIB)" \
	CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	DESTDIR="$(DESTDIR)" \
	prefix="$(prefix)" \
	bindir="$(bindir)" \
	libdir="$(libdir)" \
	includedir="$(includedir)" \
	mandir="$(mandir)"
INSTALL_ARGS = \
	CC="$(CC)" \
	AR="$(AR)" \
	RANLIB="$(RANLIB)" \
	CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	DESTDIR="$(DESTDIR)" \
	prefix="$(prefix)" \
	bindir="$(bindir)" \
	libdir="$(libdir)" \
	includedir="$(includedir)" \
	mandir="$(mandir)"

include ../../gar.mk

CFLAGS += -fpic -fPIC -Wall -Winline -D_FILE_OFFSET_BITS=64

build-custom:
	$(BUILD_ENV) $(MAKE) $(PARALLELMFLAGS) $(foreach TTT,$(BUILD_OVERRIDE_DIRS),$(TTT)="$($(TTT))") \
		-C $(WORKSRC) -f Makefile           $(BUILD_ARGS) libbz2.a bzip2 bzip2recover
	$(BUILD_ENV) $(MAKE) $(PARALLELMFLAGS) $(foreach TTT,$(BUILD_OVERRIDE_DIRS),$(TTT)="$($(TTT))") \
		-C $(WORKSRC) -f Makefile-libbz2_so $(BUILD_ARGS) all
	@$(MAKECOOKIE)

install-shared:
	@rm -f $(DESTDIR)$(libdir)/libbz2.so $(DESTDIR)$(libdir)/libbz2.so.*
	@cp -f $(WORKSRC)/libbz2.so.$(GARVERSION) $(DESTDIR)$(libdir)/libbz2.so.$(GARVERSION)
	@chmod 0644 $(DESTDIR)$(libdir)/libbz2.so.$(GARVERSION)
	@ln -sf libbz2.so.$(GARVERSION) $(DESTDIR)$(libdir)/libbz2.so.1.0
	@ln -sf libbz2.so.1.0 $(DESTDIR)$(libdir)/libbz2.so.1
	@ln -sf libbz2.so.1 $(DESTDIR)$(libdir)/libbz2.so
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libbz2.a
	@$(MAKECOOKIE)
