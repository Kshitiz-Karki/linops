#!/bin/bash
#https://developer.fedoraproject.org/tech/languages/python/multiple-pythons.html
sudo dnf install python3.11
python3.11 --version

python3.11 -m venv --prompt . .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python3 -m pip install pytest pytest-cache pytest-subtests pytest-pylint
