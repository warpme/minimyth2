
GARNAME      = monitorix
GARVERSION   = 3.14.0
CATEGORIES   = utils
MASTER_SITES = http://www.monitorix.org/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL2

DEPENDS = \
	perl/perl \
	perl/perl-CGI \
	perl/perl-XML-Simple \
	perl/perl-Config-Simple \
	perl/perl-Config-General \
	perl/perl-RRDtool-bindings \
	net/iptables \

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = 
INSTALL_SCRIPTS   = custom

include ../../gar.mk

install-custom:
	@$(MAKE) -C $(WORKSRC) DESTDIR="$(DESTDIR)" BASEDIR=/var/lib/monitorix WWWDIR=/usr/share/www/monitorix install-bin
	@$(MAKECOOKIE)
