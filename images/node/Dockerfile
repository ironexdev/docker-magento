FROM node:16-alpine3.14

ARG GROUP_ID
ARG USER_ID

RUN apk update && apk upgrade;

RUN apk --no-cache add shadow;

RUN groupmod -g $GROUP_ID node
RUN usermod -u $USER_ID -g $GROUP_ID node

RUN find / -group $GROUP_ID -exec chgrp -h node {} \;
RUN find / -user $USER_ID -exec chown -h node {} \;

RUN apk add --no-cache git

RUN yarn global add @vue/cli

RUN yarn global add @vue-storefront/cli

RUN apk add --no-cache git

RUN yarn global add @vue-storefront/cli

USER node

WORKDIR /home/node

EXPOSE 3000