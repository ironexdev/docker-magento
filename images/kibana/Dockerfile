FROM kibana:7.12.1

USER root

COPY --chown=kibana:kibana docker/images/kibana/kibana.yml /usr/share/kibana/config/kibana.yml

USER kibana

WORKDIR /home/kibana