FROM kibana:7.12.1

ARG DOCKER_IMAGE_FOLDER

USER root

COPY --chown=kibana:kibana $DOCKER_IMAGE_FOLDER/kibana/kibana.yml /usr/share/kibana/config/kibana.yml

USER kibana