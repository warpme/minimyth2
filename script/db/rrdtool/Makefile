
GARNAME      = rrdtool
# if you are changing ver. here - update also ver in perl/perl-RRDtool-bindings
GARVERSION   = 1.8.0
CATEGORIES   = db
MASTER_SITES = https://github.com/oetiker/rrdtool-1.x/releases/download/v$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL2

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \
	--with-sysroot=$(DESTDIR) \
	--disable-docs \
	--disable-examples \
	--disable-nls \
	--disable-libdbi \
	--disable-librados \
	--disable-ruby \
	--disable-lua \
	--disable-tcl \
	--disable-python \
	--disable-perl \

include ../../gar.mk

post-install:
	# adding symlink required to build perl bindings
	@ln -srf $(WORKSRC)/src ../../perl/perl-RRDtool-bindings/
	@rm -f $(DESTDIR)$(libdir)/librrd.la
	@$(MAKECOOKIE)
