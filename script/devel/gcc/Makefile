
GARNAME       = gcc
GARVERSION    = $(GCC_VERSION)
CATEGORIES    = devel
MASTER_SITES  = https://ftp.gnu.org/gnu/$(GARNAME)/$(DISTNAME)/
MASTER_SITES += ftp://gcc.gnu.org/pub/$(GARNAME)/releases/$(DISTNAME)/
MASTER_SITES += ftp://gcc.gnu.org/pub/$(GARNAME)/prerelease-$(GCC_VERSION)/
MASTER_SITES += ftp://gcc.gnu.org/pub/$(GARNAME)/snapshots/$(GCC_VERSION)/
DISTFILES     = $(DISTNAME).tar.xz
PATCHFILES    = $(DISTNAME)-disable_multilib_i386_linux64.patch
ifneq ("$(DESTIMG)+$(CROSSIMG)","build+build")
PATCHFILES   += $(DISTNAME)-perl.patch.gar
PATCHFILES   += $(DISTNAME)-libstdc++-v3-force_sdt.h-detect-to-no.patch
endif
LICENSE       = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION =
define BLURB
endef

CROSSIMG ?= $(DESTIMG)
GARTARGET = $($(CROSSIMG)_GARHOST)

IMGDEPS += $(CROSSIMG)
$(CROSSIMG)_DEPENDS = devel/glibc
DEPENDS   = lang/c devel/gmp devel/isl devel/libelf devel/mpc devel/mpfr
BUILDDEPS = devel/make devel/binutils
ifneq ("$(DESTIMG)+$(CROSSIMG)","build+build")
DEPENDS  +=  lib/libxcrypt
endif

WORKDIR   = $(WORKROOTDIR)/$(DESTIMG)_$(CROSSIMG).d
COOKIEDIR = $(COOKIEROOTDIR)/$(DESTIMG)_$(CROSSIMG).d

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --target=$(GARTARGET) \
	--with-gnu-as \
	--with-gnu-ld \
	--with-local-prefix=$(patsubst %/include,%,$($(CROSSIMG)_includedir)) \
	--enable-silent-rules \
	--enable-plugin \
	--enable-__cxa_atexit \
	--enable-clocale=gnu \
	--enable-languages=c,c++ \
	--enable-libatommic \
	--enable-libgomp \
	--enable-gold \
	--enable-ld \
	--disable-libquadmath \
	--disable-libquadmath-support \
	--disable-libada \
	--disable-libssp \
	--enable-lto \
	--disable-multilib \
	--enable-nls \
	--enable-decimal-float \
	--enable-shared \
	--enable-host-shared \
	--enable-threads=posix \
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

GAR_EXTRA_CONF += devel/glibc/package-api.mk
include ../../gar.mk

CPPFLAGS :=
CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=

configure-custom:
	@mkdir -p $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)


