
GARNAME      = gnutls
GARVERSION   = 3.8.7
CATEGORIES   = lib
MASTER_SITES = https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/nettle

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--with-included-libtasn1 \
	--with-included-unistring \
	--without-p11-kit \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-gtk-doc-pdf \
	--disable-doc \

include ../../gar.mk

CFLAGS   := $(filter-out -flto=auto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto=auto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto=auto, $(LDFLAGS))

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@$(MAKECOOKIE)
