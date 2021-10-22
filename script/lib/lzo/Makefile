
GARNAME      = lzo
GARVERSION   = 2.10
CATEGORIES   = lib
MASTER_SITES = http://www.oberhumer.com/opensource/lzo/download/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.gz
LICENSE      = LGPL2

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile minilzo
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile minilzo

CMAKE_CONFIGURE_ARGS = \
	-DENABLE_SHARED=ON \
	-DENABLE_STATIC=OFF \

include ../../gar.mk

build-minilzo:
	@cd $(WORKSRC); $(CC) $(CPPFLAGS) $(CFLAGS) -fpic -Iinclude/lzo -o minilzo/minilzo.o -c minilzo/minilzo.c
	@cd $(WORKSRC); $(CC) $(LDFLAGS) -shared -o libminilzo.so.0 -Wl,-soname,libminilzo.so.0 minilzo/minilzo.o
	@$(MAKECOOKIE)

install-minilzo:
	@cp $(WORKSRC)/libminilzo.so.0 $(DESTDIR)$(libdir)/libminilzo.so.0
	@ln -srf $(DESTDIR)$(libdir)/libminilzo.so.0 $(DESTDIR)$(libdir)/libminilzo.so
	@cp $(WORKSRC)/minilzo/minilzo.h $(DESTDIR)$(includedir)/lzo/minilzo.h
	@$(MAKECOOKIE)
