
GARNAME      = nspr
GARVERSION   = 4.36
CATEGORIES   = lib
MASTER_SITES = https://ftp.mozilla.org/pub/mozilla.org/$(GARNAME)/releases/v$(GARVERSION)/src/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = nspr-cross.patch
LICENSE      = MPL1_1/GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c
BUILDDEPS  =
ifneq ($(DESTIMG),build)
BUILDDEPS += lib/nspr
endif

CONFIGURE_SCRIPTS = $(WORKSRC)/nspr/configure
BUILD_SCRIPTS     = $(WORKSRC)/nspr/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/nspr/Makefile  nsinstall

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --target=$(GARTARGET) \
	$(if $(filter x86_64,$(GARCH_FAMILY)),--enable-64bit)

CONFIGURE_ENV = \
	ac_cv_path_AS="$(AS)" \
	ac_cv_path_AR="$(AR)" \
	ac_cv_path_LD="$(LD)" \
	ac_cv_path_STRIP="$(STRIP)"

include ../../gar.mk

install-nsinstall:
	@cp -f $(WORKSRC)/nspr/config/nsinstall $(DESTDIR)$(bindir)/nsinstall
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libnspr4.a
	@rm -f $(DESTDIR)$(libdir)/libplc4.a
	@rm -f $(DESTDIR)$(libdir)/libplds4.a
	@rm -f $(DESTDIR)$(bindir)-config/nspr-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)nspr-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/nspr-config $(DESTDIR)$(bindir)-config/nspr-config
	@$(if $(compiler_prefix), ln -s nspr-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)nspr-config)
	@$(MAKECOOKIE)
