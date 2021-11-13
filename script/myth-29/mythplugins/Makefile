
GARNAME    = mythplugins
GARVERSION = $(MYTHTV_VERSION)
CATEGORIES = $(CATEGORY)
SOURCEPKG  = $(CATEGORY)/mythtv
LICENSE    = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	lang/cxx \
	$(CATEGORY)/mythtv \
	lib/libexif \
	lib/libtiff \
	lib/flac \
	lib/fftw3 \
	lib/fftw3f \
	lib/lame \
	lib/libcdaudio \
	lib/libcdio \
	lib/libcdio-paranoia \
	lib/libogg \
	lib/libvorbis \
	lib/SDL \
	lib/taglib \
	python2/python \
	python2/python-pycurl \
	python2/python-lxml \
	python2/python-oauth \
	perl/perl-Date-Manip \
	perl/perl-DateTime-Format-ISO8601 \
	perl/perl-Image-Size \
	perl/perl-JSON \
	perl/perl-SOAP-Lite \
	perl/perl-XML-Simple \
	perl/perl-XML-XPath \
	db/mysql

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

WORKSRC = $(WORKDIR)/mythtv-$(MYTHTV_VERSION)

CONFIGURE_SCRIPTS = $(WORKSRC)/mythplugins/configure
BUILD_SCRIPTS     = $(WORKSRC)/mythplugins/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/mythplugins/Makefile

CONFIGURE_ARGS = \
	$(MYTHTV_PLUGINS_CONFIGURE_ARGS) \
	--enable-mythbrowser \
	--disable-mythgallery \
		--enable-exif \
		--enable-new-exif \
	--enable-mythgame \
	--enable-mythmusic \
		--enable-cdio \
		--enable-fftw \
	--enable-mythnetvision \
	--enable-mythnews \
	--enable-mythweather \
	--enable-mythzoneminder

CONFIGURE_ENV = $(MYTHTV_CONFIGURE_ENV) $(PERL_CONFIGURE_ENV) PYTHONXCPREFIX=$(DESTDIR)$(prefix)
BUILD_ENV     = $(MYTHTV_BUILD_ENV)     $(PERL_BUILD_ENV)
INSTALL_ENV   = $(MYTHTV_INSTALL_ENV)   $(PERL_INSTALL_ENV)

GAR_EXTRA_CONF += $(CATEGORY)/mythtv/package-api.mk perl/perl/package-api.mk
include ../../gar.mk

post-install: post-install-mythtv-version
	@$(MAKECOOKIE)
