
GARNAME      = inetutils
GARVERSION   = 2.2
CATEGORIES   = net
MASTER_SITES = https://ftp.gnu.org/gnu/inetutils/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL2

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \
	--with-pam \
	--disable-ftp \
	--disable-ftpd \
	--disable-telnet \
	--disable-telnetd \
	--disable-talk \
	--disable-talkd \
	--disable-rlogin \
	--disable-rlogind \
	--disable-rsh \
	--disable-rshd \
	--disable-rcp \
	--enable-hostname \
	--enable-dnsdomainname \
	--disable-rexec \
	--disable-rexecd \
	--disable-tftp \
	--disable-tftpd \
	--disable-ping \
	--disable-ping6 \
	--disable-logger \
	--disable-syslogd \
	--disable-inetd \
	--disable-whois \
	--disable-uucpd \
	--disable-ifconfig \
	--disable-traceroute \

include ../../gar.mk
