#!/bin/bash 

#-------------------------------------------------
# This script is executed as entry point to container
#-------------------------------------------------

#make executable
chmod +x /tmp/compile_report.R

#and run a script that loads rmarkdown and compiles the report
Rscript /tmp/compile_report.R
