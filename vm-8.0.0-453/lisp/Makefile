

##############################################################################
# no csh please
SHELL = /bin/sh

# the list of source files 
SOURCES = vm-version.el
SOURCES += vm.el
SOURCES += vm-autoload.el
SOURCES += vm-avirtual.el
SOURCES += vm-biff.el
SOURCES += vm-crypto.el
SOURCES += vm-delete.el
SOURCES += vm-digest.el
SOURCES += vm-easymenu.el
SOURCES += vm-edit.el
SOURCES += vm-folder.el
SOURCES += vm-grepmail.el
SOURCES += vm-imap.el
SOURCES += vm-license.el
SOURCES += vm-macro.el
SOURCES += vm-mark.el
SOURCES += vm-menu.el
SOURCES += vm-message.el
SOURCES += vm-message-history.el
SOURCES += vm-mime.el
SOURCES += vm-minibuf.el
SOURCES += vm-misc.el
SOURCES += vm-motion.el
SOURCES += vm-mouse.el
SOURCES += vm-page.el
SOURCES += vm-pcrisis.el
SOURCES += vm-pgg.el
SOURCES += vm-pine.el
SOURCES += vm-pop.el
SOURCES += vm-ps-print.el
SOURCES += vm-reply.el
SOURCES += vm-rfaddons.el
SOURCES += vm-save.el
SOURCES += vm-search.el
SOURCES += vm-serial.el
SOURCES += vm-sort.el
SOURCES += vm-startup.el
SOURCES += vm-summary.el
SOURCES += vm-summary-faces.el
SOURCES += vm-thread.el
SOURCES += vm-toolbar.el
SOURCES += vm-undo.el
SOURCES += vm-user.el
SOURCES += vm-vars.el
SOURCES += vm-vcard.el
SOURCES += vm-version.el
SOURCES += vm-virtual.el
SOURCES += vm-window.el

SOURCES += vcard.el
SOURCES += tapestry.el

# to list of object files 
ifeq (emacs,emacs)
OBJECTS = vm-autoloads.elc
else
OBJECTS = auto-autoloads.elc custom-load.elc
endif

OBJECTS += $(SOURCES:.el=.elc)

INSTALL_FILES = $(SOURCES) $(OBJECTS) vm-revno.elc

