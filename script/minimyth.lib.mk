# $(call FIX_LIBTOOL_HARDCODE,<file_name>)
# $(call FIX_LIBTOOL_HARDCODE,<dir_name>,<file_basename>)
# Libtool hardcodes library paths. sed lines (1) and (2) disable this.
# Once hardcoding is disabled, libtool uses LD_RUN_PATH. sed ine (3) disables this.
# If the package is being built for the build environement, then hardcoding is not disabled,
# since the build environment files are never relocated.
FIX_LIBTOOL_HARDCODE = \
	if [ ! "x$(DESTIMG)" = "xbuild" ] ; then                                                             \
		if [ "x$(strip $(1))" = "x" ] ; then                                                         \
			exit 1                                                                             ; \
		fi                                                                                         ; \
		if [ ! -e $(strip $(1)) ] ; then                                                             \
			exit 1                                                                             ; \
		fi                                                                                         ; \
		if [ ! -f $(strip $(1)) ] && [ ! -d $(strip $(1)) ] ; then                                   \
			exit 1                                                                             ; \
		fi                                                                                         ; \
		if [ -d $(strip $(1)) ] && [ "x$(strip $(2))" = "x" ] ; then                                 \
			exit 1                                                                             ; \
		fi                                                                                         ; \
		file_name_list=''                                                                          ; \
		if [ -f $(strip $(1)) ] ; then                                                               \
			file_name_list=$(strip $(1))                                                       ; \
		fi                                                                                         ; \
		if [ -d $(strip $(1)) ] ; then                                                               \
        		file_name_list=`find $(strip $(1)) -name $(strip $(2))`                            ; \
		fi                                                                                         ; \
		if [ "x$${file_name_list}" = "x" ] ; then                                                    \
			exit 1                                                                             ; \
		fi                                                                                         ; \
		for file_name in $${file_name_list} ; do                                                     \
			sed -i 's%^hardcode_into_libs=.*%hardcode_into_libs=no%'             $${file_name} ; \
			sed -i 's%^hardcode_libdir_flag_spec=.*%hardcode_libdir_flag_spec=%' $${file_name} ; \
			sed -i 's%^runpath_var=.*%runpath_var=%'                             $${file_name} ; \
		done                                                                                       ; \
	fi
# $(call FIX_LIBTOOL_LIBPATH,<file_name>)
# $(call FIX_LIBTOOL_LIBPATH,<dir_name>,<file_basename>)
# Libtool assumes a library search path that is wrong. sed line (1) fixes this.
# Libtool assumes a library dlsearch path that is wrong. sed line (2) fixes this.
FIX_LIBTOOL_LIBPATH = \
	if [ "x$(strip $(1))" = "x" ] ; then                                                                                      \
		exit 1                                                                                                          ; \
	fi                                                                                                                      ; \
	if [ ! -e $(strip $(1)) ] ; then                                                                                          \
		exit 1                                                                                                          ; \
	fi                                                                                                                      ; \
	if [ ! -f $(strip $(1)) ] && [ ! -d $(strip $(1)) ] ; then                                                                \
		exit 1                                                                                                          ; \
	fi                                                                                                                      ; \
	if [ -d $(strip $(1)) ] && [ "x$(strip $(2))" = "x" ] ; then                                                              \
		exit 1                                                                                                          ; \
	fi                                                                                                                      ; \
	file_name_list=''                                                                                                       ; \
	if [ -f $(strip $(1)) ] ; then                                                                                            \
		file_name_list=$(strip $(1))                                                                                    ; \
	fi                                                                                                                      ; \
	if [ -d $(strip $(1)) ] ; then                                                                                            \
        	file_name_list=`find $(strip $(1)) -name $(strip $(2))`                                                         ; \
	fi                                                                                                                      ; \
	if [ "x$${file_name_list}" = "x" ] ; then                                                                                 \
		exit 1                                                                                                          ; \
	fi                                                                                                                      ; \
	libpath_l=`LANG=C $(CC) -print-search-dirs                                                                                \
		| grep -e '^libraries:'                                                                                           \
		| sed -e 's%^libraries: *%%' -e 's%=/%/%g' -e 's%:% %g'`                                                        ; \
	libpath_l=`echo $${libpath_l} | sed -e 's%  *% %g' -e 's%^ %%' -e 's% $$%%' -e 's%//*%/%g'`                             ; \
	libpath_r=""                                                                                                            ; \
	libpath_r="$${libpath_r} $(elibdir)"                                                                                    ; \
	libpath_r="$${libpath_r} $(libdir)"                                                                                     ; \
	libpath_r="$${libpath_r} $(qt5libdir)"                                                                                  ; \
	libpath_r="$${libpath_r} $(libdir)/mysql"                                                                               ; \
	libpath_r="$${libpath_r} $(if $(filter build       ,$(DESTIMG))                ,/lib/$(GARBUILD) /usr/lib/$(GARBUILD))" ; \
	libpath_r="$${libpath_r} $(if $(filter build+i386  ,$(DESTIMG)+$(GARCH_FAMILY)),/lib32 /usr/lib32 /lib /usr/lib)"       ; \
	libpath_r="$${libpath_r} $(if $(filter build+x86_64,$(DESTIMG)+$(GARCH_FAMILY)),/lib64 /usr/lib64 /lib /usr/lib)"       ; \
	libpath_r=`echo $${libpath_r} | sed -e 's%  *% %g' -e 's%^ %%' -e 's% $$%%' -e 's%//*%/%g'`                             ; \
	for file_name in $${file_name_list} ; do                                                                                  \
		sed -i "s%^sys_lib_search_path_spec=.*%sys_lib_search_path_spec=\'$${libpath_l}\'%"     $${file_name}           ; \
		sed -i "s%^sys_lib_dlsearch_path_spec=.*%sys_lib_dlsearch_path_spec=\'$${libpath_r}\'%" $${file_name}           ; \
	done
