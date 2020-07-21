
GARNAME      = iwd
GARVERSION   = 1.8
CATEGORIES   = new
MASTER_SITES = https://www.kernel.org/pub/linux/network/wireless/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.xz
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/readline

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) \
	--build=$(GARBUILD) \
	--host=$(GARHOST) \
	--prefix="$(prefix)" \
	--sysconfdir="$(sysconfdir)" \
	--localstatedir="$(localstatedir)" \
	--with-runstatedir=/run \
	--libexecdir="$(libexecdir)" \
	--enable-wired \
	--enable-ofono \
	--enable-sim-hardcoded \
	--enable-hwsim \
	--disable-systemd-service \
	--disable-manual-pages \

include ../../gar.mk
