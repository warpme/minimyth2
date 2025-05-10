
GARNAME      = unclutter
GARVERSION   = v1.6
CATEGORIES   = X11
MASTER_SITES = https://github.com/Airblader/unclutter-xfixes/archive/refs/tags/
DISTFILES    = $(GARVERSION).tar.gz
PATCHFILES   = stop-building-man.patch
LICENSE      = Public_Domain

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c xorg/xorg lib/libev

WORKSRC = $(WORKDIR)/unclutter-xfixes-1.6

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

BUILD_ARGS   = \
	CC="$(CC)" \
	CFLAGS="$(CFLAGS) $(LDFLAGS)" \
	PREFIX="$(prefix)" \

build-custom:
	@echo "Building ..."
	@cd $(WORKSRC); $(MAKE) $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-custom:
	install -D -m 755 $(WORKSRC)/unclutter $(DESTDIR)$(bindir)/unclutter
	@$(MAKECOOKIE)
