

##############################################################################
# no csh please
SHELL = /bin/sh

SOURCES = $(wildcard *.c)

OBJECTS = $(SOURCES:.c=.o)

##############################################################################
# location of required programms
prefix = /usr/local
exec_prefix = ${prefix}
MKDIR = /bin/mkdir
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
bindir= ${exec_prefix}/bin

##############################################################################
all: $(SOURCES:.c=)

install:
	for i in $(SOURCES:.c=) ; do                               \
	  echo "Installing $$i in $(bindir)" ;                     \
          $(INSTALL_DATA) $$i $(bindir) ;                          \
        done ;
	@echo VM helper binaries successfully installed\!

##############################################################################
Makefile: ./Makefile.in
	cd ..; ./config.status

##############################################################################
clean:
	-$(RM) -f $(SOURCES:.c=)

distclean: clean
	-$(RM) -f Makefile

##############################################################################
release:
	TODO
