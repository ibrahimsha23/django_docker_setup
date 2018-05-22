FROM ubuntu:16.04

ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-dev \
    python3-setuptools \
    python3-pip \
    python-enchant \
    nginx \
    supervisor && \
    pip3 install -U pip setuptools

RUN pip3 install uwsgi


RUN mkdir -p /home/docker/code/app/

COPY requirements.txt /home/docker/code/app/

RUN pip3 install -r /home/docker/code/app/requirements.txt

COPY . /home/docker/code/app/

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

COPY mysite_nginx.conf /etc/nginx/sites-available/default

COPY supervisor-app.conf /etc/supervisor/conf.d/

COPY uwsgi_params /home/docker/code/app/

COPY uwsgi.ini /home/docker/code/app/

EXPOSE 8000

WORKDIR /home/docker/code/app/

COPY run_web.sh /home/docker/code/

RUN mkdir -p /home/docker/code/app/staticfiles

RUN ["chmod", "+x", "/home/docker/code/run_web.sh"]
