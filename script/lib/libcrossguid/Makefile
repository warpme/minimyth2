
GARNAME      = crossguid
GARVERSION   = 8f399e8bd4252be9952f3dfa8199924cc8487ca4
CATEGORIES   = lib
MASTER_SITES = https://github.com/graeme-hill/crossguid/archive/
DISTFILES    = $(GARVERSION).tar.gz
WORKSRC      = $(WORKDIR)/crossguid-$(GARVERSION)
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DEPENDS = lang/c

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

include ../../gar.mk

build-custom:
	@cd $(WORKSRC) && $(CXX) -c guid.cpp -o guid.o $(CXXFLAGS) -std=c++11 -DGUID_LIBUUID
	@$(AR) rvs $(WORKSRC)/libcrossguid.a $(WORKSRC)/guid.o
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(libdir)
	@cp -f $(WORKSRC)/libcrossguid.a $(DESTDIR)$(libdir)
	@mkdir -p $(DESTDIR)$(includedir)
	@cp $(WORKSRC)/guid.h $(DESTDIR)$(includedir)
	@$(MAKECOOKIE)
