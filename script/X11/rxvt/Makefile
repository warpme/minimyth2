
GARNAME      = rxvt-unicode
GARVERSION   = 9.31
CATEGORIES   = X11
MASTER_SITES = https://dist.schmorp.de/rxvt-unicode/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c xorg/xorg lib/libnsl lib/libptytty xorg/libXext xorg/libXft xorg/libXmu

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=./config.cache \
	--x-includes=$(DESTDIR)$(includedir) \
	--x-libraries=$(DESTDIR)$(libdir) \
	--with-gnu-ld \
	--disable-perl \

include ../../gar.mk

post-install:
	@ln -srf $(DESTDIR)$(bindir)/urxvt $(DESTDIR)$(bindir)/rxvt
	$(MAKECOOKIE)
