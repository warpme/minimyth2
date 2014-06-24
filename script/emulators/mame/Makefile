GARNAME = mame
GARVERSION = 0.148
CATEGORIES = emulators
DISTFILES = $(GARNAME)$(subst .,,$(GARVERSION))s.zip
PATCHFILES  = $(DISTNAME).patch.gar $(DISTNAME)-no_gtk.patch
ifneq ($(DESTIMG),build)
PATCHFILES += $(DISTNAME)-cross.patch
endif
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/docs/license.txt

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/expat lib/SDL lib/SDL_ttf lib/zlib xorg/xorg
ifneq ($(DESTIMG),build)
BUILDDEPS += emulators/mame
endif

BUILD_SCRIPTS    = $(WORKSRC)/makefile
INSTALL_SCRIPTS  = custom
ifeq ($(DESTIMG),build)
INSTALL_SCRIPTS += cross
endif

BUILD_ARGS  = \
	NOWERROR="1" \
	OPTIMIZE="$(OPTIMIZE)" \
	OPT_FLAGS="$(CFLAGS)" \
	NO_DEBUGGER="1" \
	$(if $(filter x86_64,$(GARCH_FAMILY)),PTR64="1",PTR64="0")

ifneq ($(DESTIMG),build)
BUILD_ARGS += \
	FILE2STR_TARGET="mame-file2str" \
	MAKEDEP_TARGET="mame-makedep" \
	MAKELIST_TARGET="mame-makelist" \
	PNG2BDC_TARGET="mame-png2bdc" \
	VERINFO_TARGET="mame-verinfo"
endif

include ../../gar.mk

LD := $(CXX)

OPTIMIZE := $(subst -O,,$(filter -O%,$(CFLAGS)))

# mame fails to compile with gcc 4.7.0's link time optimization enabled.
CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

post-extract:
	@echo " ==> Extracting $(EXTRACTDIR)/mame.zip"
	@mkdir -p $(WORKSRC)
	@unzip $(EXTRACTDIR)/mame.zip -d $(WORKSRC)
	@rm -f $(EXTRACTDIR)/mame.zip
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@$(if $(filter x86_64,$(GARCH_FAMILY)), \
		cp -f $(WORKSRC)/mame64 $(DESTDIR)$(bindir)/mame, \
		cp -f $(WORKSRC)/mame   $(DESTDIR)$(bindir)/mame)
	@$(MAKECOOKIE)

install-cross:
	@mkdir -p $(DESTDIR)$(bindir)
	@$(if $(filter x86_64,$(GARCH_FAMILY)), \
		cp -f $(WORKSRC)/obj/sdl64/build/file2str $(DESTDIR)$(bindir)/mame-file2str ; \
		cp -f $(WORKSRC)/obj/sdl64/build/makedep  $(DESTDIR)$(bindir)/mame-makedep  ; \
		cp -f $(WORKSRC)/obj/sdl64/build/makelist $(DESTDIR)$(bindir)/mame-makelist ; \
		cp -f $(WORKSRC)/obj/sdl64/build/png2bdc  $(DESTDIR)$(bindir)/mame-png2bdc  ; \
		cp -f $(WORKSRC)/obj/sdl64/build/verinfo  $(DESTDIR)$(bindir)/mame-verinfo,   \
		cp -f $(WORKSRC)/obj/sdl/build/file2str   $(DESTDIR)$(bindir)/mame-file2str ; \
		cp -f $(WORKSRC)/obj/sdl/build/makedep    $(DESTDIR)$(bindir)/mame-makedep  ; \
		cp -f $(WORKSRC)/obj/sdl/build/makelist   $(DESTDIR)$(bindir)/mame-makelist ; \
		cp -f $(WORKSRC)/obj/sdl/build/png2bdc    $(DESTDIR)$(bindir)/mame-png2bdc  ; \
		cp -f $(WORKSRC)/obj/sdl/build/verinfo    $(DESTDIR)$(bindir)/mame-verinfo)
	@$(if $(filter x86_64,$(GARCH_FAMILY)), \
		cp -f $(WORKSRC)/obj/sdl64/build/m68kmake $(DESTDIR)$(bindir)/mame-m68kmake,  \
		cp -f $(WORKSRC)/obj/sdl/build/m68kmake   $(DESTDIR)$(bindir)/mame-m68kmake)
	@$(MAKECOOKIE)
