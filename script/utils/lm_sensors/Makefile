GARNAME = lm_sensors
GARVERSION = 3.4.0
CATEGORIES = utils
MASTER_SITES = https://github.com/lm-sensors/lm-sensors/archive/
DISTFILES   = V3-4-0.tar.gz
WORKSRC = $(WORKDIR)/lm-sensors-3-4-0
PATCHFILES = $(DISTNAME)-perl.patch.gar
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

# GCC9.3 segfaults on lm_sensors with LTO so disable LTO
CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

pre-install:
	@rm -rf $(DESTDIR)/$(sysconfdir)/sensors3.conf
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libsensors.a
	@$(MAKECOOKIE)
