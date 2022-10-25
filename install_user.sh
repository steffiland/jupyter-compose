cd
mkdir notebooks
mkdir .jupyter
rm /tmp/install_user.sh

cat > environment.yml <<eom
name: jupyterenv
channels:
  - conda-forge
dependencies:
  - pip 
  - jupyter
  - rise
  - jupyterthemes
  - jupyter_contrib_nbextensions
  - jupyterlab-git
eom

# we could create a conda lockfile to pin the versions
# mamba lock -p linux-64 -f environment.yml
# conda-linux-64.lock

mamba env create -p ./env -f environment.yml
#mamba env create --copy -p ./env --file conda-linux-64.lock
mamba clean -afy

mamba activate ./env
mamba init

# see https://pythonspeed.com/articles/activate-conda-dockerfile/ but we use mamba instead of conda, because faster

##micromamba install -y -n base -f /tmp/environment.yaml 
##micromamba clean --all --yes