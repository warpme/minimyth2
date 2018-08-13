GARNAME = mysql
GARVERSION = 5.6.40
CATEGORIES = db
MASTER_SITES = https://downloads.mysql.com/archives/get/file/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES  = 
#PATCHFILES += $(DISTNAME)-dash.patch
#PATCHFILES += $(DISTNAME)-perl.patch.gar
#PATCHFILES += $(DISTNAME)-mysql_config.patch.gar

#	$(DISTNAME)-skip_abi_check.patch \
#	$(DISTNAME)-ac_cache_check.patch \
#	$(DISTNAME)-automake_1.13.patch \
#ifneq ($(DESTIMG),build)
#DISTFILES += config.cache.$(GARCH_FAMILY)-
#PATCHFILES += $(DISTNAME)-cross.patch
#endif
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c lang/cxx lib/ncurses devel/zlib
BUILDDEPS  = utils/procps
#ifneq ($(DESTIMG),build)
#BUILDDEPS += db/mysql
#endif

#CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
#BUILD_SCRIPTS      = $(WORKSRC)/Makefile
#INSTALL_SCRIPTS    = $(WORKSRC)/Makefile
#ifeq ($(DESTIMG),build)
#INSTALL_SCRIPTS   += cross
#endif

#CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
#	--cache-file=config.cache \
#	--enable-shared \
#	--disable-static \
#	--enable-thread-safe-client \
#	--with-gnu-ld \
#	--without-debug \
#	--with-server \
#	--without-docs \
#	--without-man \

#GAR_EXTRA_CONF += devel/glibc/package-api.mk
#include ../../gar.mk

# Copied from <http://cvs.fedoraproject.org/viewvc/devel/mysql/mysql.spec?revision=1.130&view=markup>.
# MySQL 4.1.10 breaks with strict aliasing.
#CFLAGS   += -fno-strict-aliasing
#CXXFLAGS += -fno-strict-aliasing
# MySQL 5.0.16 breaks when compiled with gcc 4.1 without -fwrapv.
#CFLAGS   += -fwrapv
#CXXFLAGS += -fwrapv
# MySQL INSTALL-SOURCE recommends the following.
#CXXFLAGS += -felide-constructors -fno-exceptions -fno-rtti
# MySQL 5.1.67 breaks when compiled with gcc 7.3.0 without -fpermissive.
#CFLAGS   += -fpermissive
#CXXFLAGS += -fpermissive
# MySQL 5.1.67 breaks with -Wnarrowing when compiled with gcc 7.3.0.
#CFLAGS   += -Wno-narrowing
#CXXFLAGS += -Wno-narrowing

#extract-config.cache.$(GARCH_FAMILY):
#	@cp $(DOWNLOADDIR)/config.cache.$(GARCH_FAMILY) $(WORKSRC)/config.cache
#	@$(MAKECOOKIE)

#pre-configure:
#	@$(call RUN_AUTOTOOLS)
#	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
#	@$(MAKECOOKIE)

#install-cross:
#`	@if test -e $(WORKSRC)/extra/comp_err   ; then cp -f $(WORKSRC)/extra/comp_err   $(DESTDIR)$(bindir)/mysql-comp_err     ; fi
#	@if test -e $(WORKSRC)/sql/gen_lex_hash ; then cp -f $(WORKSRC)/sql/gen_lex_hash $(DESTDIR)$(bindir)/mysql-gen_lex_hash ; fi
#	@$(MAKECOOKIE)

WORKSRC = $(WORKDIR)/$(DISTNAME)
WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile


CONFIGURE_ARGS = \
	-DCMAKE_INSTALL_PREFIX="$(prefix)" \
	-DCMAKE_FIND_ROOT_PATH="$(DESTDIR)$(prefix)" \
	-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="NEVER" \
	-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="ONLY" \
	-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="ONLY" \
	-DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE="ONLY" \
	-DCMAKE_C_COMPILER="$(build_DESTDIR)$(build_bindir)/$(CC)" \
	-DCMAKE_CXX_COMPILER="$(build_DESTDIR)$(build_bindir)/$(CXX)" \
	-DCMAKE_AR="$(build_DESTDIR)$(build_bindir)/$(AR)" \
	-DCMAKE_LINKER="$(build_DESTDIR)$(build_bindir)/$(LD)" \
	-DCMAKE_NM="$(build_DESTDIR)$(build_bindir)/$(NM)" \
	-DCMAKE_OBJCOPY="$(build_DESTDIR)$(build_bindir)/$(OBJCOPY)" \
	-DCMAKE_OBJDUMP="$(build_DESTDIR)$(build_bindir)/$(OBJDUMP)" \
	-DCMAKE_RANLIB="$(build_DESTDIR)$(build_bindir)/$(RANLIB)" \
	-DCMAKE_STRIP="$(build_DESTDIR)$(build_bindir)/$(STRIP)" \
	-DCMAKE_VERBOSE_MAKEFILE="ON" \
	-DINSTALL_LAYOUT="STANDALONE" \
	-DWITH_UNIT_TESTS="OFF"

