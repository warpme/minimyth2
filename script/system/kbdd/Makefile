GARNAME = kbdd
GARVERSION = 20060719Z
CATEGORIES = system
MASTER_SITES = cvs://anoncvs:anoncvs@anoncvs.handhelds.org:/cvs/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME)-lirc.patch $(DISTNAME)-cflags.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c system/lirc

BUILD_SCRIPTS    = $(WORKSRC)/Makefile
INSTALL_SCRIPTS  = custom

#BUILD_ARGS = \
	CFLAGS="$(CFLAGS)" \
	LDFLAGS="$(LDFLAGS)"

include ../../gar.mk

CFLAGS  := $(CFLAGS) -DUSELIRC -I$(DESTDIR)$(includedir)/lirc
LDFLAGS := $(LDFLAGS) -llirc_client

LDFLAGS := $(LDFLAGS) -fwhole-program

LDFLAGS := $(CFLAGS) $(LDFLAGS)

cvs//%/$(DISTNAME).tar.bz2:
	@$(call FETCH_CVS, $*, apps/$(GARNAME), $(GARVERSION), $(DISTNAME))
	@$(MAKECOOKIE)

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -f $(WORKSRC)/kbdd $(DESTDIR)$(bindir)/kbdd
	@$(MAKECOOKIE)
