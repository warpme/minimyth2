
GARNAME    = mythplugins
GARVERSION = $(MYTHTV_GIT_HASH)
CATEGORIES = $(CATEGORY)
SOURCEPKG  = $(CATEGORY)/mythtv
LICENSE    = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	python3/python \
	python3/python-setuptools \

DEPENDS = \
	lang/cxx \
	$(CATEGORY)/mythtv \
	lib/libexif \
	lib/libtiff \
	lib/flac \
	lib/lame \
	lib/libcdaudio \
	lib/libcdio \
	lib/libcdio-paranoia \
	lib/libogg \
	lib/libvorbis \
	lib/SDL2 \
	lib/taglib \
	lib/libzip \
	python3/python \
	python3/python-aniso8601 \
	python3/python-beautifulsoup4 \
	python3/python-discid \
	python3/python-future \
	python3/python-lxml \
	python3/python-musicbrainzngs \
	python3/python-mysqlclient \
	python3/python-pycurl \
	python3/python-requests-cache \
	python3/python-oauth \
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
	db/mariadb

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

WORKSRC = $(WORKDIR)/mythtv-$(MYTHTV_GIT_HASH)

CONFIGURE_SCRIPTS = $(WORKSRC)/mythplugins/configure
BUILD_SCRIPTS     = $(WORKSRC)/mythplugins/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/mythplugins/Makefile

CONFIGURE_ARGS = \
	$(MYTHTV_PLUGINS_CONFIGURE_ARGS) \
	--enable-mythbrowser \
	--enable-mythgame \
	--enable-mythmusic \
		--enable-cdio \
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
