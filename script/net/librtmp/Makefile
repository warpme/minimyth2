GARNAME = rtmpdump
GARVERSION_TYPE = git
GARVERSION = $(strip $(if $(filter git,$(GARVERSION_TYPE)) , \
             master-fa8646d, \
             2.3 ))
CATEGORIES = net
MASTER_SITES = $(strip $(if $(filter git,$(GARVERSION_TYPE)) , \
             git://git.ffmpeg.org/rtmpdump.git/ , \
             http://rtmpdump.mplayerhq.hu/download/ ))
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/openssl devel/zlib

BUILD_SCRIPTS   = $(WORKSRC)/librtmp/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/librtmp/Makefile

BUILD_ARGS   = \
	DESTDIR=$(DESTDIR) \
	prefix=$(prefix) \
	incdir=$(includedir)/librtmp \
	bindir=$(bindir) \
	libdir=$(libdir) \
	mandir=$(mandir) \
	CC="$(CC)" \
	LD="$(LD)" \
	AR="$(AR)" \
	CRYPTO="OPENSSL" \
	XCFLAGS="$(CFLAGS) $(LDFLAGS)"
INSTALL_ARGS = \
	DESTDIR=$(DESTDIR) \
	prefix=$(prefix) \
	incdir=$(includedir)/librtmp \
	bindir=$(bindir) \
	libdir=$(libdir) \
	mandir=$(mandir) \
	CC="$(CC)" \
	LD="$(LD)" \
	AR="$(AR)" \
	CRYPTO="OPENSSL" \
	XCFLAGS="$(CFLAGS) $(LDFLAGS)"

include ../../gar.mk

CFLAGS  := $(CFLAGS)  -fPIC
LDFLAGS := $(LDFLAGS) -fPIC

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/librtmp.a
	@$(MAKECOOKIE)
