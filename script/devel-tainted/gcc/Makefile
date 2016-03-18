GARNAME = gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = devel-tainted
SOURCEPKG = devel/gcc
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION =
define BLURB
endef

CROSSIMG ?= $(DESTIMG)
GARTARGET = $($(CROSSIMG)_GARHOST)

ifneq ("$(DESTIMG)+$(CROSSIMG)","build+build")
endif

DEPENDS   = devel-tainted/binutils devel-tainted/gmp devel-tainted/mpc devel-tainted/mpfr
BUILDDEPS = devel-tainted/make

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
	--enable-plugin \
	--enable-__cxa_atexit \
	--enable-clocale=gnu \
	--enable-languages=c,c++ \
	--disable-decimal-float \
	--enable-libatomic \
	--disable-libgomp \
	--disable-libquadmath \
	--disable-libquadmath-support \
	--disable-libada \
	--disable-libssp \
	--disable-multilib \
	--disable-nls \
	--enable-shared \
	--enable-host-shared \
	--enable-threads=no \
	--enable-version-specific-runtime-libs \
	--with-mpc-include=$(DESTDIR)$(includedir) \
	--with-mpc-lib=$(DESTDIR)$(libdir) \
	--with-mpfr-include=$(DESTDIR)$(includedir) \
	--with-mpfr-lib=$(DESTDIR)$(libdir) \
	--with-gmp-include=$(DESTDIR)$(includedir) \
	--with-gmp-lib=$(DESTDIR)$(libdir) \
	--without-isl \
	--without-libelf \
	--with-sysroot=$($(CROSSIMG)_DESTDIR)

GAR_EXTRA_CONF += devel/gcc/package-api.mk
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
	@rm -f $(CROSS_GCC_LIBDIR)/libitm.la
	@rm -f $(CROSS_GCC_LIBDIR)/libstdc++.la
	@rm -f $(CROSS_GCC_LIBDIR)/libsupc++.la
	@ln -sf gcc $(DESTDIR)$(bindir)/cc
	@mkdir -p $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir)
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc.a        ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_s.so     ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_s.so.*   ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_DIR)/lib32/libgcc.a     ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_DIR)/lib32/libgcc_s.so  ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_DIR)/lib32/libgcc_s.so.*),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_DIR)/lib64/libgcc.a     ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_DIR)/lib64/libgcc_s.so  ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_DIR)/lib64/libgcc_s.so.*),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@mkdir -p $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir)
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
