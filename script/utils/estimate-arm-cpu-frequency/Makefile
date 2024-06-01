
GARNAME      = estimate-arm-cpu-frequency
GARVERSION   = 1.0
DISTFILES    = estimate-arm-cpu-frequency.c
CATEGORIES   = util
LICENSE      = GPL2/LGPL2_1
WORKSRC      = $(WORKDIR)

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

BUILD_ARGS   = \
	CC="$(CC)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS) $(LDFLAGS)" \
	CXXFLAGS="$(CXXFLAGS) $(LDFLAGS)"

build-custom:
	@echo "Building..."
	@$(CC) $(CXXFLAGS) $(LDFLAGS) -o $(WORKSRC)/estimate-arm-cpu-frequency $(WORKSRC)/estimate-arm-cpu-frequency.c -I$(DESTDIR)$(includedir) -L$(DESTDIR)$(libdir)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@echo "Installing..."
	@cp -rf $(WORKSRC)/estimate-arm-cpu-frequency $(DESTDIR)$(bindir)/estimate-arm-cpu-frequency
	@chmod +x $(DESTDIR)$(bindir)/estimate-arm-cpu-frequency
	@$(MAKECOOKIE)
