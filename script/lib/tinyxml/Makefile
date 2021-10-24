
GARNAME      = tinyxml
GARVERSION   = 2.6.2
CATEGORIES   = lib
MASTER_SITES = https://downloads.sourceforge.net/tinyxml/
DISTFILES    = $(GARNAME)_2_6_2.tar.gz tinyxml.pc
WORKSRC      = $(WORKDIR)/tinyxml
LICENSE      = GPL

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile


BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

BUILD_ARGS   = \
	CXX="$(CXX)" \
	LD="$(CXX)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS) $(LDFLAGS)" \
	CXXFLAGS="$(CXXFLAGS) $(LDFLAGS)"

build-custom:
	@echo "Building..."
	$(MAKE) -C $(WORKSRC) $(BUILD_ARGS)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -shared -o $(WORKSRC)/"lib$(GARNAME).so.0.$(GARVERSION)" -Wl,-soname,"lib$(GARNAME).so.0"
	@$(MAKECOOKIE)

install-custom:
	@cp -f "$(WORKSRC)/lib$(GARNAME).so.0.$(GARVERSION)" $(DESTDIR)$(libdir)
	@ln -srf $(DESTDIR)$(libdir)/lib$(GARNAME).so.0.$(GARVERSION) $(DESTDIR)$(libdir)/lib$(GARNAME).so
	@cp -f $(WORKSRC)/tinyxml.h $(WORKSRC)/tinystr.h $(DESTDIR)$(includedir)
	@cp -f $(WORKSRC)/../tinyxml.pc $(DESTDIR)$(libdir)/pkgconfig
	@$(MAKECOOKIE)
