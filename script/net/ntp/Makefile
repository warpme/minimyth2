
GARNAME      = ntp
GARVERSION   = 4.2.8p15
CATEGORIES   = net
MASTER_SITES = http://www.eecis.udel.edu/~$(GARNAME)/$(GARNAME)_spool/$(GARNAME)4/$(GARNAME)-4.2/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = $(DISTNAME)-hack-compile-on-glibc2.34.patch
LICENSE      = ntp
ntp_LICENSE_TEXT = $(WORKSRC)/COPYRIGHT

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c
ifneq ($(DESTIMG),build)
BUILDDEPS = net/ntp
endif

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile
ifeq ($(DESTIMG),build)
INSTALL_SCRIPTS   += cross
endif

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-all-clocks \
	--disable-ipv6 \
	--without-rpath \
	--with-gnu-ld \
	--without-crypto \
	--with-yielding-select=yes

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)

install-cross:
	@cp -f $(WORKSRC)/ntpdc/ntpdc-layout $(DESTDIR)$(bindir)/ntp-ntpdc-layout
	@$(MAKECOOKIE)
