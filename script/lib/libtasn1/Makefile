
GARNAME      = libtasn1
GARVERSION   = 4.20.0
CATEGORIES   = lib
MASTER_SITES = https://ftp.gnu.org/gnu/libtasn1/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL2

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \
	--enable-silent-rules \
	--disable-doc \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-gtk-doc-pdf \
	--disable-valgrind-tests \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libtasn1.la
	$(MAKECOOKIE)
