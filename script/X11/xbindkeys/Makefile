
GARNAME      = xbindkeys
GARVERSION   = 1.8.7
CATEGORIES   = X11
MASTER_SITES = http://www.nongnu.org/xbindkeys/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c xorg/xorg

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes=$(DESTDIR)$(includedir) \
	--x-libraries=$(DESTDIR)$(libdir) \
	--enable-fork \
	--disable-tk \
	--disable-guile \
	--with-x

CONFIGURE_ENV  =
ifneq ("$(DESTIMG)","build")
CONFIGURE_ENV += \
	ac_cv_func_fork=yes \
	ac_cv_func_fork_works=yes \
	ac_cv_func_malloc_0_nonnull=yes \
	ac_cv_func_vfork=yes \
	ac_cv_func_vfork_works=yes
endif

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
