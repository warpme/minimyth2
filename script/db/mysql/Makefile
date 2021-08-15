GARNAME = mysql
GARVERSION = 5.1.67
CATEGORIES = db
MASTER_SITES = https://downloads.mysql.com/archives/get/p/23/file/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES  = \
	$(DISTNAME)-automake_1.13.patch \
	$(DISTNAME)-dash.patch \
	$(DISTNAME)-skip_abi_check.patch \
	$(DISTNAME)-ac_cache_check.patch \
	$(DISTNAME)-perl.patch.gar \
	$(DISTNAME)-mysql_config.patch.gar
ifneq ($(DESTIMG),build)
DISTFILES += config.cache.$(GARCH_FAMILY)-
PATCHFILES += $(DISTNAME)-cross.patch
endif
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c lang/cxx lib/ncurses devel/zlib
BUILDDEPS  = utils/procps
ifneq ($(DESTIMG),build)
BUILDDEPS += db/mysql
endif

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile
ifeq ($(DESTIMG),build)
INSTALL_SCRIPTS   += cross
endif

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--enable-shared \
	--disable-static \
	--enable-thread-safe-client \
	--with-gnu-ld \
	--without-debug \
	--with-server \
	--without-docs \
	--without-man \

GAR_EXTRA_CONF += devel/glibc/package-api.mk
include ../../gar.mk

# Copied from <http://cvs.fedoraproject.org/viewvc/devel/mysql/mysql.spec?revision=1.130&view=markup>.
# MySQL 4.1.10 breaks with strict aliasing.
CFLAGS   += -fno-strict-aliasing
CXXFLAGS += -fno-strict-aliasing
# MySQL 5.0.16 breaks when compiled with gcc 4.1 without -fwrapv.
CFLAGS   += -fwrapv
CXXFLAGS += -fwrapv
# MySQL INSTALL-SOURCE recommends the following.
CXXFLAGS += -felide-constructors -fno-exceptions -fno-rtti
# MySQL 5.1.67 breaks when compiled with gcc 7.3.0 without -fpermissive.
CFLAGS   += -fpermissive
CXXFLAGS += -fpermissive
# MySQL 5.1.67 breaks with -Wnarrowing when compiled with gcc 7.3.0.
CFLAGS   += -Wno-narrowing
CXXFLAGS += -Wno-narrowing

extract-config.cache.$(GARCH_FAMILY)-:
	@cp $(DOWNLOADDIR)/config.cache.$(GARCH_FAMILY)- $(WORKSRC)/config.cache
	@$(MAKECOOKIE)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)

install-cross:
	@if test -e $(WORKSRC)/extra/comp_err   ; then cp -f $(WORKSRC)/extra/comp_err   $(DESTDIR)$(bindir)/mysql-comp_err     ; fi
	@if test -e $(WORKSRC)/sql/gen_lex_hash ; then cp -f $(WORKSRC)/sql/gen_lex_hash $(DESTDIR)$(bindir)/mysql-gen_lex_hash ; fi
	@$(MAKECOOKIE)

post-install:
	@$(call GLIBC_ADD_LIB_PATH, $(libdir)/mysql)
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
	@# Turn-off LTO as it causes issues for some perl .so modules compilation (i.e. on ARM target in perl-DBD-mysql)
	@sed -e "s%-flto%%g" -i $(DESTDIR)$(bindir)-config/mysql_config
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
