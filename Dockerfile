FROM python:3.8-slim
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update
RUN  apt-get install -y libmariadb-dev gcc python-dev

WORKDIR /app
COPY requirements.txt requirements.txt
RUN  pip install --upgrade pip
RUN  pip install -r requirements.txt
COPY . .
EXPOSE 8000