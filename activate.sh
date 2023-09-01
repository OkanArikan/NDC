#!/bin/bash

MY_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Make sure the workspace is in the python path
export PYTHONPATH="${PYTHONPATH}:${MY_DIR}"

export VENV_NAME="${MY_DIR}/.venv"

# The python virtual envisonment must exist
if ! [ -f "${VENV_NAME}/bin/activate" ]
then
    python3 -m venv "${VENV_NAME}"

    # Get into the virtual environment
    source "${VENV_NAME}/bin/activate"

    # Update pip3
    pip3 install --upgrade pip setuptools wheel

    # Install the global python pip requirements
    pip3 install -q --upgrade -r "${MY_DIR}/requirements.txt"
else
    source "${VENV_NAME}/bin/activate"    
fi