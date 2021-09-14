FROM nginx:1.20.0-alpine

ARG GROUP_ID
ARG USER_ID

RUN addgroup -g $GROUP_ID -S dockeruser

RUN adduser -S -G dockeruser -u $USER_ID -s /bin/ash dockeruser

RUN chown -R dockeruser:dockeruser /var/cache/nginx

RUN chmod -R 770 /var/cache/nginx

RUN touch /var/run/nginx.pid

RUN chown -R dockeruser:dockeruser /var/run/nginx.pid

RUN unlink /var/log/nginx/access.log && touch /var/log/nginx/access.log && chown dockeruser /var/log/nginx/access.log

RUN unlink /var/log/nginx/error.log && touch /var/log/nginx/error.log && chown dockeruser /var/log/nginx/error.log

USER dockeruser

WORKDIR /home/dockeruser
