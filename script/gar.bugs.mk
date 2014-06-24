#-*- mode: Fundamental; tab-width: 4; -*-
# ex:ts=4

# Copyright (C) 2001 Nick Moffitt
# 
# Redistribution and/or use, with or without modification, is
# permitted.  This software is without warranty of any kind.  The
# author(s) shall not be liable in the event that use of the
# software causes damage.

# this file contains all of the rules for integrating with
# debbugs and for making informational Web pages for each of the
# packages.

DEBBUGSDIR ?= /var/lib/debbugs/www
BUGMAINT ?= $(WORKDIR)/Maintainers
BUGDESC ?= $(WORKDIR)/pseudo-packages.description
MAINTAINER ?= Unclaimed Package <lnx-bbc-devel@zork.net>
DESCRIPTION ?= This package has no description.  Please mail $(MAINTAINER) and ask that one be added.
CVSURL ?= http://cvs.lnx-bbc.org/cvs/gar/

debbugs:
	@echo "	Package: $(GARNAME)"
	@echo "		Maintainer: $(subst ",\",$(subst \$,\\$,$(MAINTAINER)))"
	@echo "		Description: $(subst ",\",$(subst \$,\\$,$(DESCRIPTION)))"
	@echo "$(GARNAME)		$(subst ",\",$(subst \$,\\$,$(MAINTAINER)))" >> $(BUGMAINT)
	@echo "$(GARNAME)		$(subst ",\",$(subst \$,\\$,$(DESCRIPTION)))" >> $(BUGDESC)


define HTMLTEMPLATE
<html>\n
<head>\n
\t<title>$(GARNAME)</title>\n
\t<link rel="stylesheet" type="text/css" href="$(STYLESHEET)">\n
</head>\n
<body>\n
<h1>$(GARNAME) -- $(DESCRIPTION)</h1>\n
<p>$(subst 

,\n</p><p>\n,$(BLURB))</p>
\n
\t<h2>Categories</h2>\n
\t<p>\n
\t\t<ul>\n
\t\t$(foreach CATEGORY,$(CATEGORIES),<li>$(CATEGORY)</li>)\n
\t\t</ul>\n
\t</p>\n
\n
\t<h2>Version</h2>\n
\t<p>$(GARVERSION)</p>\n
\n
\t<h2>Maintainer</h2>\n
\n<p>$(subst <,&lt;,$(subst >,&gt;,$(MAINTAINER)))</p>\n
\n
\t<h2>License</h2>\n
\t\t<ul>\n
\t\t$(foreach TTT,$(LICENSE) $(LICENCE) $(COPYING),<li>$(TTT)</li>)\n
\t\t</ul>\n
\n
$(DEPENDSHTML)
$(BUILDDEPSHTML)
$(shell test -e $(DEBBUGSDIR)/db/pa/l$(GARNAME).html && echo -n '<h2>Bugs</h2>\n<p><a href="$(DEBBUGURL)/db/pa/l$(GARNAME).html">See the list of bugs for $(GARNAME).</a></p>\n')
\t<h2>CVS</h2>\n
<p><a href="$(CVSURL)$(GARCATEGORY)$(GARNAME)/">Browse the CVS directory for $(GARNAME)</a></p>\n
<hr/>\n
<a href="$(PACKAGEURL)">Return to package list</a>\n
</body>\n
</html>
endef

ifdef BUILDDEPS
define BUILDDEPSHTML
\t<h2>Build Dependencies</h2>\n
\t<p>\n
\t\t<ul>\n
\t\t$(foreach DEP,$(BUILDDEPS),<li><a href="$(PACKAGEURL)/$(DEP).html">$(DEP)</a></li>)\n
\t\t</ul>\n
\t</p>\n
endef
endif

define REALDEPENDSHTML
\t<h2>Dependencies</h2>\n
\t<p>\n
\t\t<ul>\n
\t\t$(foreach DEP,$(LIBDEPS),<li><a href="$(PACKAGEURL)/$(DEP).html">$(DEP)</a></li>)\n
\t\t</ul>\n
\t</p>\n
endef

ifneq "$(LIBDEPS)" ""
DEPENDSHTML = $(REALDEPENDSHTML)
endif

ifneq "$(DEPENDS)" ""
DEPENDSHTML = $(REALDEPENDSHTML)
endif

export HTMLTEMPLATE

webpages:
	@echo -e $${HTMLTEMPLATE} > $(HTMLDIR)/$(GARNAME).html
	@echo "<li><dt><a href=\"$(CATEGORYURL)$(GARNAME).html\">$(GARNAME)</a> </dt><dd> $(DESCRIPTION)</blockquote></dd></li>" >> $(HTMLINDEX)

webtest:
	@echo -e $${HTMLTEMPLATE}
