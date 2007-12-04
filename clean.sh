#/!bin/sh

cd /home/fb/Documents/Formelsamling;

mkdir tmp;
mv formelsamling.tex graph.mp tmp;
rm -f formelsamling.* graph.* texnum.mpx texput.log;
mv tmp/* .;
rm -rf tmp;

