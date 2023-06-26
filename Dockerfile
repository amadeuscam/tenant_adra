FROM ubuntu:20.04
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update
RUN  apt-get install -y wget
RUN  wget http://launchpadlibrarian.net/383018194/pdftk-java_0.0.0+20180723.1-1_all.deb
RUN  apt install -y default-jre-headless libcommons-lang3-java libbcprov-java
RUN  dpkg -i pdftk-java_0.0.0+20180723.1-1_all.deb
 
RUN  apt-get install -y libmariadb-dev gcc  python3 python3-dev python3-pip

WORKDIR /app
COPY requirements.txt requirements.txt
RUN  pip3 install --upgrade pip
RUN  pip3 install -r requirements.txt
COPY . .
EXPOSE 8000