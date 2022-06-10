
GARNAME      = bison
GARVERSION   = 3.8.2
CATEGORIES   = devel
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = $(DISTNAME)-perl.patch.gar $(DISTNAME)-hack-skip-build-bison-info.patch
LICENSE      = GPL3

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS = utils/m4 perl/perl-Text-Unidecode perl/perl-libintl perl/perl-unicode-eastasianwidth

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile 
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-rpath \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@# Disable building doc as this requires some perl modules..and is basically useless here
	@sed -i '/^SUBDIRS/s/doc//' $(WORKSRC)/Makefile.in
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/liby.a
	@$(MAKECOOKIE)
