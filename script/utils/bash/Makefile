
GARNAME       = bash
GARVERSION    = 5.2
CATEGORIES    = utils
MASTER_SITES  = https://ftp.gnu.org/gnu/$(GARNAME)/
MASTER_SITES += https://ftp.gnu.org/gnu/$(GARNAME)/$(DISTNAME)-patches/
DISTFILES     = $(DISTNAME).tar.gz
PATCHFILES  = \
	$(GARNAME)$(subst .,,$(GARVERSION))-001 \
	$(GARNAME)$(subst .,,$(GARVERSION))-002 \
	$(GARNAME)$(subst .,,$(GARVERSION))-003 \
	$(GARNAME)$(subst .,,$(GARVERSION))-004 \
	$(GARNAME)$(subst .,,$(GARVERSION))-005 \
	$(GARNAME)$(subst .,,$(GARVERSION))-006 \
	$(GARNAME)$(subst .,,$(GARVERSION))-007 \
	$(GARNAME)$(subst .,,$(GARVERSION))-008 \
	$(GARNAME)$(subst .,,$(GARVERSION))-009 \
	$(GARNAME)$(subst .,,$(GARVERSION))-010 \
	$(GARNAME)$(subst .,,$(GARVERSION))-011 \
	$(GARNAME)$(subst .,,$(GARVERSION))-012 \
	$(GARNAME)$(subst .,,$(GARVERSION))-013 \
	$(GARNAME)$(subst .,,$(GARVERSION))-014 \
	$(GARNAME)$(subst .,,$(GARVERSION))-015 \
	$(GARNAME)$(subst .,,$(GARVERSION))-016 \
	$(GARNAME)$(subst .,,$(GARVERSION))-017 \
	$(GARNAME)$(subst .,,$(GARVERSION))-018 \
	$(GARNAME)$(subst .,,$(GARVERSION))-019 \
	$(GARNAME)$(subst .,,$(GARVERSION))-020 \
	$(GARNAME)$(subst .,,$(GARVERSION))-021 \
	$(GARNAME)$(subst .,,$(GARVERSION))-022 \
	$(GARNAME)$(subst .,,$(GARVERSION))-023 \
	$(GARNAME)$(subst .,,$(GARVERSION))-024 \
	$(GARNAME)$(subst .,,$(GARVERSION))-025 \
	$(GARNAME)$(subst .,,$(GARVERSION))-026 \
	$(GARNAME)$(subst .,,$(GARVERSION))-027 \
	$(GARNAME)$(subst .,,$(GARVERSION))-028 \
	$(GARNAME)$(subst .,,$(GARVERSION))-029 \
	$(GARNAME)$(subst .,,$(GARVERSION))-030 \
	$(GARNAME)$(subst .,,$(GARVERSION))-031 \
	$(GARNAME)$(subst .,,$(GARVERSION))-032 \
	$(GARNAME)$(subst .,,$(GARVERSION))-033 \
	$(GARNAME)$(subst .,,$(GARVERSION))-034 \
	$(GARNAME)$(subst .,,$(GARVERSION))-035 \
	$(GARNAME)$(subst .,,$(GARVERSION))-036 \
	$(GARNAME)$(subst .,,$(GARVERSION))-037 \

PATCHFILES += $(DISTNAME)-perl.patch.gar
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

PATCHDIRLEVEL = 0

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --exec-prefix=$(prefix) --prefix=$(prefix) \
	--with-gnu-ld

CFLAGS += -Wno-implicit-function-declaration 
CFLAGS += -std=c17

include ../../gar.mk

libdir  := $(elibdir)
bindir  := $(ebindir)
sbindir := $(esbindir)

patch-%: normal-patch-%
	@$(MAKECOOKIE)

pre-configure:
	@#$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@ln -fs bash $(DESTDIR)$(bindir)/sh
	@$(MAKECOOKIE)
