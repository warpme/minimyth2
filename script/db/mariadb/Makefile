
GARNAME      = mariadb
GARVERSION   = 10.6.4
CATEGORIES   = db
MASTER_SITES = https://rsync.osuosl.org/pub/mariadb/mariadb-$(GARVERSION)/source/
DISTFILES    = $(DISTNAME).tar.gz
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
    -DCMAKE_SYSROOT="$(DESTDIR)" \
    -DCMAKE_VERBOSE_MAKEFILE="OFF" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -Wno-dev \
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
    -DDEFAULT_CHARSET=utf8mb4 \
    -DDEFAULT_COLLATION=utf8mb4_unicode_ci \
    -DENABLED_LOCAL_INFILE=ON \
    -DPLUGIN_EXAMPLE=NO \
    -DPLUGIN_FEDERATED=NO \
    -DPLUGIN_FEEDBACK=NO \
    -DWITH_EMBEDDED_SERVER=ON \
    -DWITH_EXTRA_CHARSETS=complex \
    -DWITH_JEMALLOC=OFF \
    -DWITH_LIBWRAP=OFF \
    -DWITH_PCRE=bundled \
    -DWITH_READLINE=ON \
    -DWITH_SSL=system \
    -DWITH_SYSTEMD=no \
    -DWITH_UNIT_TESTS=OFF \
    -DWITH_ZLIB=system \
    -DSTACK_DIRECTION=1 \
    -DIMPORT_EXECUTABLES=../host/import_executables.cmake \

include ../../gar.mk

pre-configure:
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
