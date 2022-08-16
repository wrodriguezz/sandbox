#!/bin/bash

# usage: ./lib-installer.sh <ubuntu_version>

default="20.4"
VERSION=${1-$default}

wget https://raw.githubusercontent.com/Bioconductor/BBS/master/Ubuntu-files/${VERSION}/apt_cran.txt
apt-get install $(grep -vE "^\s*#" apt_cran.txt | cut -f 1 -d " ") -y
rm apt_cran.txt

wget https://raw.githubusercontent.com/Bioconductor/BBS/master/Ubuntu-files/${VERSION}/apt_bioc.txt
apt-get install $(grep -vE "^\s*#" apt_bioc.txt | cut -f 1 -d " ") -y
rm apt_bioc.txt
