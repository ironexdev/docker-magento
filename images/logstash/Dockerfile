FROM logstash:7.13.2

ARG DOCKER_IMAGE_FOLDER

USER root

COPY --chown=logstash:logstash $DOCKER_IMAGE_FOLDER/logstash/pipeline/logstash.conf /usr/share/logstash/pipeline/logstash.conf

COPY --chown=logstash:logstash $DOCKER_IMAGE_FOLDER/logstash/logstash.yml /usr/share/logstash/config/logstash.yml

USER logstashw