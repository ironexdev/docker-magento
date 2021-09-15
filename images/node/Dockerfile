FROM node:16-alpine3.14

ARG GROUP_ID
ARG USER_ID

RUN apk update && apk upgrade;

RUN apk --no-cache add shadow;

RUN groupmod -g $GROUP_ID node
RUN usermod -u $USER_ID -g $GROUP_ID node

RUN find / -group $GROUP_ID -exec chgrp -h node {} \;
RUN find / -user $USER_ID -exec chown -h node {} \;

RUN yarn global add @vue/cli

USER node

WORKDIR /home/node

EXPOSE 3000