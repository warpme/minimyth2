
GARNAME      = fribidi
GARVERSION   = 1.0.10
CATEGORIES   = lib
MASTER_SITES = https://github.com/fribidi/fribidi/archive/
DISTFILES    = v$(GARVERSION).tar.gz
LICENSE      = LGPL2_1

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-debug \
	--disable-deprecated \
	--disable-malloc \
	--enable-charsets \
	--with-gnu-ld \
	--without-glib

include ../../gar.mk

ifeq ($(DESTIMG),build)
CPPFLAGS += -DFRIBIDI_CHUNK_SIZE=4080
endif

ifneq ($(DESTIMG),build)
LDFLAGS = 
endif

pre-configure:
	@# Disable building doc as is basically useless here
	@sed -i '/^SUBDIRS/s/doc//' $(WORKSRC)/Makefile.am
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-configure:
	@# hack to fix failed build due double pipe in nm commnds
	@sed -e 's%| \\$$global_symbol_pipe%\\$$global_symbol_pipe%g' -i $(WORKSRC)/libtool
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libfribidi.la
	@$(MAKECOOKIE)
