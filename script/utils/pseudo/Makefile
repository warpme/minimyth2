
GARNAME      = pseudo
GARVERSION   = 1.9.0
CATEGORIES   = utils
MASTER_SITES = http://git.yoctoproject.org/cgit/cgit.cgi/pseudo/snapshot/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.gz
PATCHFILES   = $(DISTNAME)-fix-building-on-hosts-with-glibc2.33.patch
PATCHFILES  += $(DISTNAME)-fix-building-on-hosts-with-gcc12.1.patch
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c db/sqlite lib/libattr

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

include ../../gar.mk

CONFIGURE_ARGS = \
        --prefix="$(prefix)" \
        --with-sqlite=$(build_rootdir)/usr \

#        --enable-xattr \
