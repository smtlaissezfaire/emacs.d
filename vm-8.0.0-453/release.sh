#!/bin/sh

bzr diff || exit 1

make
bzr="bzr --no-plugins --no-aliases"
nick=`$bzr nick`
revno=`$bzr revno`
rdir=$nick-$revno
dir="release/$rdir"
rm -rf $dir
mkdir -p release
$bzr export $dir
cp configure $dir
(cd lisp; rm vm-revno.el; make vm-revno.el)
cp lisp/vm-revno.el $dir/lisp
echo 'Version: $Id: '$rdir'$' > $dir/id
cd release
tar cvfz $rdir.tgz $rdir
cd ..
if [ -n "$1" -a -e "$1" ]; then
  ./$1 $dir.tgz $nick $revno;
fi
