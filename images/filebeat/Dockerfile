FROM elastic/filebeat:7.13.3

USER root

COPY --chown=filebeat:filebeat docker/images/filebeat/filebeat.yml /usr/share/filebeat/filebeat.yml

USER filebeat

WORKDIR /home/filebeat
