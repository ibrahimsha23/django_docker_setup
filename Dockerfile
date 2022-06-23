FROM ubuntu:latest

RUN apt-get -y update
RUN apt-get install python3 -y python3-pip

ENV PYTHONUNBUFFERED 1

COPY requirements.txt /app/requirements.txt
RUN pip3 install -r /app/requirements.txt

COPY .env .env
COPY mysite /app/mysite/
COPY nginx /app/nginx 

WORKDIR /app/

EXPOSE 8000
