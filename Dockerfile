FROM python:3.7-alpine

MAINTAINER Vojtech Janousek

ENV PYTHONUNBUFFERED 1

RUN mkdir /code
WORKDIR /code
COPY . /code/

RUN pip install --upgrade pip
RUN apk --update add jpeg-dev
RUN apk --update add --virtual .tmp-build-deps \
    gcc libc-dev linux-headers zlib zlib-dev

RUN pip install -r requirements.txt
