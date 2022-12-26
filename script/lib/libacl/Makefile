
GARNAME       = acl
GARVERSION    = 2.3.1
CATEGORIES    = lib
MASTER_SITES  = https://download.savannah.gnu.org/releases/acl/
DISTFILES     = $(DISTNAME).tar.gz
LICENSE       = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libattr

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--disable-gettext \
	--disable-lib64 \
	--with-gnu-ld
BUILD_ARGS     = SHELL=$(CONFIG_SHELL)
INSTALL_ARGS   = SHELL=$(CONFIG_SHELL)

CONFIGURE_ENV = \
	ac_cv_path_MAKE=$(build_DESTDIR)$(build_bindir)/make

BUILD_OVERRIDE_DIRS   = PKG_BIN_DIR PKG_SBIN_DIR PKG_LIB_DIR PKG_DEVLIB_DIR PKG_INC_DIR PKG_MAN_DIR PKG_DOC_DIR
INSTALL_OVERRIDE_DIRS = PKG_BIN_DIR PKG_SBIN_DIR PKG_LIB_DIR PKG_DEVLIB_DIR PKG_INC_DIR PKG_MAN_DIR PKG_DOC_DIR

include ../../gar.mk

PKG_BIN_DIR     := $(bindir)
PKG_SBIN_DIR    := $(sbindir)
PKG_LIB_DIR     := $(libdir)
PKG_DEVLIB_DIR  := $(libexecdir)
PKG_INC_DIR     := $(includedir)
PKG_MAN_DIR     := $(mandir)
PKG_DOC_DIR     := $(docdir)/$(GARNAME)
PKG_LOCALE_DIR  := $(datadir)/locale

pre-configure:
	@cd $(WORKSRC) ; rm -f include/config.h.in~
	@cd $(WORKSRC) ; mv include/config.h.in include/config.h.in~
	@$(call RUN_AUTOTOOLS, cd $(WORKSRC) ; autoreconf --verbose --install --force -I $(DESTDIR)$(datadir)/aclocal -I m4)
	@cd $(WORKSRC) ; rm -f include/config.h.in
	@cd $(WORKSRC) ; mv include/config.h.in~ include/config.h.in
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libacl.a
	@rm -f $(DESTDIR)$(libdir)/libacl.la
	@rm -f $(DESTDIR)$(libexecdir)/libacl.la
	@$(MAKECOOKIE)
