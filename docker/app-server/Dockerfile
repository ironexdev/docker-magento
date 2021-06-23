FROM nginx:1.20.0-alpine

ARG GROUP_ID
ARG USER_ID

RUN addgroup -g $GROUP_ID -S lopata

RUN adduser -S -G lopata -u $USER_ID -s /bin/ash lopata

RUN chown -R lopata:lopata /var/cache/nginx

RUN chmod -R 770 /var/cache/nginx

RUN touch /var/run/nginx.pid

RUN chown -R lopata:lopata /var/run/nginx.pid

USER lopata