FROM 913932804865.dkr.ecr.eu-central-1.amazonaws.com/clarity/data/base:3.10

RUN apt-get update && apt-get -y install curl

COPY . /opt/project
WORKDIR /opt/project

RUN pipenv install --system --deploy --ignore-pipfile

CMD ["/bin/bash", "-c", "./entrypoint.sh"]