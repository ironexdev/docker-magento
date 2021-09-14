FROM elastic/filebeat:7.13.3

ARG DOCKER_DIRECTORY

USER root

COPY --chown=filebeat:filebeat $DOCKER_DIRECTORY/images/filebeat/filebeat.yml /usr/share/filebeat/filebeat.yml

USER filebeat

WORKDIR /home/filebeat
