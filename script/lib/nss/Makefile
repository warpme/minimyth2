GARNAME = nss
GARVERSION = $(NSS_VERSION)
CATEGORIES = lib
MASTER_SITES = http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/$(shell echo $(DISTNAME) | sed -e 's/-/_/g' -e 's/\./_/g' -e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/')_RTM/src/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES  = $(DISTNAME)-freebl_no_depend.patch $(DISTNAME).patch.gar
ifneq ($(DESTIMG),build)
PATCHFILES += $(DISTNAME)-cross.patch
endif
LICENSE = MPL1_1/GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c db/sqlite lib/nspr lib/zlib
BUILDDEPS  =
ifneq ($(DESTIMG),build)
BUILDDEPS += lib/nss
endif

WORKSRC = $(WORKDIR)/$(shell echo $(DISTNAME) | sed -e 's/\.with\.ckbi\..*$$//')

BUILD_SCRIPTS    = $(WORKSRC)/mozilla/security/nss/Makefile
INSTALL_SCRIPTS  = custom
ifeq ($(DESTIMG),build)
INSTALL_SCRIPTS += shlibsign
endif

BUILD_ARGS = \
	OS_TARGET="Linux" \
	OS_ARCH="Linux" \
	OS_TEST="$(GARCH_FAMILY)" \
	CPU_ARCH="$(GARCH_FAMILY)" \
	$(if $(filter x86_64,$(GARCH_FAMILY)),USE_64="1") \
	NATIVE_CC="$(build_CC)" \
	NATIVE_FLAGS="$(build_CFLAGS)" \
	BUILD_OPT="1" \
	NSS_USE_SYSTEM_SQLITE="1" \
	USE_SYSTEM_ZLIB="1" \
	ZLIB_LIBS="-lz" \
	build_coreconf build_dbm all

include ../../gar.mk

PARALLELMFLAGS := -j1

install-custom:
	@mkdir -p $(DESTDIR)$(libdir)
	@$(foreach lib, $(wildcard $(WORKSRC)/mozilla/dist/Linux*/lib/*.so), cp -f $(lib) $(DESTDIR)$(libdir) ; )
	@$(MAKECOOKIE)

install-shlibsign:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp $(WORKSRC)/mozilla/dist/Linux*/bin/shlibsign $(DESTDIR)$(bindir)/nss-shlibsign
	@$(MAKECOOKIE)
