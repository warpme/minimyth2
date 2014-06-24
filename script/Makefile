
# Turn all them .txt files into .html files
%.html: %.txt tron.awk navbar.nav
	./tron.awk $< 

html: $(patsubst %.txt,%.html,$(wildcard *.txt))
	@echo html generated

*.html: tron.awk navbar.nav

# top-level Makefile for the entire tree.
%:
	@for i in $(filter-out CVS/,$(wildcard */)) ; do \
		test ! -e $$i/Makefile || $(MAKE) -C $$i $* ; \
	done

paranoid-%:
	@for i in $(filter-out CVS/,$(wildcard */)) ; do \
		test ! -e $$i/Makefile || $(MAKE) -C $$i $@ || exit 2; \
	done

export BUILDLOG ?= $(shell pwd)/buildlog.txt

report-%:
	@echo "$@ started at $$(date)" >> $(BUILDLOG)
	@for i in $(filter-out CVS/,$(wildcard */)) ; do \
		test ! -e $$i/Makefile || $(MAKE) -C $$i $@ || echo "	make $@ in category $$i failed" >> $(BUILDLOG); \
	done
	@echo "$@ completed at $$(date)" >> $(BUILDLOG)

BUGMAINT ?= $(shell pwd)/Maintainers
BUGDESC ?= $(shell pwd)/pseudo-packages.description
export BUGMAINT BUGDESC

debbugs:
	@cp -f Maintainers.base $(BUGMAINT)
	@cp -f Descriptions.base $(BUGDESC)
	@for i in $(filter-out CVS/,$(wildcard */)) ; do \
		test ! -e $$i/Makefile || $(MAKE) -C $$i $@ || echo "$$i on fire."; \
	done
	@cp $(BUGMAINT) /etc/debbugs/Maintainers
	@cp $(BUGDESC) /etc/debbugs/pseudo-packages.description

DEBBUGURL = http://bugs.lnx-bbc.org/bugs
STYLESHEET = http://www.lnx-bbc.org/bbc.css
HTMLDIR = /var/www/packages
PACKAGEURL = http://build.lnx-bbc.org/packages
HTMLINDEX = $(HTMLDIR)/index.html

export HTMLINDEX DEBBUGURL STYLESHEET 

define HTMLINDEXSTART
<html>\n
<head>\n
\t<title>Package list</title>\n
\t<link rel="stylesheet" type="text/css" href="$(STYLESHEET)">\n
</head>\n
<body>\n
<h1>List of Packages Available</h1>\n
endef

define HTMLINDEXSTOP
</body>\n
</html>
endef

export HTMLINDEXSTART HTMLINDEXSTOP PACKAGEURL

webpages:
	@mkdir -p $(HTMLDIR)
	@echo -e $${HTMLINDEXSTART} > $(HTMLINDEX).tmp
	@for i in $(filter-out CVS/,$(wildcard */)) ; do \
		if test -e $$i/Makefile; then \
			mkdir -p $(HTMLDIR)/$$i;\
			echo "<h2>$$i</h2>" >> $(HTMLINDEX).tmp;\
			echo "<ol>" >> $(HTMLINDEX).tmp;\
			$(MAKE) GARCATEGORY=$$i HTMLINDEX=$(HTMLINDEX).tmp HTMLDIR=$(HTMLDIR)/$$i CATEGORYURL=$(PACKAGEURL)/$$i -C $$i webpages || echo "$$i on fire."; \
			echo "</ol>" >> $(HTMLINDEX).tmp;\
		fi \
	done
	@echo -e $${HTMLINDEXSTOP} >> $(HTMLINDEX).tmp
	@mv $(HTMLINDEX).tmp $(HTMLINDEX)

# this fixes the garchive rule
garchive:
	@for i in $(filter-out CVS/,$(wildcard */)) ; do \
		test ! -e $$i/Makefile || $(MAKE) -C $$i garchive ; \
	done

.PHONY: garchive
