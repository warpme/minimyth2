
GARNAME    = gmp
GARVERSION = $(GMP_VERSION)
CATEGORIES = devel-tainted
SOURCEPKG  = devel/gmp
LICENSE    = GPL3/LGPL3

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = devel-tainted/make

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
ifeq ($(DESTIMG),build)
BUILD_SCRIPTS     += check
endif
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-cxx \
	--enable-shared \
	--disable-static \
	--without-readline \
	--with-gnu-ld

GAR_EXTRA_CONF += devel/gmp/package-api.mk
include ../../gar.mk

CFLAGS += -std=c17

build-check:
	@echo " ==> Running make check in $(WORKSRC)"
	@$(BUILD_ENV) $(MAKE) $(PARALLELMFLAGS) $(foreach TTT,$(BUILD_OVERRIDE_DIRS),$(TTT)="$($(TTT))") -C $(WORKSRC) $(BUILD_ARGS) check
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libgmp.la
	@$(MAKECOOKIE)
