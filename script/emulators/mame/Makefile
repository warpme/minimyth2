
GARNAME      = mame
GARVERSION   = 0.219
CATEGORIES   = emulators
MASTER_SITES = https://github.com/mamedev/mame/archive/
DISTFILES    = $(GARNAME)$(subst .,,$(GARVERSION)).tar.gz
WORKSRC      = $(WORKDIR)/$(GARNAME)-$(GARNAME)$(subst .,,$(GARVERSION))
LICENSE      = BSD_3_Clause/LGPL2_1/GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lang/cxx lib/SDL2 lib/SDL2_ttf xorg/xorg
BUILDDEPS = python2/python

BUILD_SCRIPTS   = $(WORKSRC)/makefile
INSTALL_SCRIPTS = custom

BUILD_ARGS  = \
	VERBOSE="1" \
	NOWERROR="1" \
	CROSS_BUILD="$(CROSS_BUILD)" \
	OVERRIDE_CC="$(CC)" \
	OVERRIDE_CXX="$(CXX)" \
	OVERRIDE_LD="$(CXX)" \
	OVERRIDE_AR="$(AR)" \
	ARCHOPTS="$(ARCHOPTS)" \
	OPT_FLAGS="$(OPT_FLAGS)" \
	LDOPTS="$(LDOPTS)" \
	TARGETOS="linux" \
	PTR64="$(PTR64)" \
	LTO="$(LTO)" \
	OPTIMIZE="$(OPTIMIZE)" \
	USE_QTDEBUG="0"

include ../../gar.mk

CROSS_BUILD := $(if $(filter build,$(DESTIMG)),0,1)
OPTIMIZE    := $(subst -O,,$(filter -O%,$(CFLAGS)))
ARCHOPTS    := $(CFLAGS) $(CXXFLAGS)
OPT_FLAGS   := $(CFLAGS) $(CXXFLAGS)
LDOPTS      := $(CFLAGS) $(CXXFLAGS) $(LDFLAGS)
PTR64       := $(if $(filter x86_64,$(GARCH_FAMILY)),1,0)
# Disable LTO as on gcc9.3.0 it fails to build
# LTO         := $(if $(filter -flto,$(LDFLAGS)),1,0)
LTO         := $(if $(filter -flto,$(LDFLAGS)),0,0)

CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@$(if $(filter x86_64,$(GARCH_FAMILY)), \
		cp -f $(WORKSRC)/mame64 $(DESTDIR)$(bindir)/mame, \
		cp -f $(WORKSRC)/mame   $(DESTDIR)$(bindir)/mame)
	@$(MAKECOOKIE)
