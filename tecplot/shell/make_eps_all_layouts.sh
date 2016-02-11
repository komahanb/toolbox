#!/bin/bash
#######################################################################
# Author: Komahan Boopathy (komahan@gatech.edu)
#######################################################################
# This script export the all the Tecplot layout files (layout.lay) in
# the folder into figures of desired format.
#######################################################################
# PRE-REQUISITES:
# Environment variable TOOLBOX_DIR must be set and should have the
# macro in the path given (see the code for directory setup)
#######################################################################
#INPUT:
# Tecplot layout file (*.lay) (should be present in the directory)
# Optional command line argument: PDF/PNG. The default is EPS (fastest)
#######################################################################
#OUTPUT:
# (1) EPS file in the name of the layout
# (2) PDF file in the name of the layout
#######################################################################
#USAGE: 
# 1) Goto the directory where the layouts are present
# 2) ${TOOLBOX_DIR}/tecplot/shell/make_eps_all_layouts.sh
#######################################################################

for i in $( ls *.lay ); do
    
    # figure name is same as the name of the layout
    NAME=`echo "$i" | cut -d'.' -f1` 

    if [ "$1" = "PDF" ]; then

	#opens a layout and then exports as eps
	tec360 -mesa -b $i ${TOOLBOX_DIR}/tecplot/macros/exportEPS.mcr
       	mv __temp.eps $NAME.eps
	epstopdf $NAME.eps
	rm $NAME.eps

	echo "====================================="
	echo "$NAME.pdf created succesfully"
	echo "====================================="

    elif [ "$1" = "PNG" ]; then

	#opens a layout and then exports as PNG
	tec360 -mesa -b $i ${TOOLBOX_DIR}/tecplot/macros/exportPNG.mcr
	mv __temp.png $NAME.png
	echo "====================================="
	echo "$NAME.png created succesfully"
	echo "====================================="

    else 

	#opens a layout and then exports as eps
	tec360 -mesa -b $i ${TOOLBOX_DIR}/tecplot/macros/exportEPS.mcr
	mv __temp.eps $NAME.eps

	echo "====================================="
	echo "$NAME.eps created succesfully"
	echo "====================================="
    fi 

done
