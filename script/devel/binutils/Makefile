
GARNAME       = binutils
GARVERSION    = $(BINUTILS_VERSION)
CATEGORIES    = devel
MASTER_SITES  = https://ftp.gnu.org/gnu/$(GARNAME)/
MASTER_SITES += ftp://ftp.kernel.org/pub/linux/devel/$(GARNAME)/
MASTER_SITES += ftp://sourceware.org/pub/$(GARNAME)/snapshots/
DISTFILES     = $(DISTNAME).tar.bz2
PATCHFILES    = $(DISTNAME)-multi_os_directory.patch
PATCHFILES   += $(DISTNAME)-disable-doc-po-build.patch
ifneq ("$(DESTIMG)+$(CROSSIMG)","build+build")
PATCHFILES   += $(DISTNAME)-perl.patch.gar
endif
LICENSE       = GPL2/LGPL2

DESCRIPTION =
define BLURB
endef

CROSSIMG ?= $(DESTIMG)
GARTARGET = $($(CROSSIMG)_GARHOST)

DEPENDS  = lang/c devel/cloog devel/gmp devel/isl devel/libelf devel/mpc devel/mpfr
BUILDDEPS = devel-tainted/devel-tainted devel/make

WORKDIR   = $(WORKROOTDIR)/$(DESTIMG)_$(CROSSIMG).d
COOKIEDIR = $(COOKIEROOTDIR)/$(DESTIMG)_$(CROSSIMG).d

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --target=$(GARTARGET) \
	--enable-plugins \
	--disable-gold \
	--enable-ld=default \
	--disable-libada \
	--disable-libssp \
	--disable-isl-version-check \
	--disable-cloog-version-check \
	--enable-lto \
	--disable-werror \
	$(if $(filter armv7,$(mm_GARCH)), --enable-multilib, --disable-multilib) \
	--enable-multilib \
	--enable-nls \
	--enable-version-specific-runtime-libs \
	--with-mpc-include=$(DESTDIR)$(includedir) \
	--with-mpc-lib=$(DESTDIR)$(libdir) \
	--with-mpfr-include=$(DESTDIR)$(includedir) \
	--with-mpfr-lib=$(DESTDIR)$(libdir) \
	--with-gmp-include=$(DESTDIR)$(includedir) \
	--with-gmp-lib=$(DESTDIR)$(libdir) \
	--with-isl-include=$(DESTDIR)$(includedir) \
	--with-isl-lib=$(DESTDIR)$(libdir) \
	--with-cloog-include=$(DESTDIR)$(includedir) \
	--with-cloog-lib=$(DESTDIR)$(libdir) \
	--with-libelf-include=$(DESTDIR)$(includedir) \
	--with-libelf-lib=$(DESTDIR)$(libdir) \
	--with-sysroot=$($(CROSSIMG)_DESTDIR)

ifeq ("$(DESTIMG)+$(CROSSIMG)","build+build")
CONFIGURE_ARGS += \
	--with-lib-path="=$($(CROSSIMG)_elibdir):=$($(CROSSIMG)_libdir):/lib/$(GARBUILD):/usr/lib/$(GARBUILD):$(strip $(if $(filter i386,$(GARCH_FAMILY)),:/lib32:/usr/lib32:/lib:/usr/lib) $(if $(filter x86_64,$(GARCH_FAMILY)),:/lib64:/usr/lib64:/lib:/usr/lib))"
else
CONFIGURE_ARGS += \
	--with-lib-path="=$($(CROSSIMG)_elibdir):=$($(CROSSIMG)_libdir)"
endif

GAR_EXTRA_CONF += devel/gcc/package-api.mk
include ../../gar.mk

CPPFLAGS :=
CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=

post-install:
	@$(if $(filter $(GARHOST), $(GARTARGET)) , \
		rm -f $(DESTDIR)$(libdir)/libbfd.la , \
		rm -f $(DESTDIR)$(prefix)/$(GARHOST)/$(GARTARGET)/lib/libbfd.la \
	)
	@$(if $(filter $(GARHOST), $(GARTARGET)) , \
		rm -f $(DESTDIR)$(libdir)/libopcodes.la , \
		rm -f $(DESTDIR)$(prefix)/$(GARHOST)/$(GARTARGET)/lib/libopcodes.la \
	)
	@$(MAKECOOKIE)
