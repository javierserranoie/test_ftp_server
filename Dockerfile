FROM python:3.10-slim

RUN apt-get update && apt-get -y install curl

COPY . /opt/project
WORKDIR /opt/project

RUN pipenv install --system --deploy --ignore-pipfile

CMD ["/bin/bash", "-c", "./cmd.sh"]