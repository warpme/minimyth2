BINUTILS_VERSION = 2.41

# Determines whether to build system's binutils is up to date.
BINUTILS_BUILD_UP_TO_DATE = \
	$(shell \
		old=`$(build_LD) -v | sed -e 's%[^0-9]*%%' | sed -e 's% [^ ]*%%g'` ; \
		while test `echo $${old} | sed -e 's%[.]% %g' | wc -w` -lt 4 ; do \
			old="$${old}.0" ; \
		done ; \
		old_major=`echo $${old} | cut -d . -f 1` ; \
		old_minor=`echo $${old} | cut -d . -f 2` ; \
		old_teeny=`echo $${old} | cut -d . -f 3` ; \
		old_extra=`echo $${old} | cut -d . -f 4` ; \
		new='$(BINUTILS_VERSION)' ; \
		while test `echo $${new} | sed -e 's%[.]% %g' | wc -w` -lt 4 ; do \
			new="$${new}.0" ; \
		done ; \
		new_major=`echo $${new} | cut -d . -f 1` ; \
		new_minor=`echo $${new} | cut -d . -f 2` ; \
		new_teeny=`echo $${new} | cut -d . -f 3` ; \
		new_extra=`echo $${new} | cut -d . -f 4` ; \
		if   test $${old_major} -lt $${new_major} ; then \
			echo 'no' ; \
		elif test $${old_major} -eq $${new_major} && \
		     test $${old_minor} -lt $${new_minor} ; then \
			echo 'no' ; \
		elif test $${old_major} -eq $${new_major} && \
		     test $${old_minor} -eq $${new_minor} && \
		     test $${old_teeny} -lt $${new_teeny} ; then \
			echo 'no' ; \
		elif test $${old_major} -eq $${new_major} && \
		     test $${old_minor} -eq $${new_minor} && \
		     test $${old_teeny} -eq $${new_teeny} && \
		     test $${old_extra} -lt $${new_extra} ; then \
			echo 'no' ; \
		else \
			echo 'yes' ; \
		fi ; \
	)
