GARNAME = g15daemon
GARVERSION = 1.9.5.3
CATEGORIES = lib
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/G15Daemon%201.9x/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME)-dash.patch $(DISTNAME).patch
LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libg15 lib/libg15render

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--with-gnu-ld

include ../../gar.mk

CPPFLAGS += -fcommon
CFLAGS   += -fcommon

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libg15daemon_client.la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)/$(GARVERSION)/plugins/g15plugin_clock.la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)/$(GARVERSION)/plugins/g15plugin_tcpserver.la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)/$(GARVERSION)/plugins/g15plugin_uinput.la
	@$(MAKECOOKIE)
