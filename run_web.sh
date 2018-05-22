#!/bin/sh

echo "Starting collectstatic command"
python3 /home/docker/code/app/manage.py collectstatic --no-input

echo "Starting collectstatic makemigrations"
python3 /home/docker/code/app/manage.py makemigrations

echo "Starting collectstatic migrate"
python3 /home/docker/code/app/manage.py migrate

echo "Server Starting"
supervisord -n
