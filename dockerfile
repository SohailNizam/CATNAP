# Start by pulling ubuntu image
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y r-base
RUN apt-get install -y pandoc
RUN apt-get install -y vim

#RUN mkdir -p wget_test_dir
#WORKDIR wget_tes:t_dir/

#RUN wget -r  https://www.hiv.lanl.gov/cgi-bin/common_code/download.cgi?/scratch/NEUTRALIZATION/assay.txt

# a script to install rmarkdown package
COPY requirements.R /tmp/requirements.R

# a script to run compile_report.R
COPY run_remote.sh /tmp/run_remote.sh

# this loads rmarkdown and compiles Untitled.Rmd
COPY compile_report.R /tmp/compile_report.R

# Untitled.Rmd is a test Rmarkdown file to try and compile into a report
COPY Untitled.Rmd /tmp/Untitled.Rmd

# make run_remote executable
RUN chmod +x /tmp/run_remote.sh

# install required libs on container at build time
RUN chmod +x /tmp/requirements.R
RUN /tmp/requirements.R

RUN mkdir /out_dir

# entry point to container runs run_remote.sh
#run_remote.sh compiles the rmarkdown file
CMD /tmp/run_remote.sh