# $(call FIX_LIBTOOL,<file_name>)
# $(call FIX_LIBTOOL,<dir_name>,<file_basename>)
FIX_LIBTOOL = \
	$(call FIX_LIBTOOL_HARDCODE,$(strip $(1)),$(strip $(2))) ; \
	$(call FIX_LIBTOOL_LIBPATH,$(strip $(1)),$(strip $(2)))

# $(call FETCH_CVS, <cvs_root>, <cvs_module>, <cvs_date>, <file_base>)
FETCH_CVS = \
	mkdir -p $(PARTIALDIR)                                                                  ; \
	cd $(PARTIALDIR)                                                                        ; \
	rm -rf $(strip $(4))                                                                    ; \
	rm -rf $(strip $(4)).tar.bz2                                                            ; \
	cvs -z9 -d:pserver:$(strip $(1)) co -D $(strip $(3)) -d $(strip $(4)) $(strip $(2))     ; \
	if [ ! -d $(strip $(4)) ] ; then                                                          \
		rm -rf $(strip $(4))                                                            ; \
		rm -rf $(strip $(4)).tar.bz2                                                    ; \
		exit 1                                                                          ; \
	fi                                                                                      ; \
	tar --exclude '*/CVS' --exclude '*/.cvsignore' -jcf $(strip $(4)).tar.bz2 $(strip $(4)) ; \
	rm -rf $(strip $(4))


# $(call FETCH_GIT, <git_url>, <git_objectid>, <file_base>)
FETCH_GIT = \
	mkdir -p $(PARTIALDIR)                                                                                             ; \
	cd $(PARTIALDIR)                                                                                                   ; \
	rm -rf $(strip $(3))                                                                                               ; \
	rm -rf $(strip $(3)).tar.bz2                                                                                       ; \
	git clone git://$(strip $(1)) $(strip $(3))                                                                        ; \
	if [ ! -d $(strip $(3)) ] ; then                                                                                     \
		rm -rf $(strip $(3))                                                                                       ; \
		rm -rf $(strip $(3)).tar.bz2                                                                               ; \
		exit 1                                                                                                     ; \
	fi                                                                                                                 ; \
	cd $(strip $(3))                                                                                                   ; \
	git checkout -b $(strip $(2)) $(strip $(2))                                                                        ; \
	cd ..                                                                                                              ; \
	tar --exclude '*/.git' --exclude '*/.gitignore' --exclude '*/.gitmodules' -jcf $(strip $(3)).tar.bz2 $(strip $(3)) ; \
	rm -rf $(strip $(3))

# $(call FETCH_HG, <git_url>, <git_objectid>, <file_base>)
FETCH_HG = \
	mkdir -p $(PARTIALDIR)                                                                                             ; \
	cd $(PARTIALDIR)                                                                                                   ; \
	rm -rf $(strip $(3))                                                                                               ; \
	rm -rf $(strip $(3)).tar.bz2                                                                                       ; \
	hg clone http://$(strip $(1)) $(strip $(3))                                                                        ; \
	if [ ! -d $(strip $(3)) ] ; then                                                                                     \
		rm -rf $(strip $(3))                                                                                       ; \
		rm -rf $(strip $(3)).tar.bz2                                                                               ; \
		exit 1                                                                                                     ; \
	fi                                                                                                                 ; \
	cd $(strip $(3))                                                                                                   ; \
	hg update $(strip $(2))                                                                                            ; \
	cd ..                                                                                                              ; \
	tar --exclude '*/.hg' --exclude '*/.hgignore' --exclude '*/.hgsigs' --exclude='*/.hgtags'                            \
            -jcf $(strip $(3)).tar.bz2 $(strip $(3))                                                                       ; \
	rm -rf $(strip $(3))

