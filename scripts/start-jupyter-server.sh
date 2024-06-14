source ${HOME/home/work}/../shared/pyenv/bin/activate


export XDG_CACHE_HOME=${HOME/home/work}

export IPYTHONDIR=${XDG_CACHE_HOME}/.ipython

export JUPYTERDIR=${XDG_CACHE_HOME}/.jupyter
export JUPYTER_CONFIG_DIR=${JUPYTERDIR}
export JUPYTER_RUNTIME_DIR=${JUPYTERDIR}
export JUPYTER_DATA_DIR=${JUPYTERDIR}


if [ -z "${SLURMD_NODENAME}" ]; then
  NODEID=${HOSTNAME}
else
  NODEID=${SLURMD_NODENAME}
fi


echo -e "\n\nOnce JupyterLab server has started, remember to create SSH tunnel, e.g.,"
echo -e "ssh ${USER}@login.archer2.ac.uk -L8888:${NODEID}:8888\n\n"


export JUPYTER_RUNTIME_DIR=$(pwd)
jupyter lab --ip=0.0.0.0 --no-browser
