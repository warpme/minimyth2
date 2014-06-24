GARNAME = ifplugd
GARVERSION = 0.28
CATEGORIES = net
MASTER_SITES = http://0pointer.de/lennart/projects/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-interface_c.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/libdaemon

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-lynx \
	--disable-xmltoman \
	--disable-subversion \
	--with-initdir=$(docdir)/$(DISTNAME)

CONFIGURE_ENV = \
	ac_cv_func_fork_works=yes \
	ac_cv_func_malloc_0_nonnull=yes

include ../../gar.mk
