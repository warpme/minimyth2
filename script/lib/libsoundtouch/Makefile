
GARNAME      = soundtouch
GARVERSION   = 2.1.2
CATEGORIES   = lib
MASTER_SITES = https://gitlab.com/SherlockHome/soundtouch/-/archive/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = GPL2

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

pre-configure:
	@mkdir -p $(WORKSRC)/config/m4
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libSoundTouch.la
	@$(MAKECOOKIE)
