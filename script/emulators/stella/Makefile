GARNAME = stella
GARVERSION = 3.7.5
CATEGORIES = emulators
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/$(GARNAME)/$(GARVERSION)/
DISTFILES = $(DISTNAME)-src.tar.gz
PATCHFILES = $(DISTNAME).patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/cxx lib/SDL lib/zlib xorg/xorg

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	--prefix="$(prefix)" \
	--bindir="$(bindir)" \
	--docdir="$(docdir)/stella" \
	--datadir="$(datadir)" \
	--enable-gl \
	--enable-windowed \
	--enable-sound \
	--enable-debugger \
	--enable-joystick \
	--enable-cheats \
	--enable-shared \
	--disable-static \
	--disable-profile \
	--with-zlib-prefix="$(DESTDIR)$(prefix)" \
	--x-libraries="$(DESTDIR)$(libdir)"

include ../../gar.mk

LDFLAGS := $(CXXFLAGS) $(LDFLAGS)

LDFLAGS := $(LDFLAGS) -fwhole-program
