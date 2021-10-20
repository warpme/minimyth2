
GARNAME      = crossguid
GARVERSION   = ca1bf4b810e2d188d04cb6286f957008ee1b7681
CATEGORIES   = lib
MASTER_SITES = https://github.com/graeme-hill/crossguid/archive/
DISTFILES    = $(GARVERSION).tar.gz
WORKSRC      = $(WORKDIR)/crossguid-$(GARVERSION)
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS = $(DIRPATHS_CMAKE) \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DCMAKE_SYSTEM_NAME="Linux" \

include ../../gar.mk

post-install:
	@cp -f $(WORKSRC)/include/crossguid/guid.hpp $(DESTDIR)$(includedir)/guid.h
	@$(MAKECOOKIE)
