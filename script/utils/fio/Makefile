
GARNAME      = fio
GARVERSION   = 3.39
CATEGORIES   = utils
MASTER_SITES = https://github.com/axboe/fio/archive/refs/tags/
DISTFILES    = $(DISTNAME).tar.gz
WORKSRC      = $(WORKDIR)/$(GARNAME)-fio-$(GARVERSION)
LICENSE      = GPL2

DEPENDS = lang/c lib/libaio

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = custom

CONFIGURE_ARGS = \
	--prefix="$(prefix)" \
	--disable-native \
	--disable-tcmalloc \

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -f $(WORKSRC)/fio $(DESTDIR)$(bindir)/
	@$(MAKECOOKIE)
