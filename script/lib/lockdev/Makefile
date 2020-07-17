GARNAME = lockdev
GARVERSION = 1.0.3
CATEGORIES = lib
MASTER_SITES = http://ftp.debian.org/debian/pool/main/l/lockdev/
DISTFILES = $(GARNAME)_$(GARVERSION).orig.tar.gz
PATCHFILES = $(DISTNAME)-makefile.patch
LICENSE = LGPL2_1

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

BUILD_ARGS = \
	CC="$(CC)" \
	AR="$(AR)" \
	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -fno-lto" \
	shared \
	static

BUILD_OVERRIDE_DIRS   = incdir libdir mandir
INSTALL_OVERRIDE_DIRS = incdir libdir mandir

include ../../gar.mk

incdir := $(includedir)

GARVERSION_MAJOR := $(strip $(word 1,$(subst ., ,$(GARVERSION))))
GARVERSION_MINOR := $(strip $(word 2,$(subst ., ,$(GARVERSION))))
GARVERSION_TEENY := $(strip $(word 3,$(subst ., ,$(GARVERSION))))

post-install:
	@rm -f $(DESTDIR)$(libdir)/liblockdev.a
	@ln -sf                     lib$(GARNAME).so.$(GARVERSION_MAJOR).$(GARVERSION_MINOR).$(GARVERSION_TEENY) \
                $(DESTDIR)$(libdir)/lib$(GARNAME).so.$(GARVERSION_MAJOR).$(GARVERSION_MINOR)
	@ln -sf                     lib$(GARNAME).so.$(GARVERSION_MAJOR).$(GARVERSION_MINOR) \
                $(DESTDIR)$(libdir)/lib$(GARNAME).so.$(GARVERSION_MAJOR)
	@ln -sf                     lib$(GARNAME).so.$(GARVERSION_MAJOR) \
                $(DESTDIR)$(libdir)/lib$(GARNAME).so
	@$(MAKECOOKIE)
