
GARNAME      = gettext
GARVERSION   = 1.0
CATEGORIES   = devel
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.xz
PATCHFILES   = \
	$(DISTNAME)-perl.patch.gar \
	$(DISTNAME)-hack-to-fix-compilation.patch
LICENSE = GPL3

#	$(DISTNAME)-non_interactive.patch \

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libxml2

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-rpath \
	--disable-openmp \
	--disable-man \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libasprintf.la
	@rm -f $(DESTDIR)$(libdir)/libgettextlib.la
	@rm -f $(DESTDIR)$(libdir)/libgettextsrc.la
	@rm -f $(DESTDIR)$(libdir)/libgettextpo.la
	@rm -f $(DESTDIR)$(libdir)/libtextstyle.la
	@$(MAKECOOKIE)
