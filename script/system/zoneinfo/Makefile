
GARNAME      = zoneinfo
GARVERSION   = 2024b
CATEGORIES   = system
MASTER_SITES = http://www.iana.org/time-zones/repository/releases/
DISTFILES    = tzcode$(GARVERSION).tar.gz tzdata$(GARVERSION).tar.gz
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

include ../../gar.mk

DEFAULT_ARGS  = \
	DESTDIR=$(build_rootdir) \
	cc="$(CC)"
ifneq ($(DESTIMG),build)
DEFAULT_ARGS += \
	DESTDIR=$(DESTDIR) \
	zic="$(build_DESTDIR)$(build_sbindir)/zic"
endif

BUILD_ARGS    = $(DEFAULT_ARGS)
INSTALL_ARGS  = $(DEFAULT_ARGS)

extract-%:
	@mkdir -p $(WORKSRC)
	@gzip -dc $(DOWNLOADDIR)/$* | tar -xf - -C $(WORKSRC)
	@$(MAKECOOKIE)
