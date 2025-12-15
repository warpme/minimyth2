
GARNAME      = ffmpeg8.0-mythtv
CATEGORIES   = lib
GARVERSION   = 8.0
MASTER_SITES = 
DISTFILES    = 

DESCRIPTION = 
define BLURB
endef

DEPENDS   = myth/mythtv

HEADERS_DIRS   = libavcodec    libavdevice    libavfilter    libavformat    libavutil    libswresample    libswscale
PC_FILES       = libavcodec.pc libavdevice.pc libavfilter.pc libavformat.pc libavutil.pc libswresample.pc libswscale.pc
DEST_LIB_FILES = libavcodec.*  libavdevice.*  libavfilter.*  libavformat.*  libavutil.*  libswresample.*  libswscale.*
SRC_LIB_FILES  = \
  libmythavcodec.so.62.11.100  \
  libmythavdevice.so.62.1.100  \
  libmythavfilter.so.11.4.100  \
  libmythavformat.so.62.3.100  \
  libmythavutil.so.60.8.100    \
  libmythswresample.so.6.1.100 \
  libmythswscale.so.9.1.100
DEST_BIN_FILES = ffmpeg ffprobe ffplay
SRC_BIN_FILES  = mythffmpeg mythffprobe mythffplay

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = 
INSTALL_SCRIPTS   = custom

delete-headers:
	@echo "deleting installed headers" ; \
	 for file in $(HEADERS_DIRS) ; do \
		if [ -e $(DESTDIR)$(includedir)/mythtv/$${file} ] ; then \
			rm -rfv $(DESTDIR)$(includedir)/$${file} ; \
	 fi ; \
	 done

delete-pcfiles:
	@echo "deleting PC files" ; \
	 for file in $(PC_FILES) ; do \
		if [ -e $(DESTDIR)$(libdir)/pkgconfig/$${file} ] ; then \
			rm -rfv $(DESTDIR)$(libdir)/pkgconfig/$${file} ; \
	 fi ; \
	 done

delete-libs:
	@echo "deleting lib files" ; \
	 for file in $(DEST_LIB_FILES) ; do \
		rm -rfv $(DESTDIR)$(libdir)/$${file} ; \
	 done

delete-bins:
	@echo "deleting bin files" ; \
	 for file in $(DEST_BIN_FILES) ; do \
		if [ -e $(DESTDIR)$(bindir)/$${file} ] ; then \
			rm -rfv $(DESTDIR)$(bindir)/$${file} ; \
	 fi ; \
	 done

install-custom: delete-headers delete-pcfiles delete-libs delete-bins
	@echo "symlinking headers" ; \
	 for file in $(HEADERS_DIRS) ; do \
		if [ -e $(DESTDIR)$(includedir)/mythtv/$${file} ] ; then \
			ln -srfv $(DESTDIR)$(includedir)/mythtv/$${file} $(DESTDIR)$(includedir)/ ; \
		fi ; \
	 done
	@echo "installing PC files" ; \
	 for file in $(PC_FILES) ; do \
		if [ -e $(WORKDIR)/../../files/$${file} ] ; then \
			cp -fv $(WORKDIR)/../../files/$${file} $(DESTDIR)$(libdir)/pkgconfig/ ; \
		fi ; \
	 done
	@echo "installing lib files" ; \
	 for file in $(SRC_LIB_FILES) ; do \
		if [ -e $(DESTDIR)$(libdir)/$${file} ] ; then \
			destfile=$$(echo $${file} | sed -e 's/myth//g') ; \
			destsofile=$$(echo $${destfile} | sed -e 's/so.*/so/g') ; \
			echo $${destfile} ; \
			echo $${destsofile} ; \
			ln -srfv $(DESTDIR)$(libdir)/$${file} $(DESTDIR)$(libdir)/$${destfile} ; \
			ln -srfv $(DESTDIR)$(libdir)/$${file} $(DESTDIR)$(libdir)/$${destsofile} ; \
		fi ; \
	 done
	@echo "installing bin files" ; \
	 for file in $(SRC_BIN_FILES) ; do \
		if [ -e $(DESTDIR)$(bindir)/$${file} ] ; then \
			destfile=$$(echo $${file} | sed -e 's/myth//g') ; \
			echo $${destfile} ; \
			ln -srfv $(DESTDIR)$(bindir)/$${file} $(DESTDIR)$(bindir)/$${destfile} ; \
		fi ; \
	 done

include ../../gar.mk

clean-all: delete-headers delete-pcfiles delete-libs delete-bins
	@$(MAKE) clean
