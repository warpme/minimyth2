
GARNAME    = glibc-headers
GARVERSION = $(GLIBC_VERSION)
CATEGORIES = devel
SOURCEPKG  = devel/glibc
LICENSE    = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

WORKSRC = $(WORKDIR)/glibc-$(GARVERSION)
WORKBLD = $(WORKSRC)_build

DEPENDS = lang/c kernel-headers/linux-headers

CONFIGURE_SCRIPTS = custom
INSTALL_SCRIPTS   = custom

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--disable-sanity-checks \
	--enable-kernel=6.0.0 \
	--disable-build-nscd \
	--disable-nscd \
	--enable-add-ons=nptl \
	--with-tls \
	--with-__thread \
	--without-cvs \
	--with-headers=$(DESTDIR)$(includedir) \
	--disable-add-ons \
	--without-tls \
	$(if $(filter arm arm64,$(GARCH_FAMILY)),--disable-mathvec) \

INSTALL_ARGS    = \
	cross-compiling=yes \
	install_root=$(DESTDIR)

CONFIGURE_ENV = \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"

BUILD_ENV     = \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"

INSTALL_ENV   = \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"

GAR_EXTRA_CONF += devel/glibc/package-api.mk
include ../../gar.mk

CPP      := $(build_CPP)
CC       := $(build_CC)
CXX      := $(build_CXX)
LD       := $(build_LD)
AR       := $(build_AR)
AS       := $(build_AS)
OBJDUMP  := $(build_OBJDUMP)
RANLIB   := $(build_RANLIB)
ifeq ($(GARCH),armv7)
CPPFLAGS := -D__ARM_ARCH=7
else
CPPFLAGS :=
endif
CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=

configure-custom:
	@mkdir -p $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

install-custom:
	@$(INSTALL_ENV) $(MAKE) DESTDIR=$(DESTDIR) $(foreach TTT,$(INSTALL_OVERRIDE_DIRS),$(TTT)="$(DESTDIR)$($(TTT))") -C $(WORKBLD) $(INSTALL_ARGS) install-headers
	@$(MAKECOOKIE)

post-install:
	@mkdir -p $(DESTDIR)$(includedir)/gnu
	@mkdir -p $(DESTDIR)$(includedir)/bits
	@touch $(DESTDIR)$(includedir)/gnu/stubs.h
	@$(MAKECOOKIE)
