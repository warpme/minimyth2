
GARNAME      = boost
GARVERSION   = 1.73.0
CATEGORIES   = devel
MASTER_SITES = https://boostorg.jfrog.io/artifactory/main/release/$(GARVERSION)/source/
DISTFILES    = boost_1_73_0.tar.gz
WORKSRC      = $(WORKDIR)/boost_1_73_0
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE_1_0.txt

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

include ../../gar.mk

BUILD_ARGS   = \
	CC="$(CC)" \
	CXX="$(CXX)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS) $(LDFLAGS)" \
	CXXFLAGS="$(CXXFLAGS) $(LDFLAGS)"

configure-custom:
	@cd $(WORKSRC) && ./bootstrap.sh --with-toolset=gcc --with-icu --without-libraries=python --prefix=$(DESTDIR)$(libdir)/boost_1_73_0
	@$(MAKECOOKIE)

post-configure:
	@sed -e "s%    using gcc.*%    using gcc : : $(build_rootdir)$(bindir)/$(CC) --sysroot=$(DESTDIR) ; %g" -i $(WORKSRC)/project-config.jam
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC) && ./b2
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC) && ./b2 install
	@$(MAKECOOKIE)
