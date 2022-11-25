GARNAME = ratpoison
GARVERSION = 1.4.9
CATEGORIES = X11
MASTER_SITES = http://savannah.nongnu.org/download/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = \
	$(DISTNAME)-staticgravity.patch \
	$(DISTNAME)-disable-xserver1.19-locale-error.patch
LICENSE = GPL2

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
	--enable-silent-rules \
	--disable-debug \
	--disable-history \
	--with-xterm=rxvt \
	--with-xft \
	--with-x

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
