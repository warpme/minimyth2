GARNAME = binutils
GARVERSION = $(BINUTILS_VERSION)
CATEGORIES = devel
MASTER_SITES  = http://ftp.gnu.org/gnu/$(GARNAME)/
MASTER_SITES += ftp://ftp.kernel.org/pub/linux/devel/$(GARNAME)/
MASTER_SITES += ftp://sourceware.org/pub/$(GARNAME)/snapshots/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES  = $(DISTNAME)-multi_os_directory.patch
ifneq ("$(DESTIMG)+$(CROSSIMG)","build+build")
PATCHFILES += $(DISTNAME)-perl.patch.gar
endif
LICENSE = GPL2/LGPL2

DESCRIPTION =
define BLURB
endef

CROSSIMG ?= $(DESTIMG)
GARTARGET = $($(CROSSIMG)_GARHOST)

DEPENDS  = lang/c devel/cloog devel/gmp devel/libelf devel/mpc devel/mpfr devel/ppl
BUILDDEPS = devel-tainted/devel-tainted devel/make

WORKDIR   = $(WORKROOTDIR)/$(DESTIMG)_$(CROSSIMG).d
COOKIEDIR = $(COOKIEROOTDIR)/$(DESTIMG)_$(CROSSIMG).d

WORKSRC = $(WORKDIR)/$(patsubst %a,%,$(DISTNAME))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

# Disable PPL version check as the PPL major version number has been bumped so the check fails.
CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --target=$(GARTARGET) \
	--enable-plugins \
	--disable-gold \
	--enable-ld \
	--disable-libada \
	--disable-libssp \
	--disable-ppl-version-check \
	--enable-cloog-backend=isl \
	--enable-lto \
	--disable-werror \
	--disable-multilib \
	--enable-nls \
	--enable-version-specific-runtime-libs \
	--with-mpc-include=$(DESTDIR)$(includedir) \
	--with-mpc-lib=$(DESTDIR)$(libdir) \
	--with-mpfr-include=$(DESTDIR)$(includedir) \
	--with-mpfr-lib=$(DESTDIR)$(libdir) \
	--with-gmp-include=$(DESTDIR)$(includedir) \
	--with-gmp-lib=$(DESTDIR)$(libdir) \
	--with-ppl-include=$(DESTDIR)$(includedir) \
	--with-ppl-lib=$(DESTDIR)$(libdir) \
	--with-cloog-include=$(DESTDIR)$(includedir) \
	--with-cloog-lib=$(DESTDIR)$(libdir) \
	--with-libelf-include=$(DESTDIR)$(includedir) \
	--with-libelf-lib=$(DESTDIR)$(libdir) \
	--with-sysroot=$($(CROSSIMG)_DESTDIR)
# I do not know what '=' does at the beginning of the path name. However, the correct libraries are not found without it.
# For the native environment, glibc is not installed, so the native environment needs to pick up glibc from the system.
# Libraries are located in /lib and /usr/lib. On some systems (e.g. Ubuntu 11.04), some libraries (e.g. libc.so) are
# located in /lib/$(GARBUILD) and /usr/lib/$(GARBUILD). On some systems, i386 libraries are located in /lib32 and /usr/lib32,
# and on some systems x86_64 libraries are located in /lib64 and /usr/lib64.
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
