#!/usr/bin/env Rscript

library(rmarkdown)

rmarkdown::render("/out_dir/Untitled.Rmd", clean=TRUE, output_format="html_document")

