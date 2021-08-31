
GARNAME    = mythplugins
GARVERSION = $(MYTHTV_GIT_HASH)
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
	lib/libzip \
	python/python \
	python/python-aniso8601 \
	python/python-beautifulsoup4 \
	python/python-discid \
	python/python-future \
	python/python-lxml \
	python/python-musicbrainzngs \
	python/python-MySQL-python \
	python/python-pycurl \
	python/python-requests-cache \
	python/python-oauth \
	perl/perl-Date-Calc \
	perl/perl-Date-Manip \
	perl/perl-DateTime-Format-ISO8601 \
	perl/perl-Image-Size \
	perl/perl-JSON \
	perl/perl-PerlMagick \
	perl/perl-SOAP-Lite \
	perl/perl-TimeDate \
	perl/perl-XML-Simple \
	perl/perl-XML-TreeBuilder \
	perl/perl-XML-XPath \
	db/mysql

BUILDDEPS = \
	python/python \
	python/python-pycurl \
	python/python-lxml \
	python/python-oauth \
	perl/perl-DateTime \
	perl/perl-SOAP-Lite \
	perl/perl-DateTime-Format-ISO8601 \

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

WORKSRC = $(WORKDIR)/mythtv-$(MYTHTV_VERSION)

CONFIGURE_SCRIPTS = $(WORKSRC)/mythplugins/configure
BUILD_SCRIPTS     = $(WORKSRC)/mythplugins/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/mythplugins/Makefile

CONFIGURE_ARGS = \
	$(MYTHTV_PLUGINS_CONFIGURE_ARGS) \
	--enable-mythbrowser \
	--enable-mythgame \
	--enable-mythmusic \
		--enable-cdio \
		--enable-fftw \
	--enable-mythnetvision \
	--enable-mythnews \
	--enable-mythweather \
	--enable-mythzoneminder \

CONFIGURE_ENV = $(MYTHTV_CONFIGURE_ENV) $(PERL_CONFIGURE_ENV) PYTHONXCPREFIX=$(DESTDIR)$(prefix)
BUILD_ENV     = $(MYTHTV_BUILD_ENV)     $(PERL_BUILD_ENV)
INSTALL_ENV   = $(MYTHTV_INSTALL_ENV)   $(PERL_INSTALL_ENV)

GAR_EXTRA_CONF += $(CATEGORY)/mythtv/package-api.mk perl/perl/package-api.mk
include ../../gar.mk

post-install: post-install-mythtv-version
	@$(MAKECOOKIE)
