#/!bin/sh

FS_HOME=`dirname $0`;

mkdir $FS_HOME/tmp;
mv $FS_HOME/formelsamling.tex $FS_HOME/graph.mp $FS_HOME/cover.svg $FS_HOME/cover.pdf $FS_HOME/tmp;
rm -f $FS_HOME/formelsamling.* $FS_HOME/graph.* $FS_HOME/texnum.mpx $FS_HOME/texput.log $FS_HOME/cover.*;
mv $FS_HOME/tmp/* $FS_HOME;
rm -rf $FS_HOME/tmp;

