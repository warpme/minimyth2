
GARNAME      = mysql
GARVERSION   = 8.0.26
CATEGORIES   = db
MASTER_SITES = https://cdn.mysql.com/Downloads/MySQL-8.0/
DISTFILES    = $(GARNAME)-boost-$(GARVERSION).tar.gz
PATCHFILES   = $(DISTNAME)-hack-libevent-detection-in-crosscompile.patch
LICENSE      = GPL

DEPENDS = lib/openssl devel/zlib lib/libaio net/libtirpc lib/icu lib/libevent devel/boost lib/libzstd lib/libedit lib/liblz4

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
    -DCMAKE_VERBOSE_MAKEFILE="OFF" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DSYSCONFDIR=/etc/mysql \
    -DMYSQL_DATADIR=/var/lib/mysql \
    -DMYSQL_UNIX_ADDR=/run/mysqld/mysqld.sock \
    -DENABLED_LOCAL_INFILE=ON \
    -DINSTALL_INFODIR=share/mysql/docs \
    -DINSTALL_MANDIR=share/man \
    -DINSTALL_PLUGINDIR=lib/mysql/plugin \
    -DINSTALL_INCLUDEDIR=include/mysql \
    -DINSTALL_DOCREADMEDIR=share/mysql \
    -DINSTALL_SUPPORTFILESDIR=share/mysql \
    -DINSTALL_MYSQLSHAREDIR=share/mysql \
    -DINSTALL_DOCDIR=share/mysql/docs \
    -DINSTALL_SHAREDIR=share/mysql \
    -DROUTER_INSTALL_CONFIGDIR=etc/mysqlrouter \
    -DROUTER_INSTALL_DATADIR=var/lib/mysqlrouter \
    -DROUTER_INSTALL_RUNTIMEDIR=run \
    -DROUTER_INSTALL_LOGDIR=var/log/mysqlrouter \
    -DWITH_SYSTEM_LIBS=ON \
    -DWITH_SSL=system \
    -DWITH_LIBWRAP=OFF \
    -DWITH_LTO=ON \
    -DWITH_JEMALLOC=OFF \
    -DWITH_SYSTEMD=no \
    -DWITH_PROTOBUF=bundled \
    -DWITH_UNIT_TESTS=OFF \
    -DWITH_ZSTD=system \
    -DWITHOUT_EXAMPLE_STORAGE_ENGINE=OFF \
    -DWITHOUT_FEDERATED_STORAGE_ENGINE=OFF \
    -DDEFAULT_CHARSET=utf8mb4 \
    -DDEFAULT_COLLATION=utf8mb4_unicode_ci \
    -DLOCAL_BOOST_DIR=/home/piotro/minimyth-dev/images/main/usr/lib/boost_1_73_0 \
    -DBOOST_INCLUDE_DIR=/home/piotro/minimyth-dev/images/main/usr/lib/boost_1_73_0/include \
    -DWITH_LIBEVENT=system \
    -DSTACK_DIRECTION=1 \
    -DCMAKE_CROSSCOMPILING=ON \
    -DHAVE_FALLOC_PUNCH_HOLE_AND_KEEP_SIZE=1 \
    -DHAVE_C_FLOATING_POINT_FUSED_MADD_EXITCODE=0 \
    -DHAVE_C_FLOATING_POINT_FUSED_MADD_EXITCODE__TRYRUN_OUTPUT="" \
    -DHAVE_CXX_FLOATING_POINT_FUSED_MADD_EXITCODE=0 \
    -DHAVE_CXX_FLOATING_POINT_FUSED_MADD_EXITCODE__TRYRUN_OUTPUT="" \
    -DHAVE_SETNS_EXITCODE=0 \
    -DHAVE_SETNS_EXITCODE__TRYRUN_OUTPUT="" \
    -DHAVE_CLOCK_GETTIME_EXITCODE=0 \
    -DHAVE_CLOCK_GETTIME_EXITCODE__TRYRUN_OUTPUT="" \
    -DHAVE_CLOCK_REALTIME_EXITCODE=0 \
    -DHAVE_CLOCK_REALTIME_EXITCODE__TRYRUN_OUTPUT="" \

include ../../gar.mk
