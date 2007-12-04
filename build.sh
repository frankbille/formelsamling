#!/bin/sh

cd /home/fb/Documents/Formelsamling;

./clean.sh;
mpost --interaction nonstopmode graph.mp;
pdflatex -interaction=nonstopmode formelsamling.tex;
pdflatex -interaction=nonstopmode formelsamling.tex;
pdflatex -interaction=nonstopmode formelsamling.tex;

