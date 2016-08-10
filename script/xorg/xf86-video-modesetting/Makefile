GARNAME = xf86-video-modesetting
GARVERSION_TYPE = git
GARVERSION = $(strip $(if $(filter git,$(GARVERSION_TYPE)) , \
	20160720-9a655ea, \
	0.9.0 ))
CATEGORIES = $(CATEGORY)
MASTER_SITES = $(strip $(if $(filter git,$(GARVERSION_TYPE)) , \
	git://anongit.freedesktop.org/xorg/driver/xf86-video-modesetting/ , \
	$(XORG_MASTER_SITES) ))
DISTFILES = $(DISTNAME).tar.bz2

LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS  = lang/c \
	$(CATEGORY)/fontsproto \
	$(CATEGORY)/libdrm \
	$(CATEGORY)/libpciaccess \
	$(CATEGORY)/randrproto \
	$(CATEGORY)/renderproto \
	$(CATEGORY)/util-macros \
	$(CATEGORY)/videoproto \
	$(CATEGORY)/xextproto \
	$(CATEGORY)/xf86driproto \
	$(CATEGORY)/xorg-server \
	$(CATEGORY)/xproto

ifneq ($(DESTIMG),build)
DEPENDS += system/udev
endif
BUILDDEPS = \
	$(CATEGORY)/xorg-sgml-doctools

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--disable-silent-rules

CONFIGURE_ENV = \
	XORG_SGML_PATH="$(DESTDIR)$(includedir)/xorg"

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

x-checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE) 

pre-configure:
	@mkdir -p $(WORKSRC)/m4
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@rm -f $(WORKSRC)/config.cache
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/drivers/modesetting_drv.la
	@$(MAKECOOKIE)
