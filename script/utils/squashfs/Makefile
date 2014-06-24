GARNAME = squashfs
GARVERSION = 4.2
CATEGORIES = lib
MASTER_SITES  = http://downloads.sourceforge.net/project/$(GARNAME)/$(GARNAME)/$(GARNAME)$(GARVERSION)/
MASTER_SITES += cvs://anonymous@$(GARNAME).cvs.sourceforge.net:/cvsroot/$(GARNAME)/
DISTFILES = $(GARNAME)$(GARVERSION).tar.gz
PATCHFILES = $(DISTNAME)-gzip_fix.patch $(DISTNAME).patch.gar
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c utils/xz

WORKSRC = $(WORKDIR)/$(GARNAME)$(GARVERSION)

BUILD_SCRIPTS   = $(WORKSRC)/squashfs-tools/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/squashfs-tools/Makefile

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

cvs//%/$(DISTNAME).tar.bz2:
	@$(call FETCH_CVS, $*, $(GARNAME), $(GARVERSION), $(DISTNAME))
	@$(MAKECOOKIE)

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

pre-install:
	@rm -f $(DESTDIR)$(bindir)/mksquashfs
	@rm -f $(DESTDIR)$(bindir)/unsquashfs
	@$(MAKECOOKIE)
