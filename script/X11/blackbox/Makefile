
GARNAME      = blackboxwm
GARVERSION   = 0.76
CATEGORIES   = X11
MASTER_SITES = https://github.com/bbidulock/blackboxwm/archive/
DISTFILES    = $(GARVERSION).tar.gz
PATCHFILES   = fix-buildng-under-gcc12.2.0.patch
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c xorg/xorg X11/rxvt

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes=$(DESTDIR)$(includedir) \
	--x-libraries=$(DESTDIR)$(libdir) \
	--disable-debug \
	--with-x

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm $(DESTDIR)$(libdir)/libbt.la
	@$(MAKECOOKIE)
