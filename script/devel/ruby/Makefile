
GARNAME      = ruby
GARVERSION   = 3.0.4
CATEGORIES   = utils
MASTER_SITES = https://cache.ruby-lang.org/pub/ruby/3.0/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.xz
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

ifneq ($(DESTIMG),build)
BUILDDEPS += devel/ruby
endif

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CPPFLAGS += -fPIC
CFLAGS   += -fPIC

CONFIGURE_ARGS = $(DIRPATHS) \
        --build=$(GARBUILD) \
        --host=$(GARHOST) \
        --disable-install-doc \
        --disable-install-rdoc \
        --with-baseruby=$(build_DESTDIR)$(build_bindir)/ruby

ifeq ($(DESTIMG),build)
CONFIGURE_ARGS += \
        --prefix="$(DESTDIR)"
else
CONFIGURE_ARGS += \
        --prefix="/"
endif

include ../../gar.mk