# $(call FETCH_SVN, <svn_url>, <svn_revision>, <file_base>)
FETCH_SVN = \
	mkdir -p $(PARTIALDIR)                                          ; \
	cd $(PARTIALDIR)                                                ; \
	rm -rf $(strip $(3))                                            ; \
	rm -rf $(strip $(3)).tar.bz2                                    ; \
	svn co -r $(strip $(2)) $(strip $(1)) $(strip $(3))             ; \
	if [ $$? -ne 0 ] ; then                                           \
		rm -rf $(strip $(3))                                    ; \
	fi                                                              ; \
	ls -l . ; \
	if [ ! -d $(strip $(3)) ] ; then                                  \
		rm -rf $(strip $(3))                                    ; \
		rm -rf $(strip $(3)).tar.bz2                            ; \
		exit 1                                                  ; \
	fi                                                              ; \
	tar --exclude '*/.svn' -jcf $(strip $(3)).tar.bz2 $(strip $(3)) ; \
	rm -rf $(strip $(3))

# $(call RUN_AUTOTOOLS)
# $(call RUN_AUTOTOOLS, <autotools-command>)
RUN_AUTOTOOLS = \
	if [ -e $(build_DESTDIR)$(build_bindir)/autoreconf  ] &&                                     \
	   [ -e $(build_DESTDIR)$(build_bindir)/autoconf    ] &&                                     \
	   [ -e $(build_DESTDIR)$(build_bindir)/automake    ] &&                                     \
	   [ -e $(build_DESTDIR)$(build_bindir)/libtoolize  ] &&                                     \
	   [ -e $(build_DESTDIR)$(build_bindir)/intltoolize ] ; then                                 \
		$(if $(strip $(1)),                                                              \
			$(strip $(1)) ,                                                          \
			mkdir -p $(DESTDIR)$(datadir)/aclocal                                  ; \
			mkdir -p $(WORKSRC)/m4                                                 ; \
			cd $(WORKSRC)                                                          ; \
			autoreconf --verbose --install --force -I $(DESTDIR)$(datadir)/aclocal   \
		)                                                                                   ; \
	fi

# $(call RUN_GETTEXTIZE)
# $(call RUN_GETTEXTIZE, <gettextize-command>)
RUN_GETTEXTIZE = \
	if [ -e $(build_DESTDIR)$(build_bindir)/gettextize ] ; then        \
		$(if $(strip $(1)),                                     \
			$(strip $(1)) ,                                 \
			mkdir -p $(DESTDIR)$(datadir)/aclocal         ; \
			cd $(WORKSRC)                                 ; \
			gettextize --force                              \
		)                                                         ; \
	fi

clean-image:
	@rm -rf $(COOKIEROOTDIR)/$(DESTIMG).d
	@rm -rf $(WORKROOTDIR)/$(DESTIMG).d
	@rm -rf $(SCRATCHDIR)/$(DESTIMG).d
	@rm -rf $(WORKROOTDIR)/$(DESTIMG).d

garchive-touch:
	@if test -d files ; then \
		duplicates=`find files/* -maxdepth 0 -type f -exec basename '{}' \;` ; \
	 	for duplicate in $${duplicates} ; do                                   \
			find $(GARCHIVEROOT) -name $${duplicate} -exec rm '{}' \;    ; \
		done                                                                 ; \
	fi
	@$(if $(strip $(ALLFILES)), $(if $(wildcard $(GARCHIVEDIR)), touch $(GARCHIVEDIR)))

patch-%.gar: gar-patch-%.gar
	@$(MAKECOOKIE)

