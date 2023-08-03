
GARNAME    = glibc-rpcsvc
GARVERSION = $(GLIBC_VERSION)
CATEGORIES = devel
SOURCEPKG  = devel/glibc
LICENSE    = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

WORKSRC = $(WORKDIR)/glibc-$(GARVERSION)
WORKBLD = $(WORKSRC)_build

INSTALL_SCRIPTS = rpcsvc

GAR_EXTRA_CONF += devel/glibc/package-api.mk
include ../../gar.mk

install-rpcsvc:
	@rm -rf $(DESTDIR)$(includedir)/rpcsvc
	@mkdir -p $(DESTDIR)$(includedir)/rpcsvc
	@rpcsvc_input_list=`cd $(WORKSRC)/nis/rpcsvc ; ls -1 *.h | sed -e 's!\.h$$!!'`; \
	 for rpcsvc_input_file in $${rpcsvc_input_list} ; do \
		echo "creating $(DESTDIR)$(includedir)/rpcsvc/$${rpcsvc_input_file}.h" ; \
		rm -f $(DESTDIR)$(includedir)/rpcsvc/$${rpcsvc_input_file}.h ; \
		cp $(WORKSRC)/nis/rpcsvc/$${rpcsvc_input_file}.h $(DESTDIR)$(includedir)/rpcsvc/$${rpcsvc_input_file}.h ; \
	 done
	@rpcsvc_input_list=`cd $(WORKSRC)/sunrpc/rpcsvc ; ls -1 *.h | sed -e 's!\.h$$!!'`; \
	 for rpcsvc_input_file in $${rpcsvc_input_list} ; do \
		echo "creating $(DESTDIR)$(includedir)/rpcsvc/$${rpcsvc_input_file}.h" ; \
		rm -f $(DESTDIR)$(includedir)/rpcsvc/$${rpcsvc_input_file}.h ; \
		cp $(WORKSRC)/sunrpc/rpcsvc/$${rpcsvc_input_file}.h $(DESTDIR)$(includedir)/rpcsvc/$${rpcsvc_input_file}.h ; \
	 done
	@rpcsvc_input_list=`cd $(WORKSRC)/sunrpc/rpcsvc ; ls -1 *.x | sed -e 's!\.x$$!!'`; \
	 for rpcsvc_input_file in $${rpcsvc_input_list} ; do \
		echo "creating $(DESTDIR)$(includedir)/rpcsvc/$${rpcsvc_input_file}.h" ; \
		rm -f $(DESTDIR)$(includedir)/rpcsvc/$${rpcsvc_input_file}.h ; \
		CPP="$(CC) -E -x c-header" $(build_DESTDIR)$(build_bindir)/rpcgen -Y $(WORKSRC)/scripts -h $(WORKSRC)/sunrpc/rpcsvc/$${rpcsvc_input_file}.x -o $(DESTDIR)$(includedir)/rpcsvc/$${rpcsvc_input_file}.h ; \
	 done
