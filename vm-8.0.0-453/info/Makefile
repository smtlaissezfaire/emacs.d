

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
datadir= $(prefix)/share
datarootdir= ${prefix}/share
info_dir = ${datarootdir}/info

EMACS_PROG = emacs
EMACS_FLAVOR = emacs

FLAGS = -batch -q -no-site-file -no-init-file -l $(srcdir)/vm-build.el

SYMLINKS = no
LINKPATH = 

##############################################################################

all: info

info: vm.info vm-pcrisis.info

Makefile: ./Makefile.in
	cd ./..; ./config.status

install: install-pkg

install-pkg: uninstall-pkg info
	@mkdir -p -m 0755 $(info_dir);                                 \
	if test "x$(SYMLINKS)" = "xno" ; then                          \
          for i in `ls *.info* ` ; do                                  \
	    echo "Installing $$i in $(info_dir)" ;                     \
            $(INSTALL_DATA) $$i $(info_dir) ;                          \
          done ;                                                       \
        else                                                           \
          if test "x$(LINKPATH)" = "x" ; then                          \
            for i in `ls *.info* ` ; do                                \
              echo "Linking $$i in $(info_dir)" ;                      \
              $(LN_S) `pwd`/$$i $(info_dir)/$$i ;                      \
            done ;                                                     \
          else                                                         \
            for i in `ls *.info* ` ; do                                \
              echo "Linking $(LINKPATH)/texinfo/$$i in $(info_dir)" ;  \
              $(LN_S) $(LINKPATH)/texinfo/$$i $(info_dir)/$$i ;        \
            done ;                                                     \
          fi ;                                                         \
        fi
	@echo VM INFO files successfully installed\!

uninstall-pkg:
	-$(RM) $(info_dir)/vm*.info*

##############################################################################
clean:
	-$(RM) -f *.info *.info-[0-9]

distclean: clean
	-$(RM) -f Makefile

