GARNAME      = rtmpdump
GARVERSION   = a486d9053127c3a33f71e7aa1bbcbd68a78e1e3f
CATEGORIES   = net
MASTER_SITES = https://git.ffmpeg.org/gitweb/rtmpdump.git/snapshot/
DISTFILES    = $(GARVERSION).tar.gz
WORKSRC      = $(WORKDIR)/rtmpdump-a486d90

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

# don't compiles with gcc9.3.0 LTO
CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/librtmp.a
	@$(MAKECOOKIE)
