#!/usr/bin/env bash

. "$CONDA_PREFIX/etc/profile.d/conda.sh" # enable activation of the conda environment within script

conda activate base

pref_conda=$(echo $CONDA_PREFIX)

echo "==========================================Creating the HIV-DRIVES environment========================="

conda create -n HIV-DRIVES python=3.9.0 -y

conda activate HIV-DRIVES

HIVDIR="${pref_conda}/envs/HIV-DRIVES"

mkdir ${HIVDIR}/accessories

echo "==================installing dependencies===================================================="

pip install requests

pip install more-itertools==9.1.0

pip install orjson==3.9.1

pip install types-setuptools==67.8.0.0

pip install Cython==0.29.32

pip install https://github.com/hivdb/post-align/archive/8e2ee118261987208c17add6cef5c1270e325a4c.zip

cd; git clone http://github.com/PoonLab/sierra-local

cd sierra-local

sudo ${pref_conda}/envs/HIV-DRIVES/bin/python3 setup.py install

${pref_conda}/envs/HIV-DRIVES/bin/python3 ${HOME}/HIV-DRIVES/algorithm/updater.py

conda install -c bioconda trim-galore -y

conda install -c bioconda minimap2 -y

conda install -c conda-forge r-base=4.1.1 r-rmarkdown=2.14 r-jsonlite=1.8.0 r-knitr=1.39 r-dplyr=1.0.9 r-kableextra r-tidyr=1.2.0 -y

conda create --prefix ${pref_conda}/envs/HIV-DRIVES/quasi -c bioconda quasitools=0.7.0 -y

echo "===============================getting human genome indexes========================================"

wget https://genome-idx.s3.amazonaws.com/bt/GRCh38_noalt_as.zip

mkdir -p data/reference

unzip GRCh38_noalt_as.zip

mv GRCh38_noalt_as data/reference

rm GRCh38_noalt_as.zip

mv ${HOME}/HIV-DRIVES/algorithm ${HIVDIR}/accessories/
mv ${HOME}/HIV-DRIVES/bin ${HIVDIR}/accessories/
mv ${HOME}/HIV-DRIVES/data* ${HIVDIR}/accessories/

#echo "export PATH=$PATH:$HOME/HIV-DRIVES/bin/" >> ~/.bashrc

echo "export PATH=${HIVDIR}/accessories/bin/:$PATH" >> ~/.bashrc

source ~/.bashrc

echo "======installation completed=========================="
