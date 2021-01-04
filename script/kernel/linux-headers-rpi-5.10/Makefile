
GARNAME      = linux-rpi
GARVERSION   = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),$(if $(filter-out 0,$(LINUX_TEENY_VERSION)),.$(LINUX_TEENY_VERSION)))$(LINUX_EXTRA_VERSION)
CATEGORIES   = kernel-headers
MASTER_SITES = https://github.com/raspberrypi/linux/archive/
DISTFILES    = $(GITHASH).zip $(CONFIGFILE)
WORKSRC      = $(WORKDIR)/linux-$(GITHASH)

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS = utils/unifdef

INSTALL_SCRIPTS = custom

INSTALL_ARGS = $(LINUX_MAKE_ARGS)

INSTALL_ENV = $(LINUX_MAKE_ENV)

GAR_EXTRA_CONF += kernel/linux-rpi-5.10/package-api.mk
include ../../gar.mk

install-custom:
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) headers_install
	@mkdir -p $(DESTDIR)$(includedir)
	@cp -rf $(WORKSRC)/usr/include/* $(DESTDIR)$(includedir)
	@$(MAKECOOKIE)

clean-all:
	@true
