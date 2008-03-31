

# no csh please
SHELL = /bin/sh

SOURCES = vm-version.el $(wildcard *.el)

##############################################################################
# location of required programms
prefix = /usr/local
MKDIR = /bin/mkdir
RM   = /bin/rm
LS   = /bin/ls
XARGS = xargs
INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_SCRIPT = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644

top_srcdir = ..
srcdir = .
datadir= $(prefix)/share/vm
datarootdir= ${prefix}/share
lispdir = $(prefix)/share/emacs/site-lisp/vm/pixmaps

EMACS_PROG = emacs
EMACS_FLAVOR = emacs

FLAGS = -batch -q -no-site-file -no-init-file -l $(srcdir)/vm-build.el

SYMLINKS = no
LINKPATH = 

##############################################################################

all:

Makefile: ./Makefile.in
	cd ./..; ./config.status

install: install-pkg

install-pkg: 
	$(MKDIR) -p $(lispdir)/mime
	@for i in `ls *.xpm` ; do                                      \
	    echo "Installing $$i in $(lispdir)" ;                      \
	    $(INSTALL_DATA) $$i $(lispdir) ;                           \
	done ;                                                         \
	for i in `ls mime/*.xpm` ; do                                  \
	    echo "Installing $$i in $(lispdir)" ;                      \
	    $(INSTALL_DATA) $$i $(lispdir)/mime ;                      \
	done ;                                                         
	@echo VM pixmaps successfully installed\!

##############################################################################
clean:
	-$(RM) -f *.info *.info-[0-9]

distclean: clean
	-$(RM) -f Makefile

