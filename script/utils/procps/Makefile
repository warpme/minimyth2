GARNAME = procps
GARVERSION = 3.3.15
CATEGORIES = utils
MASTER_SITES = https://gitlab.com/procps-ng/procps/-/archive/v3.3.15/
DISTFILES = $(DISTNAME).tar.bz2
WORKSRC = $(WORKDIR)/procps-v3.3.15-7bb949bcba13c107fa0f45d2d0298b1ad6b6d6cc
LICENSE = GPL2/LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/ncurses

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

CONFIGURE_ARGS =  \
	--build=$(GARBUILD) \
	--host=$(GARHOST) \
	--prefix="$(DESTDIR)" \
	--exec-prefix="$(DESTDIR)" \
	--sysconfdir="$(DESTDIR)$(sysconfdir)" \
	--libdir="$(DESTDIR)$(libdir)" \
	--bindir="$(DESTDIR)$(bindir)" \
	--sbindir="$(DESTDIR)$(bindir)" \
	--libexecdir="$(DESTDIR)$(libexecdir)" \
	--datarootdir="$(DESTDIR)$(datadir)" \
	--includedir="$(DESTDIR)$(includedir)" \
	--disable-nls \
	--disable-libselinux \
	--enable-skill \
	--disable-examples \
	ac_cv_func_malloc_0_nonnull=yes \
	ac_cv_func_realloc_0_nonnull=yes

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

build-custom:
	$(MAKE) all-am -C $(WORKSRC)
	@$(MAKECOOKIE)

install-custom:
	$(MAKE) install-am -C $(WORKSRC)
	@ln -srv $(DESTDIR)$(bindir)/ps $(DESTDIR)$(ebindir)/ps
	@$(MAKECOOKIE)
