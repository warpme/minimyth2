
GARNAME = linux-amlogic
GARVERSION = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),$(if $(filter-out 0,$(LINUX_TEENY_VERSION)),.$(LINUX_TEENY_VERSION)))$(LINUX_EXTRA_VERSION)
CATEGORIES = kernel-headers

#--Use this for mainline kernel-------------------------------
#DISTFILES           = $(GITHASH).tar.gz
#WORKSRC             = $(WORKDIR)/$(GITHASH)
#-------------------------------------------------------------

#--Use this for khadas kernel---------------------------------
# DISTFILES           = $(GITHASH).zip
# WORKSRC             = $(WORKDIR)/linux-$(GITHASH)
#-------------------------------------------------------------

#-- Use this for Elyotna kernel-------------------------------
# DISTFILES           = $(GITHASH).tar.gz
# WORKSRC             = $(WORKDIR)/linux-$(GITHASH)
#-------------------------------------------------------------

#--Use this for balbes150 kernel------------------------------
# DISTFILES           = $(GITHASH).zip
# WORKSRC             = $(WORKDIR)/Amlogic_s905-kernel-$(GITHASH)
#-------------------------------------------------------------

#-- Use this for yuq lima kernel------------------------------
DISTFILES           = $(GITHASH).tar.bz2
WORKSRC             = $(WORKDIR)/linux-lima-4.19-rc4-$(GITHASH)
#-------------------------------------------------------------

#--Use this for official kernel git for AMLogic (khilman)-----
# DISTFILES           = $(GARNAME)-$(GARVERSION).tar.gz
#-------------------------------------------------------------

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS = utils/unifdef

INSTALL_SCRIPTS = custom

INSTALL_ARGS = $(LINUX_MAKE_ARGS)

INSTALL_ENV = $(LINUX_MAKE_ENV)

GAR_EXTRA_CONF += kernel/linux-amlogic-4.19/package-api.mk
include ../../gar.mk

install-custom:
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) headers_install
	@mkdir -p $(DESTDIR)$(includedir)
	@cp -rf $(WORKSRC)/usr/include/* $(DESTDIR)$(includedir)
	@$(MAKECOOKIE)

clean-all:
	@true
