
GARNAME       = alsa-lib
GARVERSION    = 1.2.4
CATEGORIES    = lib
MASTER_SITES  = ftp://ftp.alsa-project.org/pub/lib/
MASTER_SITES += ftp://ftp.alsa-project.org/pub/testing/
# amlogic patches https://github.com/chewitt/alsa-lib/commits/amlogic
PATCHFILES    = $(DISTNAME)-add-Amlogic-cards.patch
PATCHFILES   += $(DISTNAME)-add-rpi4-support.patch
PATCHFILES   += $(DISTNAME)-missing_files.patch
PATCHFILES   += $(DISTNAME)-pcm-iec958-amlogic-dw-hdmi-changes.patch
DISTFILES     = $(DISTNAME).tar.bz2
LICENSE       = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--enable-symbolic-functions \
	--disable-debug-assert \
	--enable-aload \
	--disable-resmgr \
	--enable-mixer \
	--enable-pcm \
	--enable-rawmidi \
	--enable-hwdep \
	--enable-seq \
	--enable-alisp \
	--disable-old-symbols \
	--disable-python \
	--with-gnu-ld \
	--with-versioned \
	--without-debug \
	--with-tmpdir="$(rootdir)/tmp" \
	--with-alsa-devdir="$(rootdir)/dev/snd" \
	--with-aload-devdir="$(rootdir)/dev" \
	--disable-alsaconf

include ../../gar.mk

# alsa-lib 1.1.1 fails to compile with gcc 5.3.0's link time optimization enabled.
CFLAGS  := $(filter-out -flto, $(CFLAGS))
LDFLAGS := $(filter-out -flto, $(LDFLAGS))

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libasound.la
	@rm -f $(DESTDIR)$(libdir)/libatopology.la
	@rm -f $(DESTDIR)$(libdir)/alsa-lib/smixer/smixer-sbase.la
	@rm -f $(DESTDIR)$(libdir)/alsa-lib/smixer/smixer-ac97.la
	@rm -f $(DESTDIR)$(libdir)/alsa-lib/smixer/smixer-hda.la
	@$(MAKECOOKIE)
