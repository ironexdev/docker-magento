FROM kibana:7.12.1

ARG DOCKER_DIRECTORY

USER root

COPY --chown=kibana:kibana $DOCKER_DIRECTORY/images/kibana/kibana.yml /usr/share/kibana/config/kibana.yml

USER kibana

WORKDIR /home/kibana