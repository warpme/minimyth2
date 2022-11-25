GARNAME = gcc-minimal-static
GARVERSION = $(GCC_VERSION)
CATEGORIES = devel
SOURCEPKG = devel/gcc
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION = 
define BLURB
endef

CROSSIMG ?= $(DESTIMG)
GARTARGET = $($(CROSSIMG)_GARHOST)

IMGDEPS += $(CROSSIMG)
ifneq ("$(DESTIMG)+$(CROSSIMG)","build+build")
$(CROSSIMG)_DEPENDS = kernel-headers/linux-headers devel/glibc-headers
DEPENDS  = lang/c devel/binutils
else
DEPENDS  =
endif
DEPENDS += devel/gmp devel/isl devel/libelf devel/mpc devel/mpfr

WORKDIR   = $(WORKROOTDIR)/$(DESTIMG)_$(CROSSIMG).d
COOKIEDIR = $(COOKIEROOTDIR)/$(DESTIMG)_$(CROSSIMG).d

WORKSRC = $(WORKDIR)/gcc-$(GARVERSION)

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --target=$(GARTARGET) \
	--with-gnu-as \
	--with-gnu-ld \
	--with-local-prefix=$(patsubst %/include,%,$($(CROSSIMG)_includedir)) \
	--enable-silent-rules \
	--enable-plugin \
	--enable-__cxa_atexit \
	--enable-clocale=gnu \
	--enable-languages=c \
	--disable-libatomic \
	--disable-libgomp \
	--disable-libmpx \
	--enable-gold \
	--enable-ld \
	--disable-libquadmath \
	--disable-libquadmath-support \
	--disable-libada \
	--disable-libssp \
	--enable-lto \
	$(if $(filter armv7,$(mm_GARCH)), \
		--enable-multilib \
		--with-multilib-list=aprofile, \
		--disable-multilib) \
	--disable-nls \
	--disable-decimal-float \
	--disable-shared \
	--disable-host-shared \
	--enable-threads=no \
	--enable-version-specific-runtime-libs \
	--with-mpc-include=$(DESTDIR)$(includedir) \
	--with-mpc-lib=$(DESTDIR)$(libdir) \
	--with-mpfr-include=$(DESTDIR)$(includedir) \
	--with-mpfr-lib=$(DESTDIR)$(libdir) \
	--with-gmp-include=$(DESTDIR)$(includedir) \
	--with-gmp-lib=$(DESTDIR)$(libdir) \
	--with-isl-include=$(DESTDIR)$(includedir) \
	--with-isl-lib=$(DESTDIR)$(libdir) \
	--with-libelf-include=$(DESTDIR)$(includedir) \
	--with-libelf-lib=$(DESTDIR)$(libdir) \
	--with-sysroot=$($(CROSSIMG)_DESTDIR)

GAR_EXTRA_CONF += devel/gcc/package-api.mk
include ../../gar.mk

CPPFLAGS :=
CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=

# Do not link to libc.so, because it is not available yet.
pre-configure:
	@$(foreach file,$(wildcard $(WORKSRC)/libgcc/config/t-libunwind-elf  ), sed -i '/^SHLIB_LC = /s%-lc%%' $(file) ; )
	@$(foreach file,$(wildcard $(WORKSRC)/libgcc/config/t-slibgcc        ), sed -i '/^SHLIB_LC = /s%-lc%%' $(file) ; )
	@$(foreach file,$(wildcard $(WORKSRC)/libgcc/config/t-slibgcc-elf-ver), sed -i '/^SHLIB_LC = /s%-lc%%' $(file) ; )
	@$(MAKECOOKIE)

configure-custom:
	@mkdir -p $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)
