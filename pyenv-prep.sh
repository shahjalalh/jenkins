#!/bin/bash

# virtual environment setup script for python projects

PROJECT=$1

cd /home/workspace/"$PROJECT"
if [ -d py3env ]; then
    source py3env/bin/activate
    cd "$PROJECT"
else
    virtualenv -p /usr/bin/python3 py3env
    source py3env/bin/activate
    cd "$PROJECT"
fi

# running isort
docker-compose run app bash -c "isort"

# running pylint
docker-compose run app bash -c "pylint"

# running test
docker-compose run app bash -c "python manage.py test"

deactivate
