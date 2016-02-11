#!/bin/bash
#
# Author: Komahan Boopathy (komahan@gatech.edu)
#
# This script export the all tecplot layouts (layout.lay) in the
# folder into eps and then to PDF
#
#INPUT:
# 1) tecplot export macro (exportEPS.mcr) in the same directory
# 2) layout file (*.lay) (should be present in the directory)
#OUTPUT:
# (1) EPS file in the name of the layout
# (2) PDF file in the name of the layout
#EXAMPLE: 
# plot.lay is exported into plot.eps and then to plot.pdf

for i in $( ls *.lay ); do
    
    let counter=counter+1
    
    #opens a layout and then exports as eps
    ${HOME}/install/tecplot360ex/bin/tec360 -mesa -b $i $1
    
    #get a filename to the figure based on the layout file
    NAME=`echo "$i" | cut -d'.' -f1` 
    
    mv __temp.eps $NAME.eps
    
    epstopdf $NAME.eps
    
    echo "====================================="
    echo "$NAME.eps created succesfully"
    echo "====================================="
    
done

