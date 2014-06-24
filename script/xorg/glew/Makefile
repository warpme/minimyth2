GARNAME = glew
GARVERSION = 1.9.0
CATEGORIES = $(CATEGORY)
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/$(GARNAME)/$(GARVERSION)/
DISTFILES = $(DISTNAME).tgz
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.txt

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	$(CATEGORY)/glu \
	$(CATEGORY)/libX11 \
	$(CATEGORY)/libXi \
	$(CATEGORY)/libXmu \
	$(CATEGORY)/libXext \
	$(CATEGORY)/Mesa

PWD := $(shell pwd)
CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

BUILD_ARGS  = \
	GLEW_DEST="$(prefix)" \
	BINDIR="$(bindir)" \
	LIBDIR="$(libdir)" \
	INCDIR="$(includedir)/GL" \
	CC="$(CC)" \
	LD="$(CC)" \
	AR="$(AR)" \
	POPT="$(CFLAGS)" \
	LDFLAGS.EXTRA="$(LDFLAGS)"
INSTALL_ARGS = \
	GLEW_DEST="$(DESTDIR)$(prefix)" \
	BINDIR="$(DESTDIR)$(bindir)" \
	LIBDIR="$(DESTDIR)$(libdir)" \
	INCDIR="$(DESTDIR)$(includedir)/GL"

include ../../gar.mk

CFLAGS  := $(CFLAGS)  -fPIC
LDFLAGS := $(LDFLAGS) -fPIC

post-install:
	@rm -f $(DESTDIR)$(libdir)/libGLEW.a
	@$(MAKECOOKIE)
