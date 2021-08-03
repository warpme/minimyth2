
GARNAME      = lsof
GARVERSION   = 4.94.0
CATEGORIES   = utils
MASTER_SITES = https://github.com/lsof-org/lsof/archive/$(GARVERSION)/
DISTFILES    = $(GARNAME).tar.gz
LICENSE      =

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

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

GAR_EXTRA_CONF += kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk devel/glibc/package-api.mk
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

pre-configure:
	@ln -srf $(WORKSRC)/Configure $(WORKSRC)/configure
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@install -m 0755 $(WORKSRC)/lsof $(DESTDIR)$(bindir)
	@$(MAKECOOKIE)
