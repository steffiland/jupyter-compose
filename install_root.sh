useradd -m jup
#echo Updating conda
#/opt/conda/bin/conda update -n base -c defaults conda
###echo installing jupyter
###/opt/conda/bin/conda install jupyter -y
###echo installing jupyter extensions
###EXTENSIONS="jupyter_contrib_nbextensions jupyterthemes rise jupyterlab-git"
###/opt/conda/bin/conda install -c conda-forge $EXTENSIONS -y && /opt/conda/bin/jupyter contrib nbextension install -y

rm install_root.sh