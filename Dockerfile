FROM python:3.8-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV CRYPTOGRAPHY_DONT_BUILD_RUST 1

 
RUN apk add --virtual build-deps  g++ libffi-dev jpeg-dev zlib-dev openssl-dev

WORKDIR /app
COPY requirements.txt requirements.txt
RUN  pip install --upgrade pip
RUN  pip install -r requirements.txt
COPY . .
RUN apk del build-deps
EXPOSE 8000
