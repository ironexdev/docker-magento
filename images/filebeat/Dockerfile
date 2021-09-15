FROM elastic/filebeat:7.13.3

ARG DOCKER_IMAGE_FOLDER

USER root

COPY --chown=filebeat:filebeat $DOCKER_IMAGE_FOLDER/filebeat/filebeat.yml /usr/share/filebeat/filebeat.yml