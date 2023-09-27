#!/usr/bin/env bash
. "$CONDA_PREFIX/etc/profile.d/conda.sh"
conda activate base
pref_conda=$(echo $CONDA_PREFIX)
conda activate HIV-DRIVES
HIVDIR="$pref_conda/envs/HIV-DRIVES"
mkdir "$HIVDIR"/accessories
pip install https://github.com/hivdb/post-align/archive/8e2ee118261987208c17add6cef5c1270e325a4c.zip
cd ~
git clone http://github.com/PoonLab/sierra-local
cd sierra-local
sudo "${pref_conda}"/envs/HIV-DRIVES/bin/python3 setup.py install
"${pref_conda}"/envs/HIV-DRIVES/bin/python3 "${HIVDIR}"/algorithm/updater.py
cd HIV-DRIVES
conda create --prefix ${pref_conda}/envs/HIV-DRIVES/quasi -c bioconda quasitools=0.7.0 -y
wget https://genome-idx.s3.amazonaws.com/bt/GRCh38_noalt_as.zip
mkdir -p data/reference
unzip GRCh38_noalt_as.zip
mv GRCh38_noalt_as data/reference
rm GRCh38_noalt_as.zip
mkdir -p "${pref_conda}"/envs/HIV-DRIVES/accessories
HIVDIR="${pref_conda}/envs/HIV-DRIVES"
mkdir "${HIVDIR}"/accessories
mv algorithm "${HIVDIR}"/accessories/ && mv bin "${HIVDIR}"/accessories/ && mv data* "${HIVDIR}"/accessories/
echo "export PATH=${HIVDIR}/accessories/bin/:$PATH" >>~/.bashrc
source ~/.bashrc
touch ../clean.sh &
echo "#!/usr/bin/env bash" >../clean.sh
echo "rm -rf HIV-DRIVES" >>../clean.sh
chmod 777 ../clean.sh
cd
bash clean.sh
