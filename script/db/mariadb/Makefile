
GARNAME      = mariadb
GARVERSION   = 11.4.3
CATEGORIES   = db
MASTER_SITES = https://rsync.osuosl.org/pub/mariadb/mariadb-$(GARVERSION)/source/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = fix_fompile_without_server_feature.patch
LICENSE      = GPL

DEPENDS = \
	devel/zlib  \
	devel/boost \
	devel/zlib  \
	utils/bzip2 \
	lib/libxml2 \
	lib/lzo     \
	lib/openssl \
	lib/libaio  \
	lib/libzstd \
	lib/liblz4  \
	net/curl    \

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = custom native_mariadb_config
INSTALL_SCRIPTS   = custom native_mariadb_config

CONFIGURE_ARGS = $(DIRPATHS_CMAKE) \
    -DCMAKE_SYSTEM_NAME="Linux" \
    -DCMAKE_CROSSCOMPILING=on \
    -DCMAKE_SYSROOT="$(DESTDIR)" \
    -DCMAKE_VERBOSE_MAKEFILE=off \
    -DINSTALL_SYSCONFDIR=/etc \
    -DINSTALL_SYSCONF2DIR=/etc/my.cnf.d \
    -DINSTALL_UNIX_ADDRDIR=/run/mysqld/mysqld.sock \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINSTALL_SCRIPTDIR=bin \
    -DINSTALL_INCLUDEDIR=include/mysql \
    -DINSTALL_PLUGINDIR=lib/mysql/plugin \
    -DINSTALL_SYSTEMD_UNITDIR=/usr/lib/systemd/system/ \
    -DINSTALL_SYSTEMD_SYSUSERSDIR=/usr/lib/sysusers.d/ \
    -DINSTALL_SYSTEMD_TMPFILESDIR=/usr/lib/tmpfiles.d/ \
    -DINSTALL_SHAREDIR=share \
    -DINSTALL_SUPPORTFILESDIR=share/mysql \
    -DINSTALL_MYSQLSHAREDIR=share/mysql \
    -DINSTALL_DOCREADMEDIR=share/doc/mariadb \
    -DINSTALL_DOCDIR=share/doc/mariadb \
    -DINSTALL_MANDIR=share/man \
    -DMYSQL_DATADIR=/var/lib/mysql \
    -DINSTALL_SQLBENCHDIR=share/mysql/bench \
    -DINSTALL_SUPPORTFILESDIR=share/mysql \
    -DWITH_READLINE=on \
    -DWITH_UNIT_TESTS=off \
    -DSTACK_DIRECTION=-1 \
    -DWITH_JEMALLOC=off \
    -DWITH_LIBWRAP=off \
    -DWITHOUT_TOKUDB=on \
    -DWITHOUT_ROCKSDB=on \
    -DENABLE_DTRACE=off \
    -DWITH_EMBEDDED_SERVER=off \
    -DWITHOUT_SERVER=on \
    -DWITH_SSL=system \
    -DWITH_SYSTEMD=no \
    -DIMPORT_EXECUTABLES=../host/import_executables.cmake \
    -Wno-dev \

include ../../gar.mk

pre-configure:
	@#hack to build host tools on Fedora40
	@mkdir -p $(WORKSRC)/sql/bits
	@$(if $(wildcard /usr/include/bits/math-vector.h), ln -sf /usr/include/bits/math-vector.h $(WORKSRC)/sql/bits/ )
	@$(if $(wildcard $(DESTDIR)$(includedir)/math-x.h), ln -sf $(DESTDIR)$(includedir)/math-x.h $(DESTDIR)$(includedir)/math.h )

	@mkdir -p $(WORKSRC)/host && cd $(WORKSRC)/host && $(CMAKE) .. && $(MAKE) import_executables
	@$(MAKECOOKIE)

configure-custom:
	@mkdir -p $(WORKSRC)/target && cd $(WORKSRC)/target && $(CMAKE) .. $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC)/target && $(MAKE) $(PARALLELMFLAGS)
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC)/target && $(MAKE) DESTDIR=$(DESTDIR) install
	@$(MAKECOOKIE)

build-native_mariadb_config:
	@cd $(WORKSRC)/target/libmariadb && $(build_CC) $(build_CFLAGS) -I./include -o ./mariadb_config/mariadb_config.native ./mariadb_config/mariadb_config.c
	@$(MAKECOOKIE)

install-native_mariadb_config:
	@cd $(WORKSRC)/target/libmariadb && cp ./mariadb_config/mariadb_config.native $(DESTDIR)$(bindir)/mysql_config.native
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(bindir)-config/mysql_config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)mysql_config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/mysql_config.native $(DESTDIR)$(bindir)-config/mysql_config
	@$(if $(compiler_prefix), ln -s mysql_config $(DESTDIR)$(bindir)-config/$(compiler_prefix)mysql_config)
	@rm -f $(build_DESTDIR)$(bindir)-config/mysql_config
	@# hack needed for building mysql dependent packages for BUILD target when they require myslq_config
	@ln -srf $(DESTDIR)$(bindir)-config/mysql_config $(build_rootdir)$(bindir)-config/mysql_config
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(bindir)/mariadb*
	@rm -rf $(DESTDIR)$(bindir)/mysql*
	@rm -rf $(DESTDIR)$(bindir)/msql2mysql
	@rm -rf $(DESTDIR)$(bindir)/wsrep_sst_mysqldump
	@rm -rf $(DESTDIR)$(bindir)/wsrep_sst_mariabackup
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libmariadb.pc
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/mariadb.pc
	@rm -rf $(DESTDIR)$(libdir)/mysql*
	@rm -rf $(DESTDIR)$(libdir)/libmysql*
	@rm -rf $(DESTDIR)$(libdir)/libmariadb*
	@rm -rf $(DESTDIR)$(datadir)/mysql*
	@rm -rf $(DESTDIR)$(datadir)/aclocal/mysql.m4
	@rm -rf $(DESTDIR)$(prefix)/bin-config/*mysql_config
	@rm -rf $(DESTDIR)$(prefix)/mysql-test*
	@rm -rf $(DESTDIR)$(includedir)/mysql*
