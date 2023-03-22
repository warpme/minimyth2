
GARNAME      = mc
GARVERSION   = 4.8.29
CATEGORIES   = utils
MASTER_SITES = http://www.midnight-commander.org/downloads/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.bz2
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/slang

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) \
        --build=$(GARBUILD) \
        --host=$(GARHOST) \
        --prefix="$(prefix)" \
        --sysconfdir="$(sysconfdir)" \
        --libexecdir="$(libexecdir)" \
        --enable-background \
        --disable-network \
        --disable-netcode \
        --disable-charset \
        --disable-nls \
        --without-vfs \
        --with-edit \
        --with-screen=slang \
        --without-x \
        --without-samba \
        --without-gpm-mouse \
        --without-gnome \
        --without-debug \
        --without-included-gettext \
        --disable-dependency-tracking

include ../../gar.mk
