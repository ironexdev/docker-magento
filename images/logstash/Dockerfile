FROM logstash:7.13.2

ARG DOCKER_DIRECTORY

USER root

COPY --chown=logstash:logstash $DOCKER_DIRECTORY/images/logstash/pipeline/logstash.conf /usr/share/logstash/pipeline/logstash.conf

COPY --chown=logstash:logstash $DOCKER_DIRECTORY/images/logstash/logstash.yml /usr/share/logstash/config/logstash.yml

USER logstash

WORKDIR /home/logstash