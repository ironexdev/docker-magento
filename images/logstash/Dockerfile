FROM logstash:7.13.2

USER root

COPY --chown=logstash:logstash docker/images/logstash/pipeline/logstash.conf /usr/share/logstash/pipeline/logstash.conf

COPY --chown=logstash:logstash docker/images/logstash/logstash.yml /usr/share/logstash/config/logstash.yml

USER logstash

WORKDIR /home/logstash