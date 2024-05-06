
GARNAME      = unclutter
GARVERSION   = 8
CATEGORIES   = X11
MASTER_SITES = http://www.ibiblio.org/pub/X11/contrib/utilities/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = $(DISTNAME)-gcc_4.3.patch
LICENSE      = Public_Domain

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c xorg/xorg

WORKSRC = $(WORKDIR)/unclutter

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

CFLAGS  += -Wno-implicit-int
LDFLAGS := $(LDFLAGS) -fwhole-program

build-custom:
	cd $(WORKSRC) ; $(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o unclutter unclutter.c -lX11
	@$(MAKECOOKIE)

install-custom:
	install -D -m 755 $(WORKSRC)/unclutter     $(DESTDIR)$(bindir)/unclutter
	install -D -m 644 $(WORKSRC)/unclutter.man $(DESTDIR)$(mandir)/man1/unclutter.1
	@$(MAKECOOKIE)
