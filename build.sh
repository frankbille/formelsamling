#!/bin/sh

FS_HOME=`dirname $0`;

cd $FS_HOME;

$FS_HOME/clean.sh;
mpost --interaction nonstopmode $FS_HOME/graph.mp;
pdflatex -interaction=nonstopmode $FS_HOME/formelsamling.tex;
pdflatex -interaction=nonstopmode $FS_HOME/formelsamling.tex;
pdflatex -interaction=nonstopmode $FS_HOME/formelsamling.tex;