gar-patch-%:
	@echo " ==> Applying patch $(DOWNLOADDIR)/$*"
	@cat $(DOWNLOADDIR)/$* \
		| sed 's%@GAR_GARBUILD@%$(GARBUILD)%g' \
		| sed 's%@GAR_GARHOST@%$(GARHOST)%g' \
		| sed 's%@GAR_build_DESTDIR@%$(build_DESTDIR)%g' \
		| sed 's%@GAR_build_bindir@%$(build_bindir)%g' \
		| sed 's%@GAR_build_includedir@%$(build_includedir)%g' \
		| sed 's%@GAR_build_qt5bindir@%$(build_qt5bindir)%g' \
		| sed 's%@GAR_DESTDIR@%$(DESTDIR)%g' \
		| sed 's%@GAR_rootdir@%$(rootdir)%g' \
		| sed 's%@GAR_prefix@%$(prefix)%g' \
		| sed 's%@GAR_bindir@%$(bindir)%g' \
		| sed 's%@GAR_datadir@%$(datadir)%g' \
		| sed 's%@GAR_docdir@%$(docdir)%g' \
		| sed 's%@GAR_ebindir@%$(ebindir)%g' \
		| sed 's%@GAR_elibdir@%$(elibdir)%g' \
		| sed 's%@GAR_esbindir@%$(esbindir)%g' \
		| sed 's%@GAR_includedir@%$(includedir)%g' \
		| sed 's%@GAR_libdir@%$(libdir)%g' \
		| sed 's%@GAR_localstatedir@%$(localstatedir)%g' \
		| sed 's%@GAR_mandir@%$(mandir)%g' \
		| sed 's%@GAR_sbindir@%$(sbindir)%g' \
		| sed 's%@GAR_sourcedir@%$(sourcedir)%g' \
		| sed 's%@GAR_sysconfdir@%$(sysconfdir)%g' \
		| sed 's%@GAR_qt5prefix@%$(qt5prefix)%g' \
		| sed 's%@GAR_qt5bindir@%$(qt5bindir)%g' \
		| sed 's%@GAR_qt5includedir@%$(qt5includedir)%g' \
		| sed 's%@GAR_qt5libdir@%$(qt5libdir)%g' \
		| sed 's%@GAR_GARCH_FAMILY@%$(GARCH_FAMILY)%g' \
		| sed 's%@GAR_CPP@%$(CPP)%g' \
		| sed 's%@GAR_CC@%$(CC)%g' \
		| sed 's%@GAR_CXX@%$(CXX)%g' \
		| sed 's%@GAR_LD@%$(LD)%g' \
		| sed 's%@GAR_AS@%$(AS)%g' \
		| sed 's%@GAR_AR@%$(AR)%g' \
		| sed 's%@GAR_RANLIB@%$(RANLIB)%g' \
		| sed 's%@GAR_NM@%$(NM)%g' \
		| sed 's%@GAR_STRIP@%$(STRIP)%g' \
		| sed 's%@GAR_PERL_BIN@%$(build_bindir)/perl%g' \
		| sed 's%@GAR_PYTHON_BIN@%$(build_bindir)/python%g' \
		| sed 's%@GAR_CPPLAGS@%$(CPPFLAGS)%g' \
		| sed 's%@GAR_CFLAGS@%$(CFLAGS)%g' \
		| sed 's%@GAR_CXXFLAGS@%$(CXXFLAGS)%g' \
		| sed 's%@GAR_LDFLAGS@%$(LDFLAGS)%g' \
		| $(GARPATCH)
	@$(MAKECOOKIE)

PYTHON2_SET_BUILD_SYSCONF= \
	echo "Setting _sysconfigdata.py to host config as DESTIMG=build"; \
	cp -v $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py.build \
	      $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py; \
	rm -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.pyc; \
	rm -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.pyo; \

PYTHON2_SET_MAIN_SYSCONF= \
	echo "Restoring _sysconfigdata.py to target config as DESTIMG=main"; \
	cp -v $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py.main \
	      $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py; \
	rm -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.pyc; \
	rm -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.pyo; \

PYTHON3_SET_BUILD_SYSCONF= \
	echo "Setting _sysconfigdata__linux_x86_64-linux-gnu.py to host config as DESTIMG=build"; \
	cp -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata__linux_i386-linux-gnu.py.build \
	      $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata__linux_i386-linux-gnu.py; \
	cp -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata__linux_x86_64-linux-gnu.py.build \
	      $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata__linux_x86_64-linux-gnu.py; \
	rm -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/__pycache__/_sysconfigdata__*.pyc

PYTHON3_SET_MAIN_SYSCONF= \
	echo "Restoring _sysconfigdata__linux_x86_64-linux-gnu.py to target config as DESTIMG=main"; \
	cp -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata__linux_i386-linux-gnu.py.main \
	      $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata__linux_i386-linux-gnu.py; \
	cp -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata__linux_x86_64-linux-gnu.py.main \
	      $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata__linux_x86_64-linux-gnu.py; \
	rm -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/__pycache__/_sysconfigdata__*.pyc
