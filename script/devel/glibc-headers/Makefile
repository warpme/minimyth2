GARNAME = glibc-headers
GARVERSION = $(GLIBC_VERSION)
CATEGORIES = devel
SOURCEPKG = devel/glibc
LICENSE = GPL2/LGPL2_1

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
	--enable-kernel=3.0.0 \
	--with-binutils=$(build_DESTDIR)$(build_bindir) \
	--without-cvs \
	--with-headers=$(DESTDIR)$(includedir) \
	--disable-add-ons \
	--without-tls \
	--without-__thread
INSTALL_ARGS    = \
	cross-compiling=yes \
	install_root=$(DESTDIR)

GAR_EXTRA_CONF += devel/glibc/package-api.mk
include ../../gar.mk

DEFAULT_ENV   := \
	DESTDIR="$(DESTDIR)" \
	CC="$(build_CC)" \
	CXX="$(build_CXX)" \
	LD="$(build_LD)" \
	AR="$(build_AR)" \
	AS="$(build_AS)" \
	OBJDUMP="$(build_OBJDUMP)" \
	RANLIB="$(build_RANLIB)" \
	libc_cv_386_tls="yes"
CONFIGURE_ENV := $(DEFAULT_ENV)
BUILD_ENV     := $(DEFAULT_ENV)
INSTALL_ENV   := $(DEFAULT_ENV)

pre-configure:
	@mkdir -p $(WORKBLD)
	@rm -rf $(WORKBLD)/configparms
	@echo "slibdir=$(elibdir)" >> $(WORKBLD)/configparms
	@rm -rf $(WORKBLD)/config.cache
	@echo "libc_cv_386_tls=yes" >> $(WORKBLD)/config.cache
	@$(MAKECOOKIE)

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
	@cp $(WORKBLD)/bits/stdio_lim.h $(DESTDIR)$(includedir)/bits
	@cp $(WORKSRC)/nptl/sysdeps/pthread/pthread.h $(DESTDIR)$(includedir)
	@cp $(WORKSRC)/nptl/sysdeps/unix/sysv/linux/i386/bits/pthreadtypes.h $(DESTDIR)$(includedir)/bits
	@$(MAKECOOKIE)
