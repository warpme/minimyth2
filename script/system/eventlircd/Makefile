GARNAME = eventlircd
GARVERSION_TYPE = git
GARVERSION = $(strip $(if $(filter git,$(GARVERSION_TYPE)) , \
	20170619-fb51489, \
	44 ))
CATEGORIES = system
MASTER_SITES = $(strip $(if $(filter git,$(GARVERSION_TYPE)) , \
	git://github.com/OpenELEC/eventlircd.git/ , \
	svn://eventlircd.googlecode.com/svn/trunk/ ))
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c system/eudev

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--with-udev-dir=$(libdir)/udev \
	ax_cv_c_check_flag__Werror=no

include ../../gar.mk

svn//%/$(DISTNAME).tar.bz2:
	@$(call FETCH_SVN, http://$*, $(GARVERSION), $(DISTNAME))
	@$(MAKECOOKIE)

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
