GARNAME = mame
GARVERSION = 0.199
CATEGORIES = emulators
MASTER_SITES = http://github.com/mamedev/mame/releases/download/$(GARNAME)$(subst .,,$(GARVERSION))/
DISTFILES = $(GARNAME)$(subst .,,$(GARVERSION))s.zip
LICENSE = BSD_3_Clause/LGPL2_1/GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lang/cxx lib/SDL2 lib/SDL2_ttf xorg/xorg
BUILDDEPS = python/python

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

# mame 0.163 fails to compile (or takes very long to complete) with gcc 5.3.0's link time optimization enabled.
CFLAGS   := $(filter-out -flto, $(CFLAGS))   -fno-lto
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS)) -fno-lto
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))  -fno-lto

CROSS_BUILD := $(if $(filter build,$(DESTIMG)),0,1)
OPTIMIZE    := $(subst -O,,$(filter -O%,$(CFLAGS)))
ARCHOPTS    := $(CFLAGS) $(CXXFLAGS)
OPT_FLAGS   := $(CFLAGS) $(CXXFLAGS)
LDOPTS      := $(CFLAGS) $(CXXFLAGS) $(LDFLAGS)
PTR64       := $(if $(filter x86_64,$(GARCH_FAMILY)),1,0)
LTO         := $(if $(filter -flto,$(LDFLAGS)),1,0)

CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=

post-extract:
	@echo " ==> Extracting $(EXTRACTDIR)/mame.zip"
	@mkdir -p $(WORKSRC)
	@# By some reason recent mame .zip archives causing unzip to
	@# return non-zero exit code. ; true is hack to ovecome this....
	@unzip $(EXTRACTDIR)/mame.zip -d $(WORKSRC) ; true
	@rm -f $(EXTRACTDIR)/mame.zip
	@#$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@$(if $(filter x86_64,$(GARCH_FAMILY)), \
		cp -f $(WORKSRC)/mame64 $(DESTDIR)$(bindir)/mame, \
		cp -f $(WORKSRC)/mame   $(DESTDIR)$(bindir)/mame)
	@$(MAKECOOKIE)
