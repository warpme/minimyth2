
GARNAME      = zoneinfo
GARVERSION   = 2024b
CATEGORIES   = system
MASTER_SITES = http://www.iana.org/time-zones/repository/releases/
DISTFILES    = tzcode$(GARVERSION).tar.gz tzdata$(GARVERSION).tar.gz
# PATCHFILES   = $(DISTNAME).patch
LICENSE      = Public_Domain

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c
ifneq ($(DESTIMG),build)
BUILDDEPS = system/zoneinfo
endif

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

DEFAULT_ARGS  = \
	TOPDIR=../$(DISTNAME)-install \
	cc="$(CC)"
ifneq ($(DESTIMG),build)
DEFAULT_ARGS += \
	zic="$(build_DESTDIR)$(build_sbindir)/zic"
endif

BUILD_ARGS    = $(DEFAULT_ARGS)
INSTALL_ARGS  = $(DEFAULT_ARGS)

include ../../gar.mk

CFLAGS += -DTZDIR=\"$(sysconfdir)/zoneinfo\"

extract-%:
	@mkdir -p $(WORKSRC)
	@gzip -dc $(DOWNLOADDIR)/$* | tar -xf - -C $(WORKSRC)
	@$(MAKECOOKIE)

post-install:
	@cp -rf $(WORKDIR)/$(DISTNAME)-install/etc/zic      $(DESTDIR)$(sbindir)
	@rm -rf $(DESTDIR)$(datadir)/zoneinfo
	@cp -rf $(WORKDIR)/$(DISTNAME)-install/etc/zoneinfo $(DESTDIR)$(datadir)
	@$(MAKECOOKIE)
