GARNAME = 
GARVERSION = 
CATEGORIES = 
MASTER_SITES = 
DISTFILES = $(GARNAME)-$(GARVERSION).tar.gz
PATCHFILES = 
# put your e-mail address in here, as in: 	Foo Bar <foo@bar.com>
MAINTAINER = Unclaimed Package <lnx-bbc-devel@zork.net>
# GPL, GPL2, BSD, MIT, etc. Or add the URL to any custom license
LICENSE = 

DESCRIPTION = 
define BLURB
 Enter a longer description here.

 You can use multiple lines if you want.
endef

# Dependencies are of the form categorydir/packagedir
# LIBDEPS are for libraries, and DEPENDS are for everything else
LIBDEPS =
DEPENDS =
# Builddeps are installed in the build DESTIMG
BUILDDEPS =


CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS)
NODIRPATHS = 

# If some dirs are trying to install into /, list their names
# here, such as: prefix bindir mandir
INSTALL_OVERRIDE_DIRS = 

# This should go before any hand-made rules.
include ../../gar.mk

pre-everything:
	@echo "      This is a template for GAR packages.  Fill in the"
	@echo "appropriate fields, adjust others as necessary, and then"
	@echo "remove this rule.  All package-supplied rules should go"
	@echo "beneath the include directive, so that a plain make will"
	@echo "run make build."