#	-DDOWNLOAD_BOOST="OFF" \
#	-DWITH_BOOST=system


#ifneq ($(DESTIMG),build)
#CONFIGURE_ARGS += -DLLVM_TABLEGEN="$(build_DESTDIR)$(build_bindir)/llvm-tblgen"
#endif

include ../../gar.mk

#EXTRA_OPTIONS    := $(CFLAGS)
#EXTRA_LD_OPTIONS := $(LDFLAGS)

#CFLAGS   := $(filter-out -flto, $(CFLAGS))
#CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
#LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

configure-%/cmake: 
	@#mv $(WORKDIR)/$(DISTNAME) $(WORKDIR)/$(DISTNAME)
	@echo " ==> Running configure in $*"
	@rm -rf $*
	@mkdir -p $*
	@cd $* && $(CONFIGURE_ENV) cmake $(CONFIGURE_ARGS) ../$(DISTNAME)
	@$(MAKECOOKIE)

post-install:
#	@$(call GLIBC_ADD_LIB_PATH, $(libdir)/mysql)
	@rm -f $(DESTDIR)$(libdir)/mysql/libmysqlclient.la
	@rm -f $(DESTDIR)$(libdir)/mysql/libmysqlclient_r.la
	@rm -f $(DESTDIR)$(libdir)/mysql/plugin/ha_archive.la
	@rm -f $(DESTDIR)$(libdir)/mysql/plugin/ha_blackhole.la
	@rm -f $(DESTDIR)$(libdir)/mysql/plugin/ha_example.la
	@rm -f $(DESTDIR)$(libdir)/mysql/plugin/ha_federated.la
	@rm -f $(DESTDIR)$(libdir)/mysql/plugin/ha_innodb.la
	@rm -f $(DESTDIR)$(libdir)/mysql/plugin/ha_innodb_plugin.la
	@rm -f $(DESTDIR)$(libdir)/mysql/libdbug.a
	@rm -f $(DESTDIR)$(libdir)/mysql/libheap.a
	@rm -f $(DESTDIR)$(libdir)/mysql/libmyisam.a
	@rm -f $(DESTDIR)$(libdir)/mysql/libmyisammrg.a
	@rm -f $(DESTDIR)$(libdir)/mysql/libmystrings.a
	@rm -f $(DESTDIR)$(libdir)/mysql/libmysys.a
	@rm -f $(DESTDIR)$(libdir)/mysql/libvio.a
	@rm -f $(DESTDIR)$(bindir)-config/mysql_config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)mysql_config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/mysql_config $(DESTDIR)$(bindir)-config/mysql_config
	@$(if $(compiler_prefix), ln -s mysql_config $(DESTDIR)$(bindir)-config/$(compiler_prefix)mysql_config)
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
	@rm -rf $(build_DESTDIR)$(build_prefix)/mysql-test
	@rm -rf $(build_DESTDIR)$(build_bindir)/mysql*
	@rm -rf $(build_DESTDIR)$(build_datadir)/mysql
	@rm -rf $(build_DESTDIR)$(build_includedir)/mysql
	@rm -rf $(build_DESTDIR)$(build_libdir)/mysql
	@rm -rf $(build_DESTDIR)$(build_mandir)/man1/mysql*
	@rm -rf $(DESTDIR)$(prefix)/mysql-test
	@rm -rf $(DESTDIR)$(bindir)/mysql*
	@rm -rf $(DESTDIR)$(datadir)/mysql
	@rm -rf $(DESTDIR)$(includedir)/mysql
	@rm -rf $(DESTDIR)$(libdir)/mysql
	@rm -rf $(DESTDIR)$(mandir)/man1/mysql*
