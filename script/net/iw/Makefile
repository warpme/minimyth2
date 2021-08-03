
GARNAME      = iw
GARVERSION   = 5.9
CATEGORIES   = net
MASTER_SITES = https://www.kernel.org/pub/software/network/iw/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/libnl

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = custom


BUILD_ARGS   = \
	DESTDIR="$(DESTDIR)" \
	PREFIX="$(prefix)" \
	LIBDIR="$(libdir)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS) $(LDFLAGS) -I/home/piotro/minimyth-dev/images/main/usr/include/libnl3" \
	CXXFLAGS="$(CXXFLAGS) $(LDFLAGS)"

INSTALL_ARGS = \
	DESTDIR="$(DESTDIR)" \
	PREFIX="$(prefix)" \
	LIBDIR="$(libdir)"

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

install-custom:
	@#mkdir -p $(DESTDIR)$(ebindir)
	@#install -m 755 $(WORKSRC)/ping $(DESTDIR)$(ebindir)
	@$(MAKECOOKIE)
