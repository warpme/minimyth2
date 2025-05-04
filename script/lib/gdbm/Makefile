
GARNAME      = gdbm
GARVERSION   = 1.25
CATEGORIES   = lib
MASTER_SITES = ftp://ftp.gnu.org/gnu/gdbm/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = LGPL2_1

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--with-gnu-ld \
	--enable-libgdbm-compat

include ../../gar.mk

post-install:
	@mkdir -p $(DESTDIR)$(includedir)/gdbm
	@ln -sf $(DESTDIR)$(includedir)/dbm.h $(DESTDIR)$(includedir)/gdbm/dbm.h
	@ln -sf $(DESTDIR)$(includedir)/gdbm.h $(DESTDIR)$(includedir)/gdbm/gdbm.h
	@ln -sf $(DESTDIR)$(includedir)/ndbm.h $(DESTDIR)$(includedir)/gdbm/ndbm.h
	@rm -f $(DESTDIR)$(libdir)/libgdbm_compat.la
	@rm -f $(DESTDIR)$(libdir)/libgdbm.la
	@$(MAKECOOKIE)