# for autoload generation 
AUTOLOAD_PACKAGE_NAME = (setq autoload-package-name \"vm\")
AUTOLOAD_FILE = (setq generated-autoload-file \"./auto-autoloads.el\")

##############################################################################
# location of required programms
BZR = bzr --no-plugins
RM   = /bin/rm
LS   = /bin/ls
XARGS = xargs
INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_SCRIPT = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644

prefix = /usr/local
top_srcdir = ..
srcdir = .
datadir= $(prefix)/share
datarootdir= ${prefix}/share
lispdir = $(prefix)/share/emacs/site-lisp/vm

EMACS_PROG = emacs
EMACS_FLAVOR = emacs

FLAGS = -batch -q -no-site-file -no-init-file -l $(srcdir)/vm-build.el

EMACS_COMP = lispdir=$(lispdir) srcdir=$(srcdir) $(EMACS_PROG) $(FLAGS)

export OTHERDIRS = 

SYMLINKS = no
LINKPATH = 

.el.elc:
	$(EMACS_PROG) $(FLAGS) -f batch-byte-compile $<

##############################################################################
all: $(OBJECTS)

install: install-el install-elc

##############################################################################
vm-revno.el:
	echo ";;; This is a generated file, do not edit it!" > vm-revno.el
	echo "(setq vm-revno \"`$(BZR) nick`-`$(BZR) revno`\")" >> vm-revno.el
	echo "(setq vm-author \"`$(BZR) whoami`\")" >> vm-revno.el

##############################################################################
# GNU Emacs's vm-autoload file
vm-autoloads.el: $(SOURCES:%=./%)
	-$(RM) $@
	echo > $@
	(build_dir=`pwd`; cd .; \
	 $(EMACS_PROG) $(FLAGS) -l autoload \
		-f vm-built-autoloads "/Users/smt/Downloads/vm-8.0.0-453/lisp/$@" `pwd`)
	echo "(custom-add-load 'vm 'vm-vars)" >> $@
	echo "(provide 'vm-autoloads)" >> $@

##############################################################################
# XEmacs#s auto-autoloads and custom-load file
auto-autoloads.el: $(SOURCES:%=./%)
	-$(RM) $@
#	(build_dir=`pwd`; cd .; \
#	 $(EMACS_PROG) $(FLAGS) -l autoload \
#		-f vm-built-autoloads "/Users/smt/Downloads/vm-8.0.0-453/lisp/$@" `pwd`)
	$(EMACS_PROG) $(FLAGS) \
                -eval "$(AUTOLOAD_PACKAGE_NAME)" \
                -eval "$(AUTOLOAD_FILE)" \
                -l autoload -f batch-update-autoloads $^
	# avoid getting an error about an already loaded vm-autoloads
	mv $@ $@.tmp
	echo "(setq features (delete 'vm-autoloads features))" > $@
	cat $@.tmp >> $@
	echo "(setq features (delete 'vm-autoloads features))" >> $@
	$(RM) $@.tmp


custom-load.el: $(SRCS:%=./%)
	$(EMACS_PROG) $(FLAGS) -l cus-dep -f Custom-make-dependencies .

##############################################################################
install-pkg: all vm-revno.elc
	@if test "x$(SYMLINKS)" = "xno" ; then                 \
	  mkdir -p -m 0755 $(PACKAGEDIR);                      \
	  for i in $(SRCS:%=./%) $(INSTALL_FILES) ; do  \
	    echo "Installing $$i in $(PACKAGEDIR)" ;           \
	    $(INSTALL_DATA) $$i $(PACKAGEDIR) ;                \
	  done ;                                               \
	else                                                   \
	  if test "x$(LINKPATH)" = "x" ; then                  \
	    $(LN_S) `pwd` $(PACKAGEDIR) ;                      \
	  else                                                 \
	    $(LN_S) $(LINKPATH)/lisp $(PACKAGEDIR) ;           \
	  fi ;                                                 \
	fi
	@echo VM ELISP files successfully installed\!

# This entry will never install .el files if there are no .elc files.
install-el: all vm-revno.elc
	$(INSTALL) -d -m 0755 $(lispdir)/
	for elc in *.elc; do                                                  \
	    el=`basename $$elc c`;                                            \
	    if test -f "$(srcdir)/$$el"; then                                 \
	        echo "Install $$el in $(lispdir)/";                           \
	        $(INSTALL_DATA) ${srcdir}/$$el $(lispdir)/;                   \
	    fi;                                                               \
        done;
	if $(LS) $(contrib)/*.elc > /dev/null 2>&1; then                      \
	    for elc in $(contribdir)/*.elc; do                                \
	        el=`basename $$elc c`;                                        \
	        if test -f "${srcdir}/$(contribdir)/$$el"; then               \
	            echo "Install $(contribdir)/$$el in $(lispdir)/";         \
	            $(INSTALL_DATA) ${srcdir}/$(contribdir)/$$el $(lispdir)/; \
	        fi;                                                           \
	    done;                                                             \
	fi;

install-elc: all vm-revno.elc
	$(INSTALL) -d -m 0755 $(lispdir)/
	for elc in *.elc; do                                 \
	    echo "Install $$elc in $(lispdir)/";             \
	    $(INSTALL_DATA) $$elc $(lispdir)/;               \
        done;
	if $(LS) $(contribdir)/*.elc > /dev/null 2>&1; then  \
	    for elc in $(contribdir)/*.elc; do               \
	        echo "Install $$elc in $(lispdir)";          \
	        $(INSTALL_DATA) $$elc $(lispdir);            \
	    done;                                            \
	fi;



##############################################################################
Makefile: ./Makefile.in
	cd ..; ./config.status

##############################################################################
clean:
	-$(RM) -f *.elc vm-autoloads.el auto-autoloads.el custom-load.el

distclean: clean
	-$(RM) -f Makefile