post-install:
	@rm -f $(DESTDIR)$(libdir)/libcc1.la
	@rm -f $(CROSS_GCC_LIBDIR)/libasan.la
	@rm -f $(CROSS_GCC_LIBDIR)/libatomic.la
	@rm -f $(CROSS_GCC_LIBDIR)/libcilkrts.la
	@rm -f $(CROSS_GCC_LIBDIR)/libgomp.la
	@rm -f $(CROSS_GCC_LIBDIR)/libgomp-plugin-host_nonshm.la
	@rm -f $(CROSS_GCC_LIBDIR)/libitm.la
	@rm -f $(CROSS_GCC_LIBDIR)/liblsan.la
	@rm -f $(CROSS_GCC_LIBDIR)/libmpx.la
	@rm -f $(CROSS_GCC_LIBDIR)/libmpxwrappers.la
	@rm -f $(CROSS_GCC_LIBDIR)/libssp.la
	@rm -f $(CROSS_GCC_LIBDIR)/libssp_nonshared.la
	@rm -f $(CROSS_GCC_LIBDIR)/libstdc++.la
	@rm -f $(CROSS_GCC_LIBDIR)/libstdc++fs.la
	@rm -f $(CROSS_GCC_LIBDIR)/libsupc++.la
	@rm -f $(CROSS_GCC_LIBDIR)/libtsan.la
	@rm -f $(CROSS_GCC_LIBDIR)/libubsan.la
	@rm -f $(CROSS_GCC_LIBDIR)/libvtv.la
	@rm -f $(CROSS_GCC_LIBDIR)/plugin/libcc1plugin.la
	@rm -f $(CROSS_GCC_LIBEXECDIR)/liblto_plugin.la
	@# Native compile.
	@$(if $(filter     $(DESTIMG),$(CROSSIMG)), \
		ln -sf gcc $(DESTDIR)$(bindir)/cc ; \
		$(if $(wildcard $(DESTDIR)$(bindir)/gcc-ar    ),ln -sf gcc-ar     $(DESTDIR)$(bindir)/ar    ) ; \
		$(if $(wildcard $(DESTDIR)$(bindir)/gcc-nm    ),ln -sf gcc-nm     $(DESTDIR)$(bindir)/nm    ) ; \
		$(if $(wildcard $(DESTDIR)$(bindir)/gcc-ranlib),ln -sf gcc-ranlib $(DESTDIR)$(bindir)/ranlib) ; \
		$(if $(wildcard $(DESTDIR)$(bindir)/$(GARTARGET)-gcc-ar    ),ln -sf $(GARTARGET)-gcc-ar     $(DESTDIR)$(bindir)/$(GARTARGET)-ar    ) ; \
		$(if $(wildcard $(DESTDIR)$(bindir)/$(GARTARGET)-gcc-nm    ),ln -sf $(GARTARGET)-gcc-nm     $(DESTDIR)$(bindir)/$(GARTARGET)-nm    ) ; \
		$(if $(wildcard $(DESTDIR)$(bindir)/$(GARTARGET)-gcc-ranlib),ln -sf $(GARTARGET)-gcc-ranlib $(DESTDIR)$(bindir)/$(GARTARGET)-ranlib) ; \
	)
	@# Cross compile.
	@# Test install with: make install DESTIMG=build CROSSIMG=main
	@$(if $(filter-out $(DESTIMG),$(CROSSIMG)), \
		mkdir -p $(DESTDIR)$(prefix)/$(GARHOST)/bin ; \
		cp $(DESTDIR)$(bindir)/$(GARTARGET)-cpp $(DESTDIR)$(prefix)/$(GARTARGET)/bin/cpp ; \
		cp $(DESTDIR)$(bindir)/$(GARTARGET)-gcc $(DESTDIR)$(prefix)/$(GARTARGET)/bin/cc ; \
		$(if $(wildcard $(DESTDIR)$(bindir)/$(GARTARGET)-gcc-ar    ),ln -sf $(GARTARGET)-gcc-ar     $(DESTDIR)$(bindir)/$(GARTARGET)-ar    ) ; \
		$(if $(wildcard $(DESTDIR)$(bindir)/$(GARTARGET)-gcc-nm    ),ln -sf $(GARTARGET)-gcc-nm     $(DESTDIR)$(bindir)/$(GARTARGET)-nm    ) ; \
		$(if $(wildcard $(DESTDIR)$(bindir)/$(GARTARGET)-gcc-ranlib),ln -sf $(GARTARGET)-gcc-ranlib $(DESTDIR)$(bindir)/$(GARTARGET)-ranlib) ; \
		cp -af $(CROSS_GCC_LIBDIR)/libgomp.so* $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir)/ ; \
		cp -af $(CROSS_GCC_LIBDIR)/libatomic.so* $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir)/ ; \
	)
	@mkdir -p $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir)
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc.a         ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_s.so      ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_s.so.*    ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_DIR)/lib32/libgcc.a      ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_DIR)/lib32/libgcc_s.so   ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_DIR)/lib32/libgcc_s.so.* ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_DIR)/lib64/libgcc.a      ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_DIR)/lib64/libgcc_s.so   ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_DIR)/lib64/libgcc_s.so.* ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libstdc++.a      ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libstdc++.so     ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libstdc++.so.*   ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_DIR)/lib32/libstdc++.a   ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_DIR)/lib32/libstdc++.so  ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_DIR)/lib32/libstdc++.so.*),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_DIR)/lib64/libstdc++.a   ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_DIR)/lib64/libstdc++.so  ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_DIR)/lib64/libstdc++.so.*),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(MAKECOOKIE)
