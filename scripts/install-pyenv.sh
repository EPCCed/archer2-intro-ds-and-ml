#!/bin/bash


# Please note, module load commands are specific to the ARCHER2 system.
module -q load PrgEnv-gnu
module -q load cray-python


PYENV_ROOT=${HOME/home/work}/../shared/pyenv

python -m venv --system-site-packages ${PYENV_ROOT}

source ${PYENV_ROOT}/bin/activate


python -m pip install --upgrade pip
python -m pip install --upgrade scipy

python -m pip install matplotlib
python -m pip install seaborn

python -m pip install cloudpickle
python -m pip install jupyter
python -m pip install jupyterlab

python -m pip install scikit-learn
python -m pip install scikit-image

python -m pip install torch==2.3.1+cpu --extra-index-url https://download.pytorch.org/whl/cpu
python -m pip install torchvision==0.18.1+cpu --extra-index-url https://download.pytorch.org/whl/cpu
python -m pip install torchtext==0.18.0 --extra-index-url https://download.pytorch.org/whl/cpu
python -m pip install torchaudio==2.3.1+cpu --extra-index-url https://download.pytorch.org/whl/cpu



# add extra activate commands
MARK="# you cannot run it directly"
CMDS="${MARK}\n\n"
CMDS="${CMDS}module -q load PrgEnv-gnu\n"
CMDS="${CMDS}module -q load cray-python\n\n"
CMDS="${CMDS}CRAY_PYTHON_VER=\`echo \${CRAY_PYTHON_LEVEL} | cut -d'.' -f1-2\`\n"
CMDS="${CMDS}PYTHONUSERSITEPKGS=${PYENV_ROOT}/lib/python\${CRAY_PYTHON_VER}/site-packages\n"
CMDS="${CMDS}if [[ \${PYTHONPATH} != *\"\${PYTHONUSERSITEPKGS}\"* ]]; then\n"
CMDS="${CMDS}  export PYTHONPATH=\${PYTHONUSERSITEPKGS}\:\${PYTHONPATH}\n"
CMDS="${CMDS}fi\n\n"

sed -ri "s:${MARK}:${CMDS}:g" ${PYENV_ROOT}/bin/activate


# add extra deactivation commands
INDENT="        "
MARK="unset -f deactivate"
CMDS="${MARK}\n\n"
CMDS="${CMDS}${INDENT}export PYTHONPATH=\`echo \${PYTHONPATH} | sed \"\s\:\${PYTHONUSERSITEPKGS}\\\\\:\:\:\g\"\`\n"

sed -ri "s:${MARK}:${CMDS}:g" ${PYENV_ROOT}/bin/activate


deactivate
