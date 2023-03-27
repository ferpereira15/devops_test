FROM ubuntu:latest

RUN apt-get update && apt-get install -y python2 python3-pip

RUN pip install flask

COPY helloWorld.py /opt/

ENTRYPOINT FLASK_APP=/opt/helloWorld.py flask run --host=0.0.0.0 --port=8080