
GARNAME      = tinymembench
GARVERSION   = a2cf6d7e382e3aea1eb39173174d9fa28cad15f3
CATEGORIES   = utils
MASTER_SITES = https://github.com/ssvb/tinymembench/archive/
PATCHFILES   = 01-Make-Makefile-more-robust-readable-and-safe.patch
DISTFILES    = $(GARVERSION).zip
LICENSE      = GPL2

LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

BUILD_ARGS   = \
	CC="$(CC) -fPIC" \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS) $(LDFLAGS)" \
	CXXFLAGS="$(CXXFLAGS) $(LDFLAGS)"

build-custom:
	@echo "Building..."
	$(MAKE) -C $(WORKSRC) $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -rf $(WORKSRC)/tinymembench $(DESTDIR)$(bindir)/tinymembench
	@$(MAKECOOKIE)
