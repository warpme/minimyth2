GARNAME = db
GARVERSION = 6.1.26
CATEGORIES = db
MASTER_SITES = https://download.oracle.com/berkeley-db/
DISTFILES = $(DISTNAME).tar.gz
LICENSE =
WORKSRC = $(WORKDIR)/$(DISTNAME)/build_unix

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--prefix=/usr \
	--enable-shared \
	--disable-static \
	--with-gnu-ld

include ../../gar.mk

configure-custom:
	@cd $(WORKSRC); ../dist/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libdb-6.1.lai
	@rm -f $(DESTDIR)$(libdir)/libdb-6.1.la
	@# Hack required by python2.7 to successfuly build _bsddb module
	@ln -srf $(DESTDIR)$(libdir)/libdb-6.1.so $(DESTDIR)$(libdir)/libdb-5.3.so
	@$(MAKECOOKIE)
