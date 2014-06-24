GARNAME = lm_sensors
GARVERSION = 3.3.4
CATEGORIES = utils
MASTER_SITES  = http://dl.lm-sensors.org/lm-sensors/releases/
MASTER_SITES += svn://lm-sensors.org/svn/lm-sensors/trunk/
DISTFILES   = $(DISTNAME).tar.bz2
PATCHFILES  =
PATCHFILES += $(DISTNAME)-perl.patch.gar
LICENSE = GPL2/LGPL2_1

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

ARGS = \
	DESTDIR="$(DESTDIR)" \
	PREFIX="$(prefix)" \
	CC="$(CC)" \
	ETCDIR="$(sysconfdir)" \
	LIBDIR="$(libdir)" \
	EXLDFLAGS="" \
	BINDIR="$(bindir)" \
	SBINDIR="$(sbindir)" \
	INCLUDEDIR="$(includedir)" \
	LIBINCLUDEDIR="$(includedir)/sensors" \
	MANDIR="$(mandir)" \
	MACHINE="$(GARCH)" \
	CFLAGS="$(CFLAGS)" \
	CPPFLAGS="$(CPPFLAGS)" \
	AR="$(AR)"

BUILD_ARGS   = $(ARGS)
INSTALL_ARGS = $(ARGS)

include ../../gar.mk

CFLAGS  := $(CFLAGS)  -fPIC
LDFLAGS := $(LDFLAGS) -fPIC

svn//%/$(DISTNAME).tar.bz2:
	@$(call FETCH_SVN, http://$*, $(GARVERSION), $(DISTNAME))
	@$(MAKECOOKIE)

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

pre-install:
	@rm -rf $(DESTDIR)/$(sysconfdir)/sensors3.conf
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libsensors.a
	@$(MAKECOOKIE)
