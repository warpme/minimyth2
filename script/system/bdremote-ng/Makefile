GARNAME = bdremote-ng
GARVERSION = 0.5
CATEGORIES = system
MASTER_SITES = http://bdremote-ng.googlecode.com/files/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME)-syn_report.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

WORKSRC = $(WORKDIR)/$(GARNAME)-0.5

DEPENDS = lang/c lib/bluez

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

CFLAGS := $(CFLAGS) -DENABLE_REPEAT=1

LDFLAGS := $(LDFLAGS) -fwhole-program

build-custom:
	cd $(WORKSRC)/src ; $(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -I . -o bdremoteng bdremoteng.c bdrcfg.c captureif.c globaldefs.c l.c lirc_callback.c lirc_srv.c lirc_thr.c lirc_util.c q.c ug.c event_out.c capture/capture_bluez.c -lpthread -lbluetooth
	$(MAKECOOKIE)

install-custom:
	mkdir -p $(DESTDIR)$(sbindir)
	rm -f $(DESTDIR)$(sbindir)/bdremoteng
	cp $(WORKSRC)/src/bdremoteng $(DESTDIR)$(sbindir)/bdremoteng
	$(MAKECOOKIE)
