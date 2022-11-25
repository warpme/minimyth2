
GARNAME      = nfs-utils
GARVERSION   = 2.5.4
CATEGORIES   = net
MASTER_SITES = http://downloads.sourceforge.net/project/nfs/$(GARNAME)/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = devel/rpcsvc-proto
DEPENDS = lang/c net/libtirpc utils/util-linux

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--disable-nfsv4 \
	--disable-nfsv41 \
	--disable-gss \
	--disable-svcgss \
	--disable-kprefix \
	--enable-uuid \
	--enable-mount \
	--enable-libmount-mount \
	--enable-tirpc \
	--disable-ipv6 \
	--disable-mountconfig \
	--disable-nfsdcltrack \
	--disable-caps \
	--enable-largefile \
	--enable-shared \
	--disable-static \
	--with-rpcgen=$(build_DESTDIR)$(build_bindir)/rpcgen \
	--with-tirpcinclude=$(DESTDIR)$(includedir)/tirpc \
	--without-tcp-wrappers \
	--with-gnu-ld \
	--without-krb5
CONFIGURE_ENV = \
	libblkid_cv_is_recent="yes"

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
