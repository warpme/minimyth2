GARNAME = lsof
GARVERSION = 4.84
CATEGORIES = utils
MASTER_SITES = ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
DISTFILES = $(GARNAME)_$(GARVERSION).tar.bz2
LICENSE =

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

WORKSRC = $(WORKDIR)/$(GARNAME)_$(GARVERSION)/$(GARNAME)_$(GARVERSION)_src

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = custom

CONFIGURE_ARGS = \
	-n \
	linux

CONFIGURE_ENV = \
	LINUX_CLIB="$(LINUX_CLIB)" \
	LSOF_AR="$(LSOF_AR)" \
	LSOF_CC="$(LSOF_CC)" \
	LSOF_CCV="$(LSOF_CCV)" \
	LSOF_RANLIB="$(LSOF_RANLIB)" \
	LSOF_VSTR="$(LSOF_VSTR)" \
	LSOF_INCLUDE="$(LSOF_INCLUDE)"

GAR_EXTRA_CONF += kernel-2.6.23/linux/package-api.mk devel/glibc/package-api.mk
include ../../gar.mk

LINUX_CLIB   := $(strip $(shell \
	major=`echo $(GLIBC_VERSION) | sed -e 's%[^0-9.].*$$%%' | cut -d '.' -f 1` ; \
	minor=`echo $(GLIBC_VERSION) | sed -e 's%[^0-9.].*$$%%' | cut -d '.' -f 2` ; \
	if [ $${minor} -lt 10 ] ; then                                               \
		echo "-DGLIBCV=$${major}0$${minor}"                                ; \
        else                                                                         \
		echo "-DGLIBCV=$${major}$${minor}"                                 ; \
        fi                                                                           ))
LSOF_AR      := $(AR) cr
LSOF_CC      := $(CC)
LSOF_CCV     := $(strip $(shell PATH="$(PATH)" LANG=C $(CC) -v 2>&1 | sed -n 's/.*version \(.*\)/\1/p'))
LSOF_INCLUDE := $(DESTDIR)$(includedir)
LSOF_RANLIB  := $(RANLIB) \$${LIB}
LSOF_VSTR    := $(LINUX_VERSION)

extract-$(GARNAME)_$(GARVERSION).tar.bz2:
	@echo " ==> Extracting $(DOWNLOADDIR)/$(GARNAME)_$(GARVERSION).tar.bz2"
	@bzip2 -dc $(DOWNLOADDIR)/$(GARNAME)_$(GARVERSION).tar.bz2* | tar -xf - -C $(EXTRACTDIR)
	@tar -xf $(EXTRACTDIR)/$(GARNAME)_$(GARVERSION)/$(GARNAME)_$(GARVERSION)_src.tar -C $(EXTRACTDIR)/$(GARNAME)_$(GARVERSION)
	@ln -sf Configure $(EXTRACTDIR)/$(GARNAME)_$(GARVERSION)/$(GARNAME)_$(GARVERSION)_src/configure
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@install -m 0755 $(WORKSRC)/lsof $(DESTDIR)$(bindir)
	@$(MAKECOOKIE)
