GARNAME = stella
GARVERSION = 5.1.2
CATEGORIES = emulators
MASTER_SITES = https://github.com/stella-emu/stella/releases/download/$(GARVERSION)/
DISTFILES = $(DISTNAME)-src.tar.xz
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/cxx lib/SDL devel/zlib xorg/xorg

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
	--enable-thumb \
	--enable-shared \
	--disable-static \
	--disable-profile \
	--with-zlib-prefix="$(DESTDIR)$(prefix)" \
	--x-libraries="$(DESTDIR)$(libdir)"

include ../../gar.mk

LDFLAGS := $(CXXFLAGS) $(LDFLAGS)

LDFLAGS := $(LDFLAGS) -fwhole-program
