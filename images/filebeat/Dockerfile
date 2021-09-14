FROM elastic/filebeat:7.13.3

USER root

COPY --chown=filebeat:filebeat ./images/filebeat/filebeat.yml /usr/share/filebeat/filebeat.yml

USER filebeat
