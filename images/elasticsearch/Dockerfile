FROM elasticsearch:7.12.1

# ARG GROUP_ID
# ARG USER_ID
#
# RUN groupmod -g $GROUP_ID elasticsearch
# RUN usermod -u $USER_ID -g $GROUP_ID elasticsearch
# RUN chown -R elasticsearch /usr/share/elasticsearch
# RUN sed -i -e "s/--userspec=1000/--userspec=$USER_ID/g" \
#            -e "s/UID 1000/UID $USER_ID/" \
#            -e "s/chown -R 1000/chown -R $USER_ID/" /usr/local/bin/docker-entrypoint.sh
# RUN chown elasticsearch /usr/local/bin/docker-entrypoint.sh

COPY --chown=elasticsearch:elasticsearch ./images/elasticsearch/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

USER elasticsearch