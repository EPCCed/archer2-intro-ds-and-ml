source ${HOME/home/work}/pyenv/bin/activate

echo ""
echo "Once JupyterLab server has started, remember to create SSH tunnel, e.g.,"
echo "ssh ${USER}@login.archer2.ac.uk -L8888:${HOSTNAME}:8888"
echo ""

export JUPYTER_RUNTIME_DIR=$(pwd)
jupyter lab --ip=0.0.0.0 --no-browser
