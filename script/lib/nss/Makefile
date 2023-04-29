
GARNAME      = nss
GARVERSION   = $(NSS_VERSION)
CATEGORIES   = lib
MASTER_SITES = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/$(shell echo $(DISTNAME) | sed -e 's/-/_/g' -e 's/\./_/g' -e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/')_RTM/src/
PATCHFILES   = fix-used-chaintools.patch
PATCHFILES  += nss-11-D174822-allow-build-with-gcc-13.patch
DISTFILES    = $(DISTNAME).tar.gz
ifneq ($(DESTIMG),build)
PATCHFILES  += nss-cross.patch
PATCHFILES  += freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
endif
LICENSE      = MPL1_1/GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c db/sqlite lib/nspr devel/zlib
BUILDDEPS  =
ifneq ($(DESTIMG),build)
BUILDDEPS += lib/nss
endif

WORKSRC = $(WORKDIR)/$(shell echo $(DISTNAME) | sed -e 's/\.with\.ckbi\..*$$//')

BUILD_SCRIPTS    = $(WORKSRC)/nss/Makefile
INSTALL_SCRIPTS  = custom
ifeq ($(DESTIMG),build)
INSTALL_SCRIPTS += shlibsign
endif

BUILD_ARGS = \
	OS_TARGET="Linux" \
	OS_ARCH="Linux" \
	OS_TEST="$(GARCH_FAMILY)" \
	CPU_ARCH="$(GARCH_FAMILY)" \
	$(if $(filter x86_64 arm64,$(GARCH_FAMILY)),USE_64="1") \
	NATIVE_CC="$(build_CC)" \
	NATIVE_FLAGS="$(build_CFLAGS)" \
	BUILD_OPT="1" \
	NSS_USE_SYSTEM_SQLITE="1" \
	USE_SYSTEM_ZLIB="1" \
	ZLIB_LIBS="-lz" \
	NSS_ENABLE_WERROR=0 \
	NSS_DISABLE_CHACHAPOLY=1 \
	NS_USE_GCC="1" \
	all

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(libdir)
	@$(foreach lib, $(wildcard $(WORKSRC)/dist/Linux*/lib/*.so), cp -f $(lib) $(DESTDIR)$(libdir) ; )
	@mkdir -p $(DESTDIR)$(libdir)/pkgconfig
	@cp $(WORKSRC)/nss/pkg/pkg-config/nss.pc.in $(DESTDIR)$(libdir)/pkgconfig/nss.pc
	@sed \
	 -e "s,%libdir%,/usr/lib,g" \
	 -e "s,%prefix%,/usr,g" \
	 -e "s,%exec_prefix%,/usr/bin,g" \
	 -e "s,%includedir%,/usr/include/nss,g" \
	 -e "s,%NSPR_VERSION%,4.33,g" \
	 -e "s,%NSS_VERSION%,$(NSS_VERSION),g" \
	 -i $(DESTDIR)$(libdir)/pkgconfig/nss.pc
	@cp $(WORKSRC)/nss/pkg/pkg-config/nss-config.in $(DESTDIR)$(bindir)-config/nss-config
	@sed \
	 -e "s,@libdir@,/usr/lib,g" \
	 -e "s,@prefix@,/usr,g" \
	 -e "s,@exec_prefix@,/usr/bin,g" \
	 -e "s,@includedir@,/usr/include/nss,g" \
	 -e "s,@MOD_MAJOR_VERSION@,3,g" \
	 -e "s,@MOD_MINOR_VERSION@,76,g" \
	 -e "s,@MOD_PATCH_VERSION@,0,g" \
	 -i $(DESTDIR)$(bindir)-config/nss-config
	@chmod +x $(DESTDIR)$(bindir)-config/nss-config
	@mkdir -p $(DESTDIR)$(includedir)/nss
	@cp -fL $(WORKSRC)/dist/public/nss/*.h $(DESTDIR)$(includedir)/nss/
	@$(MAKECOOKIE)

install-shlibsign:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp $(WORKSRC)/dist/Linux*/bin/shlibsign $(DESTDIR)$(bindir)/nss-shlibsign
	@$(MAKECOOKIE)
